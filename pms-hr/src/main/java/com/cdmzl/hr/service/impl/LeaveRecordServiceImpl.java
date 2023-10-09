package com.cdmzl.hr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdmzl.hr.domain.LeaveRecord;
import com.cdmzl.hr.mapper.LeaveRecordMapper;
import com.cdmzl.hr.service.LeaveRecordService;
import org.springframework.stereotype.Service;

/**
 * 请假记录Service业务层处理
 *
 * @author muzi
 * @date 2023-10-09
 */
@Service
public class LeaveRecordServiceImpl extends ServiceImpl<LeaveRecordMapper, LeaveRecord> implements LeaveRecordService {

}
