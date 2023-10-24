package com.example.workers.controller;

import com.example.common.core.domain.R;
import com.example.workers.service.IndexService;
import com.example.workers.vo.IndexVo;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author muzi
 * @date 2023/10/24
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/workers/index")
public class IndexController {

    private final IndexService indexService;

    /**
     * 查询首页运行情况
     *
     * @return 系统信息
     */
    @GetMapping("/selectIndex")
    public R<IndexVo> selectIndex() {
        return R.ok(indexService.selectIndex());
    }
}
