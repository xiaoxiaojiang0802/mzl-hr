package com.cdmzl.actable.utils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xiaojiang
 * @date 2022/7/6
 */
public class CommonUtil {

    /**
     * 判断对象是否为空
     *
     * @return bool
     */
    public static boolean isNull(Object obj) {
        if (obj == null) {
            return true;
        } else {
            if ("String".equals(obj.getClass().getSimpleName())) {
                String str = (String) obj;
                if ("".equals(str.trim()) || "null".equals(str.trim()) || "NULL".equals(str.trim())) {
                    return true;
                }
            }
            if ("ArrayList".equals(obj.getClass().getSimpleName())) {
                List list = (ArrayList) obj;
                if (list.size() == 0) {
                    return true;
                }
            }
            if ("String[]".equals(obj.getClass().getSimpleName())) {
                String[] strs = (String[]) obj;
                if (strs.length == 1) {
                    if (CommonUtil.isNull(strs[0])) {
                        return true;
                    }
                }
            }
            if ("HashMap".equals(obj.getClass().getSimpleName())) {
                Map<Object, Object> map = (Map<Object, Object>) obj;
                return map.isEmpty();
            }
        }
        return false;
    }

    /**
     * 通用的toString
     */
    public static String toString(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return obj.toString();
        }
        return "";
    }


    /**
     * 获取list对象
     *
     * @param param  入参数组
     * @param keyStr 判断数量key
     * @return listMap
     */
    public static List<Map<Object, Object>> getListMap(Map<Object, Object> param, String keyStr) {
        int mapLength = CommonUtil.toString(param.get(keyStr)).split(",").length;
        List<Map<Object, Object>> mapList = new ArrayList<>();
        for (int i = 0; i < mapLength; i++) {
            Map<Object, Object> objectMap = new HashMap<>();
            for (Map.Entry entry : param.entrySet()) {
                objectMap.put(entry.getKey(), CommonUtil.toString(entry.getValue()).split(",")[i]);
            }
            mapList.add(objectMap);
        }
        return mapList;
    }

    /**
     * 站位编号
     *
     * @param obj    对象
     * @param length 长度
     * @return str
     */
    public static String getStringNumber(Object obj, Integer length) {
        String str = toString(obj);
        StringBuilder stringBuilder = new StringBuilder();
        if (str != null) {
            while ((stringBuilder.length() + str.length()) < length) {
                stringBuilder.append("0");
            }
            return stringBuilder + str;
        }
        return str;
    }

    /**
     * 获取整形
     */
    public static Integer getInteger(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return Integer.parseInt(obj.toString());
        }
        return 0;
    }

    /**
     * 获取整形空的返回最大值
     */
    public static Integer getIntegerDefMax(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return Integer.parseInt(obj.toString());
        }
        return Integer.MAX_VALUE;
    }

    /**
     * 获取
     */
    public static Long getLong(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return Long.parseLong(obj.toString());
        }
        return new Long("0");
    }

    /**
     * double
     */
    public static Double getDouble(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return Double.parseDouble(obj.toString());
        }
        return 0.0;
    }

    /**
     * Float
     */
    public static Float getFloat(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return Float.parseFloat(obj.toString());
        }
        return 0.00F;
    }

    /**
     * 用于组装sql，如传入str为sclead，返回'sclead'
     */
    public static String getStringDef(Object objectStr) {
        String str = toString(objectStr);
        if (isNull(str)) {
            return "";
        } else {
            return str;
        }
    }

    /**
     * BigDecimal
     */
    public static BigDecimal getBigDecimal(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return new BigDecimal(obj.toString());
        }
        return new BigDecimal("0.0");
    }

    /**
     * 判断值是否相等
     */
    public static boolean equals(Object obj, String str) {
        if (CommonUtil.isNull(obj)) {
            return false;
        }
        return str.equals(obj.toString());
    }

    /**
     * 判断值是否相等
     */
    public static boolean equals(Object obj1, Object obj2) {
        return CommonUtil.toString(obj1).equals(CommonUtil.toString(obj2));
    }

    /**
     * 为空返回指定参数
     *
     * @param obj   判断的对象
     * @param reStr 返回的默认值
     * @return str
     */
    public static String nullReturn(Object obj, String reStr) {
        if (!CommonUtil.isNull(obj)) {
            return obj.toString();
        }
        return reStr;
    }

    /**
     * 用于组装sql，如传入str为sclead，返回'sclead'
     */
    public static String getString(String str) {
        if (isNull(str)) {
            return null;
        } else {
            return "'" + str + "'";
        }
    }

}
