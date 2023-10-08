package com.cdmzl.system.domain;

import lombok.Data;

import java.util.Date;

/**
 * 绩效记录实体类
 * @author LJJ
 */
@Data
public class PerformanceRecord {
    /**
     * 绩效记录ID
     */
    private Long id;

    /**
     * 员工姓名
     */
    private String employeeName;

    /**
     * 所属部门
     */
    private String department;

    /**
     * 绩效周期
     */
    private Date period;

    /**
     * 绩效评分
     */
    private Integer score;

    /**
     * 绩效评语
     */
    private String comment;

    /**
     * 绩效状态，如未评价、已完成等
     */
    private String status;

    /**
     * 绩效备注
     */
    private String remark;
}
