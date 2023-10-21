package com.example.workers.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.core.controller.BaseController;
import com.example.common.core.domain.R;
import com.example.common.utils.poi.ExcelUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.workers.domain.Approve;
import com.example.workers.service.ApproveService;
import lombok.RequiredArgsConstructor;

/**
 * 审批Controller
 *
 * @author muzi
 * @date 2023-10-20
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/hr/approve" )
public class ApproveController extends BaseController {

    private final  ApproveService approveService;

    /**
     * 查询审批列表
     */
    @GetMapping("/page" )
    public R page(Page page, Approve approve) {
        return R.ok(approveService.page(page, Wrappers.query(approve)));
    }

    /**
     * 导出审批列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, Approve approve) {
        List<Approve> list = approveService.list(Wrappers.query(approve));
        ExcelUtil<Approve> util = new ExcelUtil<Approve>(Approve. class);
        util.exportExcel(response, list, "审批数据" );
    }

    /**
     * 获取审批详细信息
     */
    @GetMapping(value = "getById/{approvedId}" )
    public R getById(@PathVariable("approvedId" ) Long approvedId) {
        return R.ok(approveService.getById(approvedId));
    }

    /**
     * 新增审批
     */
    @PostMapping
    public R add(@RequestBody Approve approve) {
        return R.ok(approveService.save(approve));
    }

    /**
     * 修改审批
     */
    @PutMapping
    public R edit(@RequestBody Approve approve) {
        return R.ok(approveService.updateById(approve));
    }

    /**
     * 删除审批
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(approveService.removeByIds(ids));
    }
}
