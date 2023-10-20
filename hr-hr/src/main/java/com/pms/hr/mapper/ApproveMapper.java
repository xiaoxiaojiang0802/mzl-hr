package com.pms.hr.mapper;

import java.util.List;

import com.pms.common.core.mapper.BaseMapperPlus;
import com.pms.hr.domain.Approve;
import org.apache.ibatis.annotations.Mapper;

/**
 * 审批Mapper接口
 *
 * @author muzi
 * @date 2023-10-20
 */
@Mapper
public interface ApproveMapper extends BaseMapperPlus<ApproveMapper, Approve> {

}
