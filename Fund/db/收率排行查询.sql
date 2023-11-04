
# 近一年收益排行
SELECT * FROM t_fund_new WHERE type in ('hhx', 'gpx', 'zsx') and near_year > 0 ORDER BY `near_year` desc;

# 近半年收益排行
SELECT * FROM t_fund_new WHERE type in ('hhx', 'gpx', 'zsx') ORDER BY  `six_month` desc;

# 周跌幅排行榜
SELECT a.`code`,a.`name`,b.theme,a.net,a.totalnet,b.rise_week,a.`week`,a.`year`,a.near_year,a.`month`,a.three_month,a.six_month,a.all_time from t_fund_new a LEFT JOIN t_fund_extend b ON a.`code` = b.`code` where type IN ('hhx', 'gpx', 'zsx') and `week` is not null and `month` <-10 ORDER BY `week`;

# 连涨超过两周
SELECT (`week` + `month` + three_month + six_month + `year`+ near_year) as num, a.`code`, a.`name`, b.theme,`week`,`month`,three_month,six_month,`year`,near_year from t_fund_new a LEFT JOIN t_fund_extend b on a.`code` = b.`code` where type in ('hhx', 'gpx', 'zsx') ORDER BY num desc;

# 连涨周数排行
SELECT a.code,a.name,a.rise_week,a.theme,b.type,b.`week`,b.`month`,b.`year`,b.near_year FROM t_fund_extend a LEFT JOIN t_fund_new b ON a.`code` = b.`code` WHERE b.type IN ('hhx', 'gpx', 'zsx') AND rise_week > 0 and near_year > 20 ORDER BY rise_week desc,b.`week` desc;

# 新连涨周数排行
SELECT a.code,a.name,a.rise_week,a.theme,b.type,b.`week`,b.`month`,b.`year`,b.near_year FROM t_fund_extend a LEFT JOIN t_fund_new b ON a.`code` = b.`code` WHERE b.type IN ('hhx', 'gpx', 'zsx') AND b.`year` > 40 ORDER BY rise_week desc,b.`week` desc;

# 同步的数量
SELECT a.*,b.`week`,b.`month`,b.three_month,b.six_month,b.`year`,b.near_year from t_fund_extend a LEFT JOIN t_fund_new b ON a.`code` = b.`code` where a.`code` in ('007531','017900','161726','002910','011103','005224','013188','003625');

# 更新时间
update t_fund_extend set update_date = DATE_ADD(update_date,INTERVAL -1 YEAR) where `code` in ('007531','017900','161726','002910','011103','005224','013188','003625');

