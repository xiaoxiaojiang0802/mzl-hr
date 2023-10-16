package com.hr.common.actable.utils;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hr.common.actable.annotation.*;
import com.hr.common.actable.annotation.impl.ColumnImpl;
import com.hr.common.actable.command.JavaToMysqlType;
import com.hr.common.actable.command.MySqlTypeAndLength;
import com.hr.common.actable.constants.MySqlCharsetConstant;
import com.hr.common.actable.constants.MySqlEngineConstant;
import com.hr.common.actable.constants.MySqlTypeConstant;
import com.google.common.base.CaseFormat;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Date;

public class ColumnUtils {

    public static final String DEFAULT_VALUE = "DEFAULT";

    public static final String SQL_ESCAPE_CHARACTER = "`";

    public static String getTableName(Class<?> clasz) {
        Table tableName = clasz.getAnnotation(Table.class);
        TableName tableNamePlus = clasz.getAnnotation(TableName.class);
        EnableTimeSuffix enableTimeSuffix = clasz.getAnnotation(EnableTimeSuffix.class);
        if (!hasTableAnnotation(clasz)) {
            return null;
        }
        String finalTableName = "";
        if (tableName != null && !StringUtils.isEmpty(tableName.name())) {
            finalTableName = tableName.name();
        }
        if (tableName != null && !StringUtils.isEmpty(tableName.value())) {
            finalTableName = tableName.value();
        }
        if (tableNamePlus != null && !StringUtils.isEmpty(tableNamePlus.value())) {
            finalTableName = tableNamePlus.value();
        }
        if (StringUtils.isEmpty(finalTableName)) {
            // 都为空时采用类名按照驼峰格式转会为表名
            finalTableName = getBuildLowerName(clasz.getSimpleName());
        }
        if (null != enableTimeSuffix && enableTimeSuffix.value()) {
            finalTableName = appendTimeSuffix(finalTableName, enableTimeSuffix.pattern());
        }
        return finalTableName;
    }

    public static String getTableComment(Class<?> clasz) {
        Table table = clasz.getAnnotation(Table.class);
        TableComment tableComment = clasz.getAnnotation(TableComment.class);
        if (!hasTableAnnotation(clasz)) {
            return "";
        }
        if (table != null && !StringUtils.isEmpty(table.comment())) {
            return table.comment();
        }
        if (tableComment != null && !StringUtils.isEmpty(tableComment.value())) {
            return tableComment.value();
        }
        return "";
    }

    public static MySqlCharsetConstant getTableCharset(Class<?> clasz) {
        Table table = clasz.getAnnotation(Table.class);
        TableCharset charset = clasz.getAnnotation(TableCharset.class);
        if (!hasTableAnnotation(clasz)) {
            return null;
        }
        if (table != null && table.charset() != MySqlCharsetConstant.DEFAULT) {
            return table.charset();
        }
        if (charset != null && !StringUtils.isEmpty(charset.value())) {
            return charset.value();
        }
        return null;
    }

    public static MySqlEngineConstant getTableEngine(Class<?> clasz) {
        Table table = clasz.getAnnotation(Table.class);
        TableEngine engine = clasz.getAnnotation(TableEngine.class);
        if (!hasTableAnnotation(clasz)) {
            return null;
        }
        if (table != null && table.engine() != MySqlEngineConstant.DEFAULT) {
            return table.engine();
        }
        if (engine != null && !StringUtils.isEmpty(engine.value())) {
            return engine.value();
        }
        return null;
    }

    public static String getColumnName(Field field, Class<?> clasz) {
        Column column = getColumn(field, clasz);
        TableField tableField = field.getAnnotation(TableField.class);
        TableId tableId = field.getAnnotation(TableId.class);
        if (!hasColumnAnnotation(field, clasz)) {
            return null;
        }
        if (column != null && !StringUtils.isEmpty(column.name())) {
            return column.name().toLowerCase().replace(SQL_ESCAPE_CHARACTER, "");
        }
        if (column != null && !StringUtils.isEmpty(column.value())) {
            return column.value().toLowerCase().replace(SQL_ESCAPE_CHARACTER, "");
        }
        if (tableField != null && !StringUtils.isEmpty(tableField.value()) && tableField.exist()) {
            return tableField.value().toLowerCase().replace(SQL_ESCAPE_CHARACTER, "");
        }
        if (tableId != null && !StringUtils.isEmpty(tableId.value())) {
            return tableId.value().replace(SQL_ESCAPE_CHARACTER, "");
        }
        return getBuildLowerName(field.getName()).replace(SQL_ESCAPE_CHARACTER, "");
    }

