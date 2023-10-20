package com.pms.common.utils.redis;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * 缓存操作工具类 {@link }
 *
 * @author Michelle.Chung
 * @date 2022/8/13
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuppressWarnings(value = {"unchecked"})
public class CacheUtils {

    private static final TimedCache<String, Object> CACHE_MANAGER = CacheUtil.newTimedCache(60000);

    /**
     * 获取缓存值
     *
     * @param key 缓存key
     */
    public static <T> T get(String key) {
        return (T) CACHE_MANAGER.get(key);
    }

    /**
     * 保存缓存值
     *
     * @param key   缓存key
     * @param value 缓存值
     */
    public static void put(String key, Object value) {
        CACHE_MANAGER.put(key, value);
    }


    /**
     * 删除key
     *
     * @param key 缓存key
     */
    public static void delCache(String key) {
        CACHE_MANAGER.remove(key);
    }
}
