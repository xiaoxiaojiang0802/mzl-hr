package com.example.workers.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.core.controller.BaseController;
import com.example.common.core.domain.R;
import com.example.common.utils.poi.ExcelUtil;
import com.example.workers.domain.RewardPunishmentRecord;
import com.example.workers.service.RewardPunishmentRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 奖惩Controller
 *
 * @author muzi
 * @date 2023-10-24
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/example/reward" )
public class RewardPunishmentRecordController extends BaseController {

    private final  RewardPunishmentRecordService rewardPunishmentRecordService;

    /**
     * 查询奖惩列表
     */
    @GetMapping("/page" )
    public R page(Page page, RewardPunishmentRecord rewardPunishmentRecord) {
        return R.ok(rewardPunishmentRecordService.page(page, Wrappers.query(rewardPunishmentRecord)));
    }

    /**
     * 导出奖惩列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, RewardPunishmentRecord rewardPunishmentRecord) {
        List<RewardPunishmentRecord> list = rewardPunishmentRecordService.list(Wrappers.query(rewardPunishmentRecord));
        ExcelUtil<RewardPunishmentRecord> util = new ExcelUtil<RewardPunishmentRecord>(RewardPunishmentRecord. class);
        util.exportExcel(response, list, "奖惩数据" );
    }

    /**
     * 获取奖惩详细信息
     */
    @GetMapping(value = "getById/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(rewardPunishmentRecordService.getById(id));
    }

    /**
     * 新增奖惩
     */
    @PostMapping
    public R add(@RequestBody RewardPunishmentRecord rewardPunishmentRecord) {
        return R.ok(rewardPunishmentRecordService.save(rewardPunishmentRecord));
    }

    /**
     * 修改奖惩
     */
    @PutMapping
    public R edit(@RequestBody RewardPunishmentRecord rewardPunishmentRecord) {
        return R.ok(rewardPunishmentRecordService.updateById(rewardPunishmentRecord));
    }

    /**
     * 删除奖惩
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(rewardPunishmentRecordService.removeByIds(ids));
    }
}
