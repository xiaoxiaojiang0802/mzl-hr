package com.hr.hr.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hr.common.core.controller.BaseController;
import com.hr.common.core.domain.R;
import com.hr.common.utils.poi.ExcelUtil;
import com.hr.hr.domain.LeaveRecord;
import com.hr.hr.service.LeaveRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 请假记录Controller
 *
 * @author muzi
 * @date 2023-10-09
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/hr/leave" )
public class LeaveRecordController extends BaseController {

    private final LeaveRecordService leaveRecordService;

    /**
     * 查询请假记录列表
     */
    @GetMapping("/page" )
    public R page(Page page, LeaveRecord leaveRecord) {
        return R.ok(leaveRecordService.page(page, Wrappers.query(leaveRecord)));
    }

    /**
     * 导出请假记录列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, LeaveRecord leaveRecord) {
        List<LeaveRecord> list = leaveRecordService.list(Wrappers.query(leaveRecord));
        ExcelUtil.exportExcel(list, "请假记录数据" , LeaveRecord.class, response);
    }

    /**
     * 获取请假记录详细信息
     */
    @GetMapping(value = "getById/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(leaveRecordService.getById(id));
    }

    /**
     * 新增请假记录
     */
    @PostMapping
    public R add(@RequestBody LeaveRecord leaveRecord) {
        return R.ok(leaveRecordService.save(leaveRecord));
    }

    /**
     * 修改请假记录
     */
    @PutMapping
    public R edit(@RequestBody LeaveRecord leaveRecord) {
        return R.ok(leaveRecordService.updateById(leaveRecord));
    }

    /**
     * 删除请假记录
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(leaveRecordService.removeByIds(ids));
    }
}
