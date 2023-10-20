package com.pms.hr.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.pms.common.actable.annotation.Column;
import com.pms.common.actable.annotation.Table;
import com.pms.common.core.domain.BaseEntity;
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
@Table
public class PerformanceRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    private Long id;

    /**
     * 员工ID
     */
    @Column(comment = "员工ID")
    private String employeeId;

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
     * 工作阐述
     */
    @Column(comment = "工作阐述")
    private String expound;

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
