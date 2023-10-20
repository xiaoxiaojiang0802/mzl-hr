package com.pms.system.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.pms.common.actable.annotation.Column;
import com.pms.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 对象存储配置对象 sys_oss_config
 *
 * @author ruoyi
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_oss_config")
public class SysOssConfig extends BaseEntity {

    /**
     * 主建
     */
    @TableId(value = "oss_config_id")
    private Long ossConfigId;

    /**
     * 配置key
     */
    @Column
    private String configKey;

    /**
     * accessKey
     */
    @Column
    private String accessKey;

    /**
     * 秘钥
     */
    @Column
    private String secretKey;

    /**
     * 桶名称
     */
    @Column
    private String bucketName;

    /**
     * 前缀
     */
    @Column
    private String prefix;

    /**
     * 访问站点
     */
    @Column
    private String endpoint;

    /**
     * 自定义域名
     */
    @Column
    private String domain;

    /**
     * 是否https（0否 1是）
     */
    @Column
    private String isHttps;

    /**
     * 域
     */
    @Column
    private String region;

    /**
     * 状态(0正常 1停用)
     */
    @Column
    private String status;

    /**
     * 扩展字段
     */
    @Column
    private String ext1;

    /**
     * 备注
     */
    @Column
    private String remark;

}
