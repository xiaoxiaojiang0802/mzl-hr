package com.cdmzl.hr.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.hr.domain.AttendanceRecord;
import com.cdmzl.hr.service.AttendanceRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 打卡记录Controller
 *
 * @author muzi
 * @date 2023-10-09
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/hr/attendance" )
public class AttendanceRecordController extends BaseController {

    private final  AttendanceRecordService attendanceRecordService;

    /**
     * 查询打卡记录列表
     */
    @GetMapping("/page" )
    public R page(Page page, AttendanceRecord attendanceRecord) {
        return R.ok(attendanceRecordService.page(page, Wrappers.query(attendanceRecord)));
    }

    /**
     * 导出打卡记录列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, AttendanceRecord attendanceRecord) {
        List<AttendanceRecord> list = attendanceRecordService.list(Wrappers.query(attendanceRecord));
        ExcelUtil.exportExcel(list, "打卡记录数据", AttendanceRecord.class, response);
    }

    /**
     * 获取打卡记录详细信息
     */
    @GetMapping(value = "getById/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(attendanceRecordService.getById(id));
    }

    /**
     * 新增打卡记录
     */
    @PostMapping
    public R add(@RequestBody AttendanceRecord attendanceRecord) {
        return R.ok(attendanceRecordService.save(attendanceRecord));
    }

    /**
     * 修改打卡记录
     */
    @PutMapping
    public R edit(@RequestBody AttendanceRecord attendanceRecord) {
        return R.ok(attendanceRecordService.updateById(attendanceRecord));
    }

    /**
     * 删除打卡记录
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(attendanceRecordService.removeByIds(ids));
    }
}