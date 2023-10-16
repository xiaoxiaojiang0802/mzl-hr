package com.hr.common.core.domain.dto;

import lombok.Data;

/**
 * @author kenli
 * @date 2023-01-04
 */
@Data
public class SysUserDTO {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户昵称
     */
    private String nickName;

}
