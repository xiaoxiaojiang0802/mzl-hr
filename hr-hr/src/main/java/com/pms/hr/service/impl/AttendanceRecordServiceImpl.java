package com.pms.hr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pms.hr.domain.AttendanceRecord;
import com.pms.hr.mapper.AttendanceRecordMapper;
import com.pms.hr.service.AttendanceRecordService;
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
