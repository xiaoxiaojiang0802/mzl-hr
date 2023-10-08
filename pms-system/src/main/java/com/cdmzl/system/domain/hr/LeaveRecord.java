package com.cdmzl.system.domain.hr;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cdmzl.common.actable.annotation.Table;
import lombok.Data;

import java.util.Date;

/**
 * 请假记录实体类
 *
 * @author muzi
 */
@Table
@Data
public class LeaveRecord {
    /**
     * 请假记录ID
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
     * 请假开始日期
     */
    private Date startDate;

    /**
     * 请假结束日期
     */
    private Date endDate;

    /**
     * 请假类型，如事假、病假、婚假等
     */
    private String leaveType;

    /**
     * 请假理由
     */
    private String reason;

    /**
     * 请假状态，如已申请、已批准、已驳回等
     */
    private String status;

    /**
     * 请假备注
     */
    private String remark;
}
