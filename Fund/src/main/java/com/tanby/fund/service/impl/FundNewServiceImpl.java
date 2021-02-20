package com.tanby.fund.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tanby.fund.dao.FundNewDao;
import com.tanby.fund.model.FundNewEntity;
import com.tanby.fund.service.FundNewService;
import org.springframework.stereotype.Service;

@Service
public class FundNewServiceImpl extends ServiceImpl<FundNewDao, FundNewEntity> implements FundNewService {

    @Override
    public void clearAll() {
        this.getBaseMapper().clearAll();
    }
}
