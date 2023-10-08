package com.cdmzl.system.domain.hr;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cdmzl.common.actable.annotation.Table;
import lombok.Data;

import java.util.Date;

/**
 * 打卡记录
 *
 * @author muzi
 */
@Data
@Table
public class AttendanceRecord {
    /**
     * 打卡记录ID
     */
    @TableId
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
     * 打卡日期
     */
    private Date date;

    /**
     * 打卡开始时间
     */
    private String startTime;

    /**
     * 打卡结束时间
     */
    private String endTime;

    /**
     * 打卡状态，如正常打卡、迟到、早退等
     */
    private String status;

    /**
     * 打卡备注
     */
    private String remark;
}
