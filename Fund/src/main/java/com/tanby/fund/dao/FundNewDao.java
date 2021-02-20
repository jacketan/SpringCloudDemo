package com.tanby.fund.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tanby.fund.model.FundNewEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author nick
 * @email tanbinyuan@do1.com.cn
 * @date 2020-12-12 16:26:19
 */
@Mapper
public interface FundNewDao extends BaseMapper<FundNewEntity> {

    @Delete("truncate table t_fund_new")
    void clearAll();
}
