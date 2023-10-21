package com.example.system.mapper;

import com.example.common.core.mapper.BaseMapperPlus;
import com.example.system.domain.SysUserRole;

import java.util.List;

/**
 * 用户与角色关联表 数据层
 *
 * @author ruoyi
 */
public interface SysUserRoleMapper extends BaseMapperPlus<SysUserRoleMapper, SysUserRole> {

    List<Long> selectUserIdsByRoleId(Long roleId);

}
