package com.cdmzl.hr.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.core.domain.BaseEntity;
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
public class AttendanceRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    private Long id;

    /**
     * 员工姓名
     */
    @Column(comment = "员工姓名" )
    private String employeeName;

    /**
     * 所属部门
     */
    @Column(comment = "所属部门" )
    private String department;

    /**
     * 打卡日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd" )
    @Column(comment = "打卡日期" )
    private Date date;

    /**
     * 打卡开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd" )
    @Column(comment = "打卡开始时间" )
    private Date startTime;

    /**
     * 打卡结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd" )
    @Column(comment = "打卡结束时间" )
    private Date endTime;

    /**
     * 打卡状态
     */
    @Column(comment = "打卡状态" )
    private String status;

}