    private static String getBuildLowerName(String name) {
        return CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE,
            name).toLowerCase();
    }

    public static boolean isKey(Field field, Class<?> clasz) {
        Column column = getColumn(field, clasz);
        if (!hasColumnAnnotation(field, clasz)) {
            return false;
        }
        IsKey isKey = field.getAnnotation(IsKey.class);
        TableId tableId = field.getAnnotation(TableId.class);
        if (null != isKey) {
            return true;
        } else if (column != null && column.isKey()) {
            return true;
        } else if (null != tableId) {
            return true;
        }
        return false;
    }

    public static boolean isAutoIncrement(Field field, Class<?> clasz) {
        Column column = getColumn(field, clasz);
        if (!hasColumnAnnotation(field, clasz)) {
            return false;
        }
        IsAutoIncrement isAutoIncrement = field.getAnnotation(IsAutoIncrement.class);
        if (null != isAutoIncrement) {
            return true;
        } else if (column != null && column.isAutoIncrement()) {
            return true;
        }
        return false;
    }

    public static Boolean isNull(Field field, Class<?> clasz) {
        Column column = getColumn(field, clasz);
        if (!hasColumnAnnotation(field, clasz)) {
            return true;
        }
        boolean iskey = isKey(field, clasz);
        // 主键默认为非空
        if (iskey) {
            return false;
        }

        IsNotNull isNotNull = field.getAnnotation(IsNotNull.class);
        if (null != isNotNull) {
            return false;
        } else if (column != null) {
            return column.isNull();
        }
        return true;
    }

    public static String getComment(Field field, Class<?> clasz) {
        Column column = getColumn(field, clasz);
        ApiModelProperty apiModelProperty = field.getAnnotation(ApiModelProperty.class);
        if (apiModelProperty != null && StringUtils.hasText(apiModelProperty.value())) {
            return apiModelProperty.value();
        }
        ColumnComment comment = field.getAnnotation(ColumnComment.class);
        if (!hasColumnAnnotation(field, clasz)) {
            return null;
        }
        if (column != null && !StringUtils.isEmpty(column.comment())) {
            return column.comment();
        }
        if (comment != null && !StringUtils.isEmpty(comment.value())) {
            return comment.value();
        }
        return "";
    }

    /**
     * 获取默认值
     *
     * @param field
     * @param clasz
     * @return
     */
    public static String getDefaultValue(Field field, Class<?> clasz) {
        Column column = getColumn(field, clasz);
        DefaultValue defaultValue = field.getAnnotation(DefaultValue.class);
        if (!hasColumnAnnotation(field, clasz)) {
            return null;
        }
        if (column != null && !DEFAULT_VALUE.equals(column.defaultValue())) {
            return column.defaultValue();
        }
        if (defaultValue != null) {
            return defaultValue.value();
        }
        return null;
    }

    public static boolean getDefaultValueNative(Field field, Class<?> clasz) {
        IsNativeDefValue isNativeDefValue = field.getAnnotation(IsNativeDefValue.class);
        if (isNativeDefValue != null) {
            return isNativeDefValue.value();
        }
        return !"class java.lang.String".equals(field.getGenericType().toString())
            && !"char".equals(field.getGenericType().toString())
            && !"class java.lang.Boolean".equals(field.getGenericType().toString())
            && !"boolean".equals(field.getGenericType().toString());
    }

    public static MySqlTypeAndLength getMySqlTypeAndLength(Field field, Class<?> clasz) {
        Column column = getColumn(field, clasz);
        ColumnType type = field.getAnnotation(ColumnType.class);
        if (!hasColumnAnnotation(field, clasz)) {
            throw new RuntimeException("字段名：" + field.getName() + "没有字段标识的注解，异常抛出！");
        }
        if (column != null && column.type() != MySqlTypeConstant.DEFAULT) {
            return buildMySqlTypeAndLength(field, column.type().toString().toLowerCase(), column.length(), column.decimalLength());
        }
        if (type != null && type.value() != null && type.value() != MySqlTypeConstant.DEFAULT) {
            return buildMySqlTypeAndLength(field, type.value().toString().toLowerCase(), type.length(), type.decimalLength());
        }
        // 类型为空根据字段类型去默认匹配类型
        MySqlTypeConstant mysqlType = JavaToMysqlType.javaToMysqlTypeMap.get(field.getGenericType().toString());
        if (mysqlType == null) {
            throw new RuntimeException("字段名：" + field.getName() + "不支持" + field.getGenericType().toString() + "类型转换到mysql类型，仅支持JavaToMysqlType类中的类型默认转换，异常抛出！");
        }
        String sqlType = mysqlType.toString().toLowerCase();
        // 默认类型可以使用column来设置长度
        if (column != null) {
            return buildMySqlTypeAndLength(field, sqlType, column.length(), column.decimalLength());
        }
        // 默认类型可以使用type来设置长度
        if (type != null) {
            return buildMySqlTypeAndLength(field, sqlType, type.length(), type.decimalLength());
        }
        return buildMySqlTypeAndLength(field, sqlType, 255, 0);
    }

    private static MySqlTypeAndLength buildMySqlTypeAndLength(Field field, String type, int length, int decimalLength) {
        MySqlTypeAndLength mySqlTypeAndLength = MySqlTypeConstant.mySqlTypeAndLengthMap.get(type);
        if (mySqlTypeAndLength == null) {
            throw new RuntimeException("字段名：" + field.getName() + "使用的" + type + "类型，没有配置对应的MySqlTypeConstant，只支持创建MySqlTypeConstant中类型的字段，异常抛出！");
        }
        MySqlTypeAndLength targetMySqlTypeAndLength = new MySqlTypeAndLength();
        BeanUtils.copyProperties(mySqlTypeAndLength, targetMySqlTypeAndLength);
        if (length != 255) {
            targetMySqlTypeAndLength.setLength(length);
        }
        if (decimalLength != 0) {
            targetMySqlTypeAndLength.setDecimalLength(decimalLength);
        }
        return targetMySqlTypeAndLength;
    }

    public static boolean hasTableAnnotation(Class<?> clasz) {
        Table tableName = clasz.getAnnotation(Table.class);
        TableName tableNamePlus = clasz.getAnnotation(TableName.class);
        return tableName != null || tableNamePlus != null;
    }

    public static boolean hasIgnoreTableAnnotation(Class<?> clasz) {
        IgnoreTable ignoreTable = clasz.getAnnotation(IgnoreTable.class);
        return ignoreTable != null;
    }

    public static boolean hasColumnAnnotation(Field field, Class<?> clasz) {
        // 是否开启simple模式
        boolean isSimple = isSimple(clasz);
        // 不参与建表的字段
        String[] excludeFields = excludeFields(clasz);
        // 当前属性名在排除建表的字段内
        if (Arrays.asList(excludeFields).contains(field.getName())) {
            return false;
        }
        Column column = field.getAnnotation(Column.class);
        TableField tableField = field.getAnnotation(TableField.class);
        IsKey isKey = field.getAnnotation(IsKey.class);
        TableId tableId = field.getAnnotation(TableId.class);
        if (tableField != null) {
            return tableField.exist();
        } else {
            return true;
        }
//        if (column == null && isKey == null && tableId == null) {
//            // 开启了simple模式
//            return isSimple;
//        }
//        return true;
    }

    private static Column getColumn(Field field, Class<?> clasz) {
        // 不参与建表的字段
        String[] excludeFields = excludeFields(clasz);
        if (Arrays.asList(excludeFields).contains(field.getName())) {
            return null;
        }
        Column column = field.getAnnotation(Column.class);
        if (column != null) {
            return column;
        }
        // 是否开启simple模式
        boolean isSimple = isSimple(clasz);
        // 开启了simple模式
        if (isSimple) {
            return new ColumnImpl();
        }
        return null;
    }

    /**
     * 获取到忽略字段
     *
     * @param clasz
     * @return
     */
    private static String[] excludeFields(Class<?> clasz) {
        String[] excludeFields = {"serialVersionUID"};
        Table tableName = clasz.getAnnotation(Table.class);
        if (tableName != null) {
            excludeFields = tableName.excludeFields();
        }
        return excludeFields;
    }

    private static boolean isSimple(Class<?> clasz) {
        boolean isSimple = false;
        Table tableName = clasz.getAnnotation(Table.class);
        if (tableName != null) {
            isSimple = tableName.isSimple();
        }
        return isSimple;
    }


    /**
     * 添加时间后缀
     *
     * @param tableName 表名
     * @param pattern   时间格式
     */
    public static String appendTimeSuffix(String tableName, String pattern) {
        String suffix = "";
        try {
            suffix = DateFormatUtils.format(new Date(), pattern);
        } catch (Exception e) {
            throw new RuntimeException("无法转换时间格式" + pattern);
        }
        return tableName + "_" + suffix;
    }
}
