package com.cdmzl.system.service;

import com.cdmzl.common.core.domain.PageQuery;
import com.cdmzl.common.core.page.TableDataInfo;
import com.cdmzl.system.domain.SysOss;
import com.cdmzl.system.domain.bo.SysOssBo;
import com.cdmzl.system.domain.vo.SysOssVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collection;
import java.util.List;

/**
 * 文件上传 服务层
 *
 * @author ruoyi
 */
public interface ISysOssService {

    TableDataInfo<SysOssVo> queryPageList(SysOssBo sysOss, PageQuery pageQuery);

    List<SysOssVo> listByIds(Collection<Long> ossIds);

    SysOssVo getById(Long ossId);

    SysOss upload(MultipartFile file);

    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

}
