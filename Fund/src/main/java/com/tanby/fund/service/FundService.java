package com.tanby.fund.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tanby.fund.model.FundEntity;

import java.util.List;

/**
 * 
 *
 * @author nick
 * @email tanbinyuan@do1.com.cn
 * @date 2020-12-12 16:26:19
 */
public interface FundService extends IService<FundEntity> {

    void clearAll();

    List<FundEntity> querySyncList();
}

