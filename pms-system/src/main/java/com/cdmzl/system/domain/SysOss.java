package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OSS对象存储对象
 *
 * @author ruoyi
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_oss")
public class SysOss extends BaseEntity {

    /**
     * 对象存储主键
     */
    @TableId(value = "oss_id")
    private Long ossId;

    /**
     * 文件名
     */
    @Column
    private String fileName;

    /**
     * 原名
     */
    @Column
    private String originalName;

    /**
     * 文件后缀名
     */
    @Column
    private String fileSuffix;

    /**
     * URL地址
     */
    @Column
    private String url;

    /**
     * 服务商
     */
    @Column
    private String service;

}
