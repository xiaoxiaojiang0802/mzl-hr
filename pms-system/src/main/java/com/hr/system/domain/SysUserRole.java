package com.hr.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.hr.common.actable.annotation.Column;
import lombok.Data;

/**
 * 用户和角色关联 sys_user_role
 *
 * @author ruoyi
 */
@Data
@TableName("sys_user_role")
public class SysUserRole {

    /**
     * 用户ID
     */
    @Column(isKey = true)
    private Long userId;

    /**
     * 角色ID
     */
    @Column(isKey = true)
    private Long roleId;

}
