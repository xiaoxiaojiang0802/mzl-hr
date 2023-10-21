package com.example.workers.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.core.controller.BaseController;
import com.example.common.core.domain.R;
import com.example.workers.domain.PerformanceRecord;
import com.example.workers.service.PerformanceRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 绩效记录Controller
 *
 * @author muzi
 * @date 2023-10-09
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/hr/performance" )
public class PerformanceRecordController extends BaseController {

    private final PerformanceRecordService performanceRecordService;

    /**
     * 查询绩效记录列表
     */
    @GetMapping("/page" )
    public R page(Page page, PerformanceRecord performanceRecord) {
        return R.ok(performanceRecordService.page(page, Wrappers.query(performanceRecord)));
    }


    /**
     * 获取绩效记录详细信息
     */
    @GetMapping(value = "getById/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(performanceRecordService.getById(id));
    }

    /**
     * 新增绩效记录
     */
    @PostMapping
    public R add(@RequestBody PerformanceRecord performanceRecord) {
        return R.ok(performanceRecordService.save(performanceRecord));
    }

    /**
     * 修改绩效记录
     */
    @PutMapping
    public R edit(@RequestBody PerformanceRecord performanceRecord) {
        return R.ok(performanceRecordService.updateById(performanceRecord));
    }

    /**
     * 删除绩效记录
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(performanceRecordService.removeByIds(ids));
    }
}
