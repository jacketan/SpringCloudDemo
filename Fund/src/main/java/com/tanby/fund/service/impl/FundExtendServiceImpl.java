package com.tanby.fund.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tanby.fund.dao.FundExtendDao;
import com.tanby.fund.model.FundExtendEntity;
import com.tanby.fund.service.FundExtendService;
import org.springframework.stereotype.Service;

@Service("fundExtendService")
public class FundExtendServiceImpl extends ServiceImpl<FundExtendDao, FundExtendEntity> implements FundExtendService {

}
