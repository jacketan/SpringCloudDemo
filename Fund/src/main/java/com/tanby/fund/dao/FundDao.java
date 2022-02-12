package com.tanby.fund.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tanby.fund.model.FundEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

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

    @Select(" SELECT temp.`code`, temp.`name` FROM ( SELECT a.`code`, a.`name`, a.update_time AS time FROM t_fund_new a LEFT JOIN t_fund_extend b ON a.`code` = b.`code` WHERE b.`code` IS NULL UNION ( SELECT a.`code`, a.`name`, a.update_date AS time FROM t_fund_extend a LEFT JOIN t_fund_new b ON a.`code` = b.`code` WHERE ( b.type IN ('hhx', 'gpx') OR b.`code` IS NULL ) AND update_date < DATE_ADD(now(), INTERVAL - 12 HOUR) ORDER BY update_date )) temp ORDER BY temp.time ")
    List<FundEntity> querySyncList();

    @Select("SELECT a.`code` from t_fund_extend a LEFT JOIN t_fund_new b ON a.`code` = b.`code` where b.id is null")
    List<String> queryLackCode();
}
