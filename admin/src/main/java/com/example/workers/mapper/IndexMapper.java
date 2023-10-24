package com.example.workers.mapper;

import com.example.workers.vo.IndexVo;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author LJJ
 * @date 2023/10/24
 */
@Mapper
public interface IndexMapper {


    /**
     * 首页系统情况
     *
     * @return bean
     */
    IndexVo selectIndex();
}
