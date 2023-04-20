package com.cdmzl.common.core.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.actable.annotation.Column;
import com.cdmzl.actable.constants.MySqlTypeConstant;
import com.cdmzl.common.core.domain.TreeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 部门表 sys_dept
 *
 * @author Lion Li
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_dept")
public class SysDept extends TreeEntity<SysDept> {
    private static final long serialVersionUID = 1L;

    /**
     * 部门ID
     */
    @TableId(value = "dept_id")
    private Long deptId;

    /**
     * 部门ID
     */
    @Column
    private Long parentId;

    /**
     * 部门名称
     */
    @Column
    @NotBlank(message = "部门名称不能为空")
    @Size(min = 0, max = 30, message = "部门名称长度不能超过30个字符")
    private String deptName;

    /**
     * 显示顺序
     */
    @Column
    @NotNull(message = "显示顺序不能为空")
    private Integer orderNum;

    /**
     * 负责人
     */
    @Column
    private String leader;

    /**
     * 联系电话
     */
    @Column
    @Size(min = 0, max = 11, message = "联系电话长度不能超过11个字符")
    private String phone;

    /**
     * 邮箱
     */
    @Column
    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    private String email;

    /**
     * 部门状态:0正常,1停用
     */
    @Column
    private String status;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @Column(type = MySqlTypeConstant.CHAR, length = 1, defaultValue = "0")
    @TableLogic
    private String delFlag;

    /**
     * 祖级列表
     */
    @Column
    private String ancestors;

}
