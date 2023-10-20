package com.pms.common.core.domain.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.pms.common.actable.annotation.Column;
import com.pms.common.annotation.ExcelDictFormat;
import com.pms.common.convert.ExcelDictConvert;
import com.pms.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 字典类型表 sys_dict_type
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_dict_type")
@ExcelIgnoreUnannotated
public class SysDictType extends BaseEntity {

    /**
     * 字典主键
     */
    @ExcelProperty(value = "字典主键")
    @TableId(value = "dict_id")
    private Long dictId;

    /**
     * 字典名称
     */
    @Column
    @ExcelProperty(value = "字典名称")
    @NotBlank(message = "字典名称不能为空")
    @Size(min = 0, max = 100, message = "字典类型名称长度不能超过100个字符")
    private String dictName;

    /**
     * 字典类型
     */
    @Column
    @ExcelProperty(value = "字典类型")
    @NotBlank(message = "字典类型不能为空")
    @Size(min = 0, max = 100, message = "字典类型类型长度不能超过100个字符")
    @Pattern(regexp = "^[a-z][a-z0-9_]*$", message = "字典类型必须以字母开头，且只能为（小写字母，数字，下滑线）")
    private String dictType;

    /**
     * 状态（0正常 1停用）
     */
    @Column
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_normal_disable")
    private String status;

    /**
     * 备注
     */
    @Column
    private String remark;

    @TableField(exist = false)
    private List<SysDictData> dictDataList;

}
