package com.hr.system.domain;

import lombok.Data;

import java.util.Date;

/**
 * 薪资记录实体类
 * @author LJJ
 * @date 2023/10/8
 */
@Data
public class SalaryRecord {
    /**
     * 薪资记录ID
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
     * 发放日期
     */
    private Date paymentDate;

    /**
     * 发放金额
     */
    private Double amount;

    /**
     * 发放类型，如基本工资、奖金、补贴等
     */
    private String paymentType;

    /**
     * 发放备注
     */
    private String remark;
}
