package com.example.system.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.common.actable.annotation.Column;
import com.example.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OSS对象存储对象
 *
 * @author ruoyi
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_file")
public class SysFile extends BaseEntity {

    /**
     * 对象存储主键
     */
    @TableId(value = "file_id")
    private Long fileId;

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
