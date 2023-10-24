package com.example.system.service;

import com.example.common.core.domain.PageQuery;
import com.example.common.core.page.TableDataInfo;
import com.example.system.domain.SysFile;
import com.example.system.domain.bo.SysOssBo;
import com.example.system.domain.vo.SysOssVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collection;
import java.util.List;

/**
 * 文件上传 服务层
 *
 * @author ruoyi
 */
public interface ISysFileService {

    TableDataInfo<SysOssVo> queryPageList(SysOssBo sysOss, PageQuery pageQuery);

    List<SysOssVo> listByIds(Collection<Long> ossIds);

    SysOssVo getById(Long ossId);

    SysFile upload(MultipartFile file);

    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

}
