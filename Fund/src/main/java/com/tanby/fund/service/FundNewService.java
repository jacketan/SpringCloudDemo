package com.tanby.fund.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tanby.fund.model.FundNewEntity;

/**
 * 
 *
 * @author nick
 * @email tanbinyuan@do1.com.cn
 * @date 2020-12-12 16:26:19
 */
public interface FundNewService extends IService<FundNewEntity> {

    void clearAll();
}

