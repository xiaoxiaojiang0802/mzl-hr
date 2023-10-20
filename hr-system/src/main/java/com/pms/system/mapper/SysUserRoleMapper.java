package com.pms.system.mapper;

import com.pms.common.core.mapper.BaseMapperPlus;
import com.pms.system.domain.SysUserRole;

import java.util.List;

/**
 * 用户与角色关联表 数据层
 *
 * @author ruoyi
 */
public interface SysUserRoleMapper extends BaseMapperPlus<SysUserRoleMapper, SysUserRole> {

    List<Long> selectUserIdsByRoleId(Long roleId);

}
