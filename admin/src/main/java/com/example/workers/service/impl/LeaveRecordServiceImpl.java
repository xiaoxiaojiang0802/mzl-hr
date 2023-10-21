package com.example.workers.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.workers.domain.LeaveRecord;
import com.example.workers.mapper.LeaveRecordMapper;
import com.example.workers.service.LeaveRecordService;
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
