package com.example.workers.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.example.common.actable.annotation.Column;
import com.example.common.actable.annotation.Table;
import com.example.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 奖惩对象 reward_punishment_record
 *
 * @author muzi
 * @date 2023-10-24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class RewardPunishmentRecord extends BaseEntity {

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
     * 奖惩日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(comment = "奖惩日期")
    private Date recordDate;

    /**
     * 奖惩类型
     */
    @Column(comment = "奖惩类型")
    private String type;

    /**
     * 奖惩原因
     */
    @Column(comment = "奖惩原因")
    private String reason;

    /**
     * 奖惩金额
     */
    @Column(comment = "奖惩金额")
    private BigDecimal amount;

    /**
     * 奖惩状态
     */
    @Column(comment = "奖惩状态")
    private String status;

}
