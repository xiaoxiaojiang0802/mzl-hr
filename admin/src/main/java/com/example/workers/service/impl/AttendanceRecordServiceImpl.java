package com.example.workers.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.workers.domain.AttendanceRecord;
import com.example.workers.mapper.AttendanceRecordMapper;
import com.example.workers.service.AttendanceRecordService;
import org.springframework.stereotype.Service;

/**
 * 打卡记录Service业务层处理
 *
 * @author muzi
 * @date 2023-10-09
 */
@Service
public class AttendanceRecordServiceImpl extends ServiceImpl<AttendanceRecordMapper, AttendanceRecord> implements AttendanceRecordService {

}
