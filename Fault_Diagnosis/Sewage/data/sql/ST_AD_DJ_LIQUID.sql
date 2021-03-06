-- 创建统计表 ST_AD_DJ_LIQUID 统计 AD_DJ_LIQUID 中的各个传感器数据

DROP TABLE ST_AD_DJ_LIQUID;
CREATE TABLE ST_AD_DJ_LIQUID AS 
SELECT 
	DEVCODE,
	COUNT(DEVCODE) AS "count",
	ROUND(AVG(TO_NUMBER(LIQUIDDATA)), 3) AS "mean", --保留3位小数
	ROUND(VARIANCE(TO_NUMBER(LIQUIDDATA)), 3) AS "cov",
	MIN(TO_NUMBER(LIQUIDDATA)) AS "min",
	MAX(TO_NUMBER(LIQUIDDATA)) AS "max",
	MIN(UPTIME) AS "starttime",
	MAX(UPTIME) AS "endtime"
FROM
	AD_DJ_LIQUID -- 这里要替换成污水传感器数据表，以及上面的数据名称
-- WHERE
--	 CELL!='0'
GROUP BY
	DEVCODE
ORDER BY
	DEVCODE;

exit;