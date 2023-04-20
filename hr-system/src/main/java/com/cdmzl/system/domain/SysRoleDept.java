package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.actable.annotation.Column;
import lombok.Data;

/**
 * 角色和部门关联 sys_role_dept
 *
 * @author Lion Li
 */

@Data
@TableName("sys_role_dept")
public class SysRoleDept {

    /**
     * 角色ID
     */
    @Column(isNull = false)
    private Long roleId;

    /**
     * 部门ID
     */
    @Column(isNull = false)
    private Long deptId;

}
