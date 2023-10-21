package com.example.workers.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.workers.domain.PerformanceRecord;
import com.example.workers.mapper.PerformanceRecordMapper;
import com.example.workers.service.PerformanceRecordService;
import org.springframework.stereotype.Service;

/**
 * 绩效记录Service业务层处理
 *
 * @author muzi
 * @date 2023-10-09
 */
@Service
public class PerformanceRecordServiceImpl extends ServiceImpl<PerformanceRecordMapper, PerformanceRecord> implements PerformanceRecordService {

}
