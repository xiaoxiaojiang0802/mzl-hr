package com.hr.system.service;

import com.hr.common.core.domain.PageQuery;
import com.hr.common.core.page.TableDataInfo;
import com.hr.system.domain.SysOss;
import com.hr.system.domain.bo.SysOssBo;
import com.hr.system.domain.vo.SysOssVo;
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
