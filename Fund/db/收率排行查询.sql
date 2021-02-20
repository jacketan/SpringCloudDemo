
# 近一年收益排行
SELECT * FROM t_fund WHERE type_name in ('混合型', '股票型') ORDER BY `year` desc;

# 近半年收益排行
SELECT * FROM t_fund WHERE type_name in ('混合型', '股票型') ORDER BY `six_month` desc;

# 连涨超过两周
SELECT a.code,a.name,a.rise_week,b.type_name,b.`week`,b.`month` FROM t_fund_extend a LEFT JOIN t_fund b ON a.`code` = b.`code` WHERE b.type_name IN ('混合型', '股票型') AND rise_week > 1 ORDER BY rise_week desc,b.`week` desc;

# 连涨周数排行
SELECT a.code,a.name,a.rise_week,a.theme,b.type_name,b.`week`,b.`month`,b.`year` FROM t_fund_extend a LEFT JOIN t_fund b ON a.`code` = b.`code` WHERE b.type_name IN ('混合型', '股票型') AND b.`year` > 80 ORDER BY rise_week desc,b.`week` desc;

# 新连涨周数排行
SELECT a.code,a.name,a.rise_week,a.theme,b.type,b.`week`,b.`month`,b.`year` FROM t_fund_extend a LEFT JOIN t_fund_new b ON a.`code` = b.`code` WHERE b.type IN ('hhx', 'gpx') AND b.`year` > 80 ORDER BY rise_week desc,b.`week` desc