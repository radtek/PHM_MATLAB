-- 在每次诊断执行完之后，执行此脚本更新诊断结果的FAULTDESC部分
-- 放在代码中不太灵活，因此将这个拿出来执行
UPDATE "YJ_WARNING_DIAGNOSIS"
SET FAULTDESC = CASE 
WHEN ISNORMAL = '1' THEN
	'诊断结果:正常'
WHEN FAULTTYPE = '腐蚀' AND PROBABLITY>='0.8' THEN
	'诊断结果:极有可能腐蚀'
WHEN FAULTTYPE = '腐蚀' AND PROBABLITY<'0.8' THEN
	'诊断结果:可能腐蚀'
WHEN FAULTTYPE = '破损' AND PROBABLITY>='0.8' THEN
	'诊断结果:极有可能破损'
WHEN FAULTTYPE = '破损' AND PROBABLITY<'0.8' THEN
	'诊断结果:可能破损'
WHEN FAULTTYPE = '渗漏' AND PROBABLITY>='0.8' THEN
	'诊断结果:极有可能渗漏'
WHEN FAULTTYPE = '渗漏' AND PROBABLITY<'0.8' THEN
	'诊断结果:可能渗漏'
WHEN FAULTTYPE = '雨水阻塞' AND PROBABLITY<'0.8' THEN
	'诊断结果:可能雨水阻塞'
WHEN FAULTTYPE = '雨水阻塞' AND PROBABLITY>='0.8' THEN
	'诊断结果:极有可能雨水阻塞'
WHEN FAULTTYPE = '污水阻塞' AND PROBABLITY<'0.8' THEN
	'诊断结果:可能污水阻塞'
WHEN FAULTTYPE = '污水阻塞' AND PROBABLITY>='0.8' THEN
	'诊断结果:极有可能污水阻塞'
END
WHERE
	FAULTDESC IS NULL
;
