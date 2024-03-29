package com.example.web.controller.system;

import com.example.common.annotation.Anonymous;
import com.example.common.config.RuoYiConfig;
import com.example.common.utils.StringUtils;
import com.example.system.service.ISysDeptService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 首页
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@RestController
public class SysIndexController {

    /**
     * 系统基础配置
     */
    private final RuoYiConfig ruoyiConfig;

    private final ISysDeptService sysDeptService;

    /**
     * 访问首页，提示语
     */
    @Anonymous
    @GetMapping("/index")
    public String index() {
        return StringUtils.format("欢迎使用{}后台管理框架，当前版本：v{}，请通过前端地址访问。", ruoyiConfig.getName(), ruoyiConfig.getVersion());
    }

    /**
     * 系统info
     */
    @Anonymous
    @GetMapping("/getIndex")
    public String getIndex() {
        return sysDeptService.getInfo();
    }


}
