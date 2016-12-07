-- 在诊断表中筛出发生故障的点送到报警表中
INSERT INTO "YJ_WARNING_ALARMPIPE" (
	"DBID",
	"ACTIVE",
	"ALARMTIME",
	"FAULTDESC",
	"FAULTTYPE",
	"PROBABLITY",
	"PIPEID"
) SELECT
	SEQ_YJ_WARNING_ALARMPIPE.nextval,
	'1',
	"CHECKTIME",
	"FAULTDESC",
	"FAULTTYPE",
	"PROBABLITY",
	"PIPEID"
FROM
	"YJ_WARNING_DIAGNOSIS"
WHERE
	-- 在诊断表中挑出recordid最大的（也就是最近一次诊断的结果）
	RECORDID = ( SELECT MAX (RECORDID) FROM "YJ_WARNING_DIAGNOSIS" )
	-- 并且recordid不能与目标中相同，防止重复写入
-- AND CHECKTIME != ( SELECT MAX (ALARMTIME) FROM "YJ_WARNING_ALARMPIPE" )
-- 不正常的才写入预警
AND ISNORMAL = '0'; 
-- exit;

