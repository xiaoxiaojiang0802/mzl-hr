//package com.jiangjin.framework.config;
//
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.cache.CacheManager;
//import org.springframework.cache.annotation.CachingConfigurerSupport;
//import org.springframework.cache.annotation.EnableCaching;
//import org.springframework.cache.support.SimpleCacheManager;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
///**
// * redis配置
// *
// * @author ruoyi
// */
//@Slf4j
//@Configuration
//@EnableCaching
//public class RedisConfig extends CachingConfigurerSupport {
//
//
//    /**
//     * 自定义缓存管理器 整合spring-cache
//     */
//    @Override
//    @Bean
//    public CacheManager cacheManager() {
//        return new SimpleCacheManager();
//    }
//
//}
