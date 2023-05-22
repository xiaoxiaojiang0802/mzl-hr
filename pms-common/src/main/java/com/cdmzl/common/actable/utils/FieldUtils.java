package com.cdmzl.common.actable.utils;

import cn.hutool.core.date.DateUtil;
import com.cdmzl.common.actable.utils.CommonUtil;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author xiaojiang
 */
@Slf4j
public class FieldUtils {

    public static <T> Field getKeyField(T obj) {
        Field[] allFields = getAllFields(obj);
        for (Field field : allFields) {
            // 设置访问权限
            field.setAccessible(true);
            if (ColumnUtils.isKey(field, obj.getClass())) {
                return field;
            }
        }
        return null;
    }

    public static <T> Field[] getAllFields(T obj) {
        Field[] declaredFields = obj.getClass().getDeclaredFields();

        // 递归扫描父类的filed
        declaredFields = recursionParents(obj.getClass(), declaredFields);
        return declaredFields;
    }

    /**
     * 递归扫描父类的fields
     *
     * @param clas
     * @param fields
     */
    @SuppressWarnings("rawtypes")
    public static Field[] recursionParents(Class<?> clas, Field[] fields) {
        if (clas.getSuperclass() != null) {
            Class clsSup = clas.getSuperclass();
            List<Field> fieldList = new ArrayList<Field>();
            fieldList.addAll(Arrays.asList(fields));
            fieldList.addAll(Arrays.asList(clsSup.getDeclaredFields()));
            fields = new Field[fieldList.size()];
            int i = 0;
            for (Object field : fieldList.toArray()) {
                fields[i] = (Field) field;
                i++;
            }
            fields = recursionParents(clsSup, fields);
        }
        return fields;
    }

    /**
     * 给对象赋值
     *
     * @param fieldValue  数值
     * @param newInstance 对象
     * @param field       field
     * @param <T>         t
     */
    public static <T> void buildFieldValue(Object fieldValue, T newInstance, Field field) {
        try {
            String fieldValueStr = com.cdmzl.common.actable.utils.CommonUtil.toString(fieldValue);
            String typeName = field.getType().toString();
            switch (typeName) {
                case "class java.time.LocalDateTime":
                    field.set(newInstance, Timestamp.valueOf(fieldValueStr).toLocalDateTime());
                    break;
                case "class java.time.LocalDate":
                    field.set(newInstance, Date.valueOf(fieldValueStr).toLocalDate());
                    break;
                case "class java.time.LocalTime":
                    field.set(newInstance, Time.valueOf(fieldValueStr).toLocalTime());
                    break;
                case "class java.lang.Short":
                    field.set(newInstance, Short.parseShort(fieldValueStr));
                    break;
                case "class java.lang.String":
                    field.set(newInstance, com.cdmzl.common.actable.utils.CommonUtil.getStringDef(fieldValueStr));
                    break;
                case "class java.lang.Long":
                    field.set(newInstance, com.cdmzl.common.actable.utils.CommonUtil.getLong(fieldValueStr));
                    break;
                case "class java.util.Date":
                    field.set(newInstance, DateUtil.parse(fieldValueStr));
                    break;
                case "double":
                case "class java.lang.Double":
                    field.set(newInstance, com.cdmzl.common.actable.utils.CommonUtil.getDouble(fieldValueStr));
                    break;
                case "class java.lang.Integer":
                    field.set(newInstance, CommonUtil.getInteger(fieldValueStr));
                    break;
                default:
                    field.set(newInstance, fieldValue);
                    break;
            }
        } catch (Exception exception) {
            log.error("数据类型写入失败:" + field.getType());
            exception.printStackTrace();
        }
    }
}
