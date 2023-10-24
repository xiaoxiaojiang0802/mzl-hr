package com.example.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.constant.CacheNames;
import com.example.common.core.domain.PageQuery;
import com.example.common.core.page.TableDataInfo;
import com.example.common.utils.StringUtils;
import com.example.system.domain.SysFile;
import com.example.system.domain.bo.SysOssBo;
import com.example.system.domain.vo.SysOssVo;
import com.example.system.mapper.SysOssMapper;
import com.example.system.service.ISysFileService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 文件上传 服务层实现
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class SysFileServiceImpl implements ISysFileService {

    private final SysOssMapper baseMapper;

    @Override
    public TableDataInfo<SysOssVo> queryPageList(SysOssBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SysFile> lqw = buildQueryWrapper(bo);
        Page<SysOssVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw, SysOssVo.class);
        return TableDataInfo.build(result);
    }

    @Override
    public List<SysOssVo> listByIds(Collection<Long> ossIds) {
        List<SysOssVo> list = new ArrayList<>();
        for (Long id : ossIds) {
            SysOssVo vo = getById(id);
            if (ObjectUtil.isNotNull(vo)) {
                list.add(vo);
            }
        }
        return list;
    }

    private LambdaQueryWrapper<SysFile> buildQueryWrapper(SysOssBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<SysFile> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getFileName()), SysFile::getFileName, bo.getFileName());
        lqw.like(StringUtils.isNotBlank(bo.getOriginalName()), SysFile::getOriginalName, bo.getOriginalName());
        lqw.eq(StringUtils.isNotBlank(bo.getFileSuffix()), SysFile::getFileSuffix, bo.getFileSuffix());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), SysFile::getUrl, bo.getUrl());
        lqw.between(params.get("beginCreateTime" ) != null && params.get("endCreateTime" ) != null,
            SysFile::getCreateTime, params.get("beginCreateTime" ), params.get("endCreateTime" ));
        lqw.eq(StringUtils.isNotBlank(bo.getCreateBy()), SysFile::getCreateBy, bo.getCreateBy());
        lqw.eq(StringUtils.isNotBlank(bo.getService()), SysFile::getService, bo.getService());
        return lqw;
    }

    @Cacheable(cacheNames = CacheNames.SYS_OSS, key = "#ossId" )
    @Override
    public SysOssVo getById(Long ossId) {
        return baseMapper.selectVoById(ossId, SysOssVo.class);
    }

    @Override
    public SysFile upload(MultipartFile file) {
        String originalfileName = file.getOriginalFilename();
        assert originalfileName != null;
        String suffix = StringUtils.substring(originalfileName, originalfileName.lastIndexOf("." ), originalfileName.length());
//        OssClient storage = OssFactory.instance();
//        UploadResult uploadResult;
//        try {
//            uploadResult = storage.uploadSuffix(file.getBytes(), suffix, file.getContentType());
//        } catch (IOException e) {
//            throw new ServiceException(e.getMessage());
//        }
        // 保存文件信息
        SysFile oss = new SysFile();
//        oss.setUrl(uploadResult.getUrl());
//        oss.setFileSuffix(suffix);
//        oss.setFileName(uploadResult.getFilename());
//        oss.setOriginalName(originalfileName);
//        oss.setService(storage.getConfigKey());
        baseMapper.insert(oss);
        return oss;
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            // 做一些业务上的校验,判断是否需要校验
        }
        List<SysFile> list = baseMapper.selectBatchIds(ids);
        for (SysFile sysFile : list) {
//            OssClient storage = OssFactory.instance(sysOss.getService());
//            storage.delete(sysOss.getUrl());
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

}
