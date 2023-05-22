package com.cdmzl.common.actable.annotation;

import java.lang.annotation.*;

/**
 * 两个对象之间转换
 *
 * @author 小江
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface BeanToAnother {
    /**
     * 映射字段名称
     *
     * @return str
     */
    String columnName() default "";

    /**
     * 分类标记
     *
     * @return null
     */
    String[] groups() default {"V1"};
}
