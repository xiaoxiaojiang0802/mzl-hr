package com.hr.hr.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.hr.common.actable.annotation.Column;
import com.hr.common.actable.annotation.Table;
import com.hr.common.annotation.Excel;
import com.hr.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 打卡记录对象 attendance_record
 *
 * @author muzi
 * @date 2023-10-09
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class AttendanceRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    private Long id;

    /**
     * 工号
     */
    @Excel(name = "工号")
    @Column(comment = "工号")
    private String employeeNumber;

    /**
     * 员工姓名
     */
    @Excel(name = "员工姓名")
    @Column(comment = "员工姓名")
    private String employeeName;

    /**
     * 打卡日期
     */
    @Excel(name = "打卡日期", dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(comment = "打卡日期")
    private Date date;

}
