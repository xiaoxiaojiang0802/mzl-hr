package com.pms.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pms.common.constant.CacheNames;
import com.pms.common.constant.UserConstants;
import com.pms.common.core.domain.PageQuery;
import com.pms.common.core.page.TableDataInfo;
import com.pms.common.exception.ServiceException;
import com.pms.common.utils.StringUtils;
import com.pms.system.domain.SysOssConfig;
import com.pms.system.domain.bo.SysOssConfigBo;
import com.pms.system.domain.vo.SysOssConfigVo;
import com.pms.system.mapper.SysOssConfigMapper;
import com.pms.system.service.ISysOssConfigService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

/**
 * 对象存储配置Service业务层处理
 *
 * @author ruoyi
 * @date 2021-08-13
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SysOssConfigServiceImpl implements ISysOssConfigService {

    private final SysOssConfigMapper baseMapper;

    /**
     * 项目启动时，初始化参数到缓存，加载配置类
     */
    @Override
    public void init() {
        List<SysOssConfig> list = baseMapper.selectList();
        // 加载OSS初始化配置
        for (SysOssConfig config : list) {
            setConfigCache(true, config);
        }
    }

    @Override
    public SysOssConfigVo queryById(Long ossConfigId) {
        return baseMapper.selectVoById(ossConfigId, SysOssConfigVo.class);
    }

    @Override
    public TableDataInfo<SysOssConfigVo> queryPageList(SysOssConfigBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SysOssConfig> lqw = buildQueryWrapper(bo);
        Page<SysOssConfigVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw, SysOssConfigVo.class);
        return TableDataInfo.build(result);
    }


    private LambdaQueryWrapper<SysOssConfig> buildQueryWrapper(SysOssConfigBo bo) {
        LambdaQueryWrapper<SysOssConfig> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getConfigKey()), SysOssConfig::getConfigKey, bo.getConfigKey());
        lqw.like(StringUtils.isNotBlank(bo.getBucketName()), SysOssConfig::getBucketName, bo.getBucketName());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), SysOssConfig::getStatus, bo.getStatus());
        return lqw;
    }

    @Override
    public Boolean insertByBo(SysOssConfigBo bo) {
        SysOssConfig config = BeanUtil.toBean(bo, SysOssConfig.class);
        validEntityBeforeSave(config);
        return setConfigCache(baseMapper.insert(config) > 0, config);
    }

    @Override
    public Boolean updateByBo(SysOssConfigBo bo) {
        SysOssConfig config = BeanUtil.toBean(bo, SysOssConfig.class);
        validEntityBeforeSave(config);
        LambdaUpdateWrapper<SysOssConfig> luw = new LambdaUpdateWrapper<>();
        luw.set(ObjectUtil.isNull(config.getPrefix()), SysOssConfig::getPrefix, "" );
        luw.set(ObjectUtil.isNull(config.getRegion()), SysOssConfig::getRegion, "" );
        luw.set(ObjectUtil.isNull(config.getExt1()), SysOssConfig::getExt1, "" );
        luw.set(ObjectUtil.isNull(config.getRemark()), SysOssConfig::getRemark, "" );
        luw.eq(SysOssConfig::getOssConfigId, config.getOssConfigId());
        return setConfigCache(baseMapper.update(config, luw) > 0, config);
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(SysOssConfig entity) {
        if (StringUtils.isNotEmpty(entity.getConfigKey())
            && UserConstants.NOT_UNIQUE.equals(checkConfigKeyUnique(entity))) {
            throw new ServiceException("操作配置'" + entity.getConfigKey() + "'失败, 配置key已存在!" );
        }
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
//            if (CollUtil.containsAny(ids, OssConstant.SYSTEM_DATA_IDS)) {
//                throw new ServiceException("系统内置, 不可删除!");
//            }
        }
        List<SysOssConfig> list = CollUtil.newArrayList();
        for (Long configId : ids) {
            SysOssConfig config = baseMapper.selectById(configId);
            list.add(config);
        }
        boolean flag = baseMapper.deleteBatchIds(ids) > 0;
        if (flag) {
//            list.forEach(sysOssConfig ->
//                CacheUtils.evict(CacheNames.SYS_OSS_CONFIG, sysOssConfig.getConfigKey()));
        }
        return flag;
    }

    /**
     * 判断configKey是否唯一
     */
    private String checkConfigKeyUnique(SysOssConfig sysOssConfig) {
        long ossConfigId = ObjectUtil.isNull(sysOssConfig.getOssConfigId()) ? -1L : sysOssConfig.getOssConfigId();
        SysOssConfig info = baseMapper.selectOne(new LambdaQueryWrapper<SysOssConfig>()
            .select(SysOssConfig::getOssConfigId, SysOssConfig::getConfigKey)
            .eq(SysOssConfig::getConfigKey, sysOssConfig.getConfigKey()));
        if (ObjectUtil.isNotNull(info) && info.getOssConfigId() != ossConfigId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 启用禁用状态
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateOssConfigStatus(SysOssConfigBo bo) {
        SysOssConfig sysOssConfig = BeanUtil.toBean(bo, SysOssConfig.class);
        int row = baseMapper.update(null, new LambdaUpdateWrapper<SysOssConfig>()
            .set(SysOssConfig::getStatus, "1" ));
        row += baseMapper.updateById(sysOssConfig);
        if (row > 0) {
//            RedisUtils.setCacheObject(OssConstant.DEFAULT_CONFIG_KEY, sysOssConfig.getConfigKey());
        }
        return row;
    }

    /**
     * 如果操作成功 则更新缓存
     *
     * @param flag   操作状态
     * @param config 配置
     * @return 返回操作状态
     */
    @Cacheable(cacheNames = CacheNames.SYS_OSS, key = "#ossId" )
    public boolean setConfigCache(boolean flag, SysOssConfig config) {
        return flag;
    }
}
