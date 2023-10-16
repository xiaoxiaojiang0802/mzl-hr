package com.hr.hr.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.hr.common.actable.annotation.Column;
import com.hr.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 绩效记录对象 performance_record
 *
 * @author muzi
 * @date 2023-10-09
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class PerformanceRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    private Long id;

    /**
     * 员工姓名
     */
    @Column(comment = "员工姓名")
    private String employeeName;

    /**
     * 所属部门
     */
    @Column(comment = "所属部门")
    private String department;

    /**
     * 绩效周期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(comment = "绩效周期")
    private Date period;

    /**
     * 绩效评分
     */
    @Column(comment = "绩效评分")
    private Long score;

    /**
     * 绩效评语
     */
    @Column(comment = "绩效评语")
    private String comment;

    /**
     * 绩效状态
     */
    @Column(comment = "绩效状态")
    private String status;

}
