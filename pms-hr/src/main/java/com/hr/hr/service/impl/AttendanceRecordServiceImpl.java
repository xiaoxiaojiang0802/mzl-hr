package com.hr.hr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hr.hr.domain.AttendanceRecord;
import com.hr.hr.mapper.AttendanceRecordMapper;
import com.hr.hr.service.AttendanceRecordService;
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
