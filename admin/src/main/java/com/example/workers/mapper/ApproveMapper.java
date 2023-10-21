package com.example.workers.mapper;

import com.example.common.core.mapper.BaseMapperPlus;
import com.example.workers.domain.Approve;
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
