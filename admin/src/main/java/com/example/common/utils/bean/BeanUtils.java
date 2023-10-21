package com.example.common.utils.bean;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.example.common.actable.utils.CommonUtil;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Bean 工具类
 *
 * @author ruoyi
 */
public class BeanUtils extends org.springframework.beans.BeanUtils {
    /**
     * Bean方法名中属性名开始的下标
     */
    private static final int BEAN_METHOD_PROP_INDEX = 3;

    /**
     * 匹配getter方法的正则表达式
     */
    private static final Pattern GET_PATTERN = Pattern.compile("get(\\p{javaUpperCase}\\w*)");

    /**
     * 匹配setter方法的正则表达式
     */
    private static final Pattern SET_PATTERN = Pattern.compile("set(\\p{javaUpperCase}\\w*)");

    /**
     * Bean属性复制工具方法。
     *
     * @param dest 目标对象
     * @param src  源对象
     */
    public static void copyBeanProp(Object dest, Object src) {
        try {
            copyProperties(src, dest);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取对象的setter方法。
     *
     * @param obj 对象
     * @return 对象的setter方法列表
     */
    public static List<Method> getSetterMethods(Object obj) {
        // setter方法列表
        List<Method> setterMethods = new ArrayList<Method>();
        // 获取所有方法
        Method[] methods = obj.getClass().getMethods();
        // 查找setter方法
        for (Method method : methods) {
            Matcher m = SET_PATTERN.matcher(method.getName());
            if (m.matches() && (method.getParameterTypes().length == 1)) {
                setterMethods.add(method);
            }
        }
        // 返回setter方法列表
        return setterMethods;
    }

    /**
     * 获取对象的getter方法。
     *
     * @param obj 对象
     * @return 对象的getter方法列表
     */

    public static List<Method> getGetterMethods(Object obj) {
        // getter方法列表
        List<Method> getterMethods = new ArrayList<Method>();
        // 获取所有方法
        Method[] methods = obj.getClass().getMethods();
        // 查找getter方法
        for (Method method : methods) {
            Matcher m = GET_PATTERN.matcher(method.getName());
            if (m.matches() && (method.getParameterTypes().length == 0)) {
                getterMethods.add(method);
            }
        }
        // 返回getter方法列表
        return getterMethods;
    }

    /**
     * 检查Bean方法名中的属性名是否相等。<br>
     * 如getName()和setName()属性名一样，getName()和setAge()属性名不一样。
     *
     * @param m1 方法名1
     * @param m2 方法名2
     * @return 属性名一样返回true，否则返回false
     */
    public static boolean isMethodPropEquals(String m1, String m2) {
        return m1.substring(BEAN_METHOD_PROP_INDEX).equals(m2.substring(BEAN_METHOD_PROP_INDEX));
    }

    /**
     * node Attr 转实体类
     *
     * @param node   节点
     * @param tClass 实体类
     * @param <T>    T
     * @return t
     */
    public static <T> T initBean(Node node, Class<T> tClass) {
        try {
            Map<String, String> map = xmlToMapAttr(node);
            Map<String, String> mapBean = new HashMap<>();
            Field[] fields = tClass.getDeclaredFields();
            for (Field field : fields) {
                String fieldName = field.getName();
                if (!map.keySet().isEmpty()) {
                    for (Map.Entry<String, String> entry : map.entrySet()) {
                        String keyStr = entry.getKey();
                        if (StrUtil.equals(fieldName.toLowerCase(), keyStr.toLowerCase())) {
                            mapBean.put(fieldName, entry.getValue());
                        }
                    }
                }
            }
            return BeanUtil.toBean(mapBean, tClass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * xml attr转map
     */
    public static Map<String, String> xmlToMapAttr(Node node) {
        NamedNodeMap namedNodeMap = node.getAttributes();
        Map<String, String> map = new HashMap<>(namedNodeMap.getLength());
        if (namedNodeMap.getLength() > 0) {
            for (int i = 0; i < namedNodeMap.getLength(); i++) {
                Node attrNode = namedNodeMap.item(i);
                map.put(attrNode.getNodeName(), attrNode.getNodeValue());
            }
        }
        return map;
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
            String fieldValueStr = CommonUtil.toString(fieldValue);
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
                    field.set(newInstance, CommonUtil.getStringDef(fieldValueStr));
                    break;
                case "class java.lang.Long":
                    field.set(newInstance, CommonUtil.getLong(fieldValueStr));
                    break;
                case "class java.util.Date":
                    field.set(newInstance, DateUtil.parse(fieldValueStr));
                    break;
                case "double":
                case "class java.lang.Double":
                    field.set(newInstance, CommonUtil.getDouble(fieldValueStr));
                    break;
                case "class java.lang.Integer":
                    field.set(newInstance, CommonUtil.getInteger(fieldValueStr));
                    break;
                case "class java.math.BigDecimal":
                    field.set(newInstance, CommonUtil.getBigDecimal(fieldValueStr));
                    break;
                default:
                    field.set(newInstance, fieldValue);
                    break;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

}
