package com.example.workers.mapper;

import com.example.workers.vo.IndexVo;
import org.apache.ibatis.annotations.Mapper;

import java.math.BigDecimal;

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

    /**
     * 查询本月奖惩金额
     */
    BigDecimal sumAmount();
}
