package com.example.system.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.common.actable.annotation.Column;
import com.example.common.actable.constants.MySqlTypeConstant;
import com.example.common.annotation.ExcelDictFormat;
import com.example.common.convert.ExcelDictConvert;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 系统访问记录表 sys_logininfor
 *
 * @author ruoyi
 */

@Data
@TableName("sys_logininfor")
@ExcelIgnoreUnannotated
public class SysLogininfor implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "序号")
    @TableId(value = "info_id")
    private Long infoId;

    /**
     * 用户账号
     */
    @Column
    @ExcelProperty(value = "用户账号")
    private String userName;

    /**
     * 登录状态 0成功 1失败
     */
    @Column
    @ExcelProperty(value = "登录状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_common_status")
    private String status;

    /**
     * 登录IP地址
     */
    @Column
    @ExcelProperty(value = "登录地址")
    private String ipaddr;

    /**
     * 登录地点
     */
    @Column
    @ExcelProperty(value = "登录地点")
    private String loginLocation;

    /**
     * 浏览器类型
     */
    @Column
    @ExcelProperty(value = "浏览器")
    private String browser;

    /**
     * 操作系统
     */
    @Column
    @ExcelProperty(value = "操作系统")
    private String os;

    /**
     * 提示消息
     */
    @Column
    @ExcelProperty(value = "提示消息")
    private String msg;

    /**
     * 访问时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    @ExcelProperty(value = "访问时间")
    private Date loginTime;

    /**
     * 请求参数
     */
    @TableField(exist = false)
    private Map<String, Object> params = new HashMap<>();

}
