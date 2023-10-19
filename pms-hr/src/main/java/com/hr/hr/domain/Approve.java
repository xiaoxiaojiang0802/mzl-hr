package com.hr.hr.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.hr.common.actable.annotation.Column;
import com.hr.common.actable.annotation.Table;
import com.hr.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class Approve extends BaseEntity {

    @TableId
    private Long approvedId;

    @Column(comment = "标题")
    private String title;

    @Column(comment = "审批类型")
    private String type;

    @Column(comment = "申请人")
    private String applicant;

    @Column(comment = "状态")
    private String status;

    @Column(comment = "当前审批人")
    private Long approvedUser;


}
