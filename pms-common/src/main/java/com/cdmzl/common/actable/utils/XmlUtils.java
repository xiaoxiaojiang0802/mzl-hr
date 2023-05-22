package com.cdmzl.common.actable.utils;

import cn.hutool.core.text.CharSequenceUtil;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.cdmzl.common.actable.utils.ColumnUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.w3c.dom.Element;

import java.lang.reflect.Field;

/**
 * @author 小江
 * @description TODO
 * @date 2023/2/3 17:41
 **/
@Slf4j
public class XmlUtils {


    /**
     * element 转实体类
     *
     * @param element 对象
     * @param t       对象
     * @param <T>     实体类
     * @return t 实体类
     */
    public static <T> T readObjectFromNodeAttr(Element element, Class<?> t) {
        JSONObject jsonObject = new JSONObject();
        /*字段名*/
        String keyStr = null;
        try {
            Field[] fields = t.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                keyStr = field.getName();
                /*字段值*/
                String textValue = element.getAttribute(keyStr);
                if (StringUtils.isBlank(textValue)) {
                    if (StringUtils.isNotBlank(ColumnUtils.getDefaultValue(field, t))) {
                        textValue = ColumnUtils.getDefaultValue(field, t);
                    }
                }
                if (CharSequenceUtil.isBlank(textValue)) {
                    textValue = null;
                }
                jsonObject.put(keyStr, textValue);
            }
            return (T) JSONObject.parseObject(JSONObject.toJSONString(jsonObject), t);
        } catch (Exception e) {
            log.error("转换json失败!keyStr:" + keyStr);
            throw new JSONException("转换json失败!" + JSONObject.toJSONString(jsonObject));
        }
    }
}
