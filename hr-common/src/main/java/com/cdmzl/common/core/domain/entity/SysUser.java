package com.cdmzl.common.core.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.cdmzl.actable.annotation.Column;
import com.cdmzl.actable.annotation.Like;
import com.cdmzl.actable.constants.MySqlTypeConstant;
import com.cdmzl.common.annotation.Sensitive;
import com.cdmzl.common.constant.UserConstants;
import com.cdmzl.common.core.domain.BaseEntity;
import com.cdmzl.common.enums.SensitiveStrategy;
import com.cdmzl.common.xss.Xss;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

/**
 * 用户对象 sys_user
 *
 * @author Lion Li
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("sys_user")
public class SysUser extends BaseEntity {

    /**
     * 用户ID
     */
    @TableId(value = "user_id")
    private Long userId;

    /**
     * 部门ID
     */
    @Column
    private Long deptId;

    /**
     * 用户账号
     */
    @Column
    @Xss(message = "用户账号不能包含脚本字符")
    @NotBlank(message = "用户账号不能为空")
    @Size(min = 0, max = 30, message = "用户账号长度不能超过30个字符")
    private String userName;

    /**
     * 用户昵称
     */
    @Column
    @Like
    @Xss(message = "用户昵称不能包含脚本字符")
    @Size(min = 0, max = 30, message = "用户昵称长度不能超过30个字符")
    private String nickName;

    /**
     * 用户类型（sys_user系统用户）
     */
    @Column
    private String userType;

    /**
     * 用户邮箱
     */
    @Column
    @Sensitive(strategy = SensitiveStrategy.EMAIL)
    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    private String email;

    /**
     * 手机号码
     */
    @Column
    @Sensitive(strategy = SensitiveStrategy.PHONE)
    private String phonenumber;

    /**
     * 用户性别
     */
    @Column
    private String sex;

    /**
     * 用户头像
     */
    @Column
    private String avatar;

    /**
     * 密码
     */
    @Column
    @TableField(
        insertStrategy = FieldStrategy.NOT_EMPTY,
        updateStrategy = FieldStrategy.NOT_EMPTY,
        whereStrategy = FieldStrategy.NOT_EMPTY
    )
    private String password;

    /**
     * 帐号状态（0正常 1停用）
     */
    @Column
    private String status;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @Column(type = MySqlTypeConstant.CHAR, length = 1, defaultValue = "0")
    @TableField
    @TableLogic
    private String delFlag;

    /**
     * 最后登录IP
     */
    @Column
    private String loginIp;

    /**
     * 最后登录时间
     */
    @Column
    private Date loginDate;

    /**
     * 备注
     */
    @Column
    private String remark;

    /**
     * 部门对象
     */
    @TableField(exist = false)
    private SysDept dept;

    /**
     * 角色对象
     */
    @TableField(exist = false)
    private List<SysRole> roles;

    /**
     * 角色组
     */
    @TableField(exist = false)
    private Long[] roleIds;

    /**
     * 岗位组
     */
    @TableField(exist = false)
    private Long[] postIds;

    /**
     * 数据权限 当前角色ID
     */
    @TableField(exist = false)
    private Long roleId;

    public SysUser(Long userId) {
        this.userId = userId;
    }

    public boolean isAdmin() {
        return UserConstants.ADMIN_ID.equals(this.userId);
    }

}
