package com.example.workers.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.example.common.actable.annotation.Column;
import com.example.common.actable.annotation.Table;
import com.example.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 请假记录对象 leave_record
 *
 * @author muzi
 * @date 2023-10-09
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class LeaveRecord extends BaseEntity {
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
     * 员工id
     */
    @Column(comment = "员工id")
    private String employeeId;

    /**
     * 请假开始日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(comment = "请假开始日期")
    private Date startDate;

    /**
     * 请假结束日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(comment = "请假结束日期")
    private Date endDate;

    /**
     * 请假类型，如事假、病假、婚假等
     */
    @Column(comment = "请假类型，如事假、病假、婚假等")
    private String leaveType;

    /**
     * 请假理由
     */
    @Column(comment = "请假理由")
    private String reason;

    /**
     * 请假状态，如已申请、已批准、已驳回等
     */
    @Column(comment = "请假状态，如已申请、已批准、已驳回等")
    private String status;

}
