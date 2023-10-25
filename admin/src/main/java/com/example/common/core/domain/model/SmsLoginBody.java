package com.example.common.core.domain.model;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 短信登录对象
 *
 * @author ruoyi
 */

@Data
public class SmsLoginBody {

    /**
     * 用户名
     */
    @NotBlank(message = "{user.phoneNumber.not.blank}")
    private String phoneNumber;

    /**
     * 用户密码
     */
    @NotBlank(message = "{sms.code.not.blank}")
    private String smsCode;

}
