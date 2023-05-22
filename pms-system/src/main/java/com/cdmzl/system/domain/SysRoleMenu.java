package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Table;
import lombok.Data;

/**
 * 角色和菜单关联 sys_role_menu
 *
 * @author Lion Li
 */
@Data
@Table
@TableName("sys_role_menu")
public class SysRoleMenu {

    /**
     * 角色ID
     */
    @Column(isNull = false)
    private Long roleId;

    /**
     * 菜单ID
     */
    @Column(isNull = false)
    private Long menuId;

}
