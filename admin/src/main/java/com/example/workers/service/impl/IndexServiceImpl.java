package com.example.workers.service.impl;

import com.example.workers.mapper.IndexMapper;
import com.example.workers.service.IndexService;
import com.example.workers.vo.IndexVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author muzi
 * @date 2023/10/24
 */
@Service
@RequiredArgsConstructor
public class IndexServiceImpl implements IndexService {

    private final IndexMapper indexMapper;

    @Override
    public IndexVo selectIndex() {
        IndexVo indexVo = indexMapper.selectIndex();
        indexVo.setAmount(indexMapper.sumAmount());
        return indexVo;
    }
}
