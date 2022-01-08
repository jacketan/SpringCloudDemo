package com.tanby.fund.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tanby.fund.dao.FundDao;
import com.tanby.fund.model.FundEntity;
import com.tanby.fund.service.FundService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tFundService")
public class FundServiceImpl extends ServiceImpl<FundDao, FundEntity> implements FundService {

    @Override
    public void clearAll() {
        this.getBaseMapper().clearAll();
    }

    @Override
    public List<FundEntity> querySyncList() {
        return this.getBaseMapper().querySyncList();
    }
}
