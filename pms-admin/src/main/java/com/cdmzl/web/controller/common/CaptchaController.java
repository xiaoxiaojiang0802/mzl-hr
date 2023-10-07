package com.cdmzl.web.controller.common;

import cn.hutool.captcha.AbstractCaptcha;
import cn.hutool.captcha.generator.CodeGenerator;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.IdUtil;
import com.cdmzl.common.annotation.Anonymous;
import com.cdmzl.common.constant.CacheConstants;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.enums.CaptchaType;
import com.cdmzl.common.utils.StringUtils;
import com.cdmzl.common.utils.redis.CacheUtils;
import com.cdmzl.common.utils.reflect.ReflectUtils;
import com.cdmzl.common.utils.spring.SpringUtils;
import com.cdmzl.framework.config.properties.CaptchaProperties;
import com.cdmzl.system.service.ISysConfigService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotBlank;
import java.util.HashMap;
import java.util.Map;

/**
 * 验证码操作处理
 *
 * @author ruoyi
 */
@Anonymous
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
public class CaptchaController {

    private final CaptchaProperties captchaProperties;
    //    private final SmsProperties smsProperties;
    private final ISysConfigService configService;

    /**
     * 短信验证码
     *
     * @param phonenumber 用户手机号
     */
    @GetMapping("/captchaSms")
    public R<Void> smsCaptcha(@NotBlank(message = "{user.phonenumber.not.blank}")
                                  String phonenumber) {
//        if (!smsProperties.getEnabled()) {
//            return R.fail("当前系统没有开启短信功能！");
//        }
//        String key = CacheConstants.CAPTCHA_CODE_KEY + phonenumber;
//        String code = RandomUtil.randomNumbers(4);
//        RedisUtils.setCacheObject(key, code, Duration.ofMinutes(Constants.CAPTCHA_EXPIRATION));
//        // 验证码模板id 自行处理 (查数据库或写死均可)
//        String templateId = "";
//        Map<String, String> map = new HashMap<>(1);
//        map.put("code", code);
//        SmsTemplate smsTemplate = SpringUtils.getBean(SmsTemplate.class);
//        SmsResult result = smsTemplate.send(phonenumber, templateId, map);
//        if (!result.isSuccess()) {
//            log.error("验证码短信发送异常 => {}", result);
//            return R.fail(result.getMessage());
//        }
        return R.ok();
    }

    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public R<Map<String, Object>> getCode() {
        Map<String, Object> ajax = new HashMap<>();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled) {
            return R.ok(ajax);
        }
        // 保存验证码信息
        String uuid = IdUtil.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;
        // 生成验证码
        CaptchaType captchaType = captchaProperties.getType();
        boolean isMath = CaptchaType.MATH == captchaType;
        Integer length = isMath ? captchaProperties.getNumberLength() : captchaProperties.getCharLength();
        CodeGenerator codeGenerator = ReflectUtils.newInstance(captchaType.getClazz(), length);
        AbstractCaptcha captcha = SpringUtils.getBean(captchaProperties.getCategory().getClazz());
        captcha.setGenerator(codeGenerator);
        captcha.createCode();
        String code = isMath ? getCodeResult(captcha.getCode()) : captcha.getCode();
        CacheUtils.put(verifyKey, code);
        ajax.put("uuid", uuid);
        ajax.put("img", captcha.getImageBase64());
        return R.ok(ajax);
    }

    private String getCodeResult(String capStr) {
        int numberLength = captchaProperties.getNumberLength();
        int a = Convert.toInt(StringUtils.substring(capStr, 0, numberLength).trim());
        char operator = capStr.charAt(numberLength);
        int b = Convert.toInt(StringUtils.substring(capStr, numberLength + 1, numberLength + 1 + numberLength).trim());
        switch (operator) {
            case '*':
                return Convert.toStr(a * b);
            case '+':
                return Convert.toStr(a + b);
            case '-':
                return Convert.toStr(a - b);
            default:
                return StringUtils.EMPTY;
        }
    }

}
