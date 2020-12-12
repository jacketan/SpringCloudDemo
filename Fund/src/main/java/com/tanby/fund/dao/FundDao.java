package com.tanby.fund.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tanby.fund.model.FundEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 
 * 
 * @author nick
 * @email tanbinyuan@do1.com.cn
 * @date 2020-12-12 16:26:19
 */
@Mapper
public interface FundDao extends BaseMapper<FundEntity> {

    @Delete("truncate table t_fund")
    void clearAll();
}
