package com.example.workers.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author muzi
 * @date 2023/10/24
 */
@Data
public class IndexVo {

    /**
     * 在职职工
     */
    private Integer workerNumber;

    /**
     * 奖惩金额
     */
    private BigDecimal amount;

    /**
     * 请假
     */
    private Integer leaveNumber;

    /**
     * 缺勤
     */
    private Integer absenceNumber;

}
