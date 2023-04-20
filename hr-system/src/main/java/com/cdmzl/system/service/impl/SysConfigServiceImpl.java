package com.cdmzl.system.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.constant.CacheNames;
import com.cdmzl.common.constant.UserConstants;
import com.cdmzl.common.core.domain.PageQuery;
import com.cdmzl.common.core.page.TableDataInfo;
import com.cdmzl.common.core.service.ConfigService;
import com.cdmzl.common.exception.ServiceException;
import com.cdmzl.common.utils.StringUtils;
import com.cdmzl.common.utils.redis.CacheUtils;
import com.cdmzl.system.domain.SysConfig;
import com.cdmzl.system.mapper.SysConfigMapper;
import com.cdmzl.system.service.ISysConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 参数配置 服务层实现
 *
 * @author Lion Li
 */
@RequiredArgsConstructor
@Service
public class SysConfigServiceImpl implements ISysConfigService, ConfigService {

    private final SysConfigMapper baseMapper;

    @Override
    public TableDataInfo<SysConfig> selectPageConfigList(SysConfig config, PageQuery pageQuery) {
        Map<String, Object> params = config.getParams();
        LambdaQueryWrapper<SysConfig> lqw = new LambdaQueryWrapper<SysConfig>()
            .like(StringUtils.isNotBlank(config.getConfigName()), SysConfig::getConfigName, config.getConfigName())
            .eq(StringUtils.isNotBlank(config.getConfigType()), SysConfig::getConfigType, config.getConfigType())
            .like(StringUtils.isNotBlank(config.getConfigKey()), SysConfig::getConfigKey, config.getConfigKey())
            .between(params.get("beginTime") != null && params.get("endTime") != null,
                SysConfig::getCreateTime, params.get("beginTime"), params.get("endTime"));
        Page<SysConfig> page = baseMapper.selectPage(pageQuery.build(), lqw);
        return TableDataInfo.build(page);
    }

    /**
     * 查询参数配置信息
     *
     * @param configId 参数配置ID
     * @return 参数配置信息
     */
    @Override
    @DS("master")
    public SysConfig selectConfigById(Long configId) {
        return baseMapper.selectById(configId);
    }

    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数key
     * @return 参数键值
     */
    @Cacheable(cacheNames = CacheNames.SYS_CONFIG, key = "#configKey")
    @Override
    public String selectConfigByKey(String configKey) {
        SysConfig retConfig = baseMapper.selectOne(new LambdaQueryWrapper<SysConfig>()
            .eq(SysConfig::getConfigKey, configKey));
        if (ObjectUtil.isNotNull(retConfig)) {
            return retConfig.getConfigValue();
        }
        return StringUtils.EMPTY;
    }

    /**
     * 获取验证码开关
     *
     * @return true开启，false关闭
     */
    @Override
    public boolean selectCaptchaEnabled() {
        String captchaEnabled = selectConfigByKey("sys.account.captchaEnabled");
        if (StringUtils.isEmpty(captchaEnabled)) {
            return true;
        }
        return Convert.toBool(captchaEnabled);
    }

    /**
     * 查询参数配置列表
     *
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    @Override
    public List<SysConfig> selectConfigList(SysConfig config) {
        Map<String, Object> params = config.getParams();
        LambdaQueryWrapper<SysConfig> lqw = new LambdaQueryWrapper<SysConfig>()
            .like(StringUtils.isNotBlank(config.getConfigName()), SysConfig::getConfigName, config.getConfigName())
            .eq(StringUtils.isNotBlank(config.getConfigType()), SysConfig::getConfigType, config.getConfigType())
            .like(StringUtils.isNotBlank(config.getConfigKey()), SysConfig::getConfigKey, config.getConfigKey())
            .between(params.get("beginTime") != null && params.get("endTime") != null,
                SysConfig::getCreateTime, params.get("beginTime"), params.get("endTime"));
        return baseMapper.selectList(lqw);
    }

    /**
     * 新增参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @CachePut(cacheNames = CacheNames.SYS_CONFIG, key = "#config.configKey")
    @Override
    public String insertConfig(SysConfig config) {
        int row = baseMapper.insert(config);
        if (row > 0) {
            return config.getConfigValue();
        }
        throw new ServiceException("操作失败");
    }

    /**
     * 修改参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @CachePut(cacheNames = CacheNames.SYS_CONFIG, key = "#config.configKey")
    @Override
    public String updateConfig(SysConfig config) {
        int row;
        if (config.getConfigId() != null) {
            row = baseMapper.updateById(config);
        } else {
            row = baseMapper.update(config, new LambdaQueryWrapper<SysConfig>()
                .eq(SysConfig::getConfigKey, config.getConfigKey()));
        }
        if (row > 0) {
            return config.getConfigValue();
        }
        throw new ServiceException("操作失败");
    }

    /**
     * 批量删除参数信息
     *
     * @param configIds 需要删除的参数ID
     */
    @CacheEvict(value = CacheNames.SYS_CONFIG, allEntries = true)
    @Override
    public void deleteConfigByIds(Long[] configIds) {
        for (Long configId : configIds) {
            SysConfig config = selectConfigById(configId);
            if (StringUtils.equals(UserConstants.YES, config.getConfigType())) {
                throw new ServiceException(String.format("内置参数【%1$s】不能删除 ", config.getConfigKey()));
            }
        }
        baseMapper.deleteBatchIds(Arrays.asList(configIds));
    }

    /**
     * 加载参数缓存数据
     */
    @Override
    public void loadingConfigCache() {
    }

    /**
     * 清空参数缓存数据
     */
    @Override
    public void clearConfigCache() {
        CacheUtils.delCache(CacheNames.SYS_CONFIG);
    }

    /**
     * 重置参数缓存数据
     */
    @Override
    public void resetConfigCache() {
        clearConfigCache();
        loadingConfigCache();
    }

    /**
     * 校验参数键名是否唯一
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public String checkConfigKeyUnique(SysConfig config) {
        Long configId = ObjectUtil.isNull(config.getConfigId()) ? -1L : config.getConfigId();
        SysConfig info = baseMapper.selectOne(new LambdaQueryWrapper<SysConfig>().eq(SysConfig::getConfigKey, config.getConfigKey()));
        if (ObjectUtil.isNotNull(info) && info.getConfigId().longValue() != configId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 根据参数 key 获取参数值
     *
     * @param configKey 参数 key
     * @return 参数值
     */
    @Override
    public String getConfigValue(String configKey) {
        return selectConfigByKey(configKey);
    }

}
