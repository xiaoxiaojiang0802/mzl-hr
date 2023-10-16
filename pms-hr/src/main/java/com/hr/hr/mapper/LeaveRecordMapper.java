package com.hr.hr.mapper;

import com.hr.common.core.mapper.BaseMapperPlus;
import com.hr.hr.domain.LeaveRecord;
import org.apache.ibatis.annotations.Mapper;

/**
 * 请假记录Mapper接口
 *
 * @author muzi
 * @date 2023-10-09
 */
@Mapper
public interface LeaveRecordMapper extends BaseMapperPlus<LeaveRecordMapper, LeaveRecord> {

}
