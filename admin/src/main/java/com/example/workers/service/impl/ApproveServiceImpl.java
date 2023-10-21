package com.example.workers.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.workers.domain.Approve;
import com.example.workers.mapper.ApproveMapper;
import com.example.workers.service.ApproveService;
import org.springframework.stereotype.Service;

/**
 * 审批Service业务层处理
 *
 * @author muzi
 * @date 2023-10-20
 */
@Service
public class ApproveServiceImpl extends ServiceImpl<ApproveMapper, Approve> implements ApproveService {

}
