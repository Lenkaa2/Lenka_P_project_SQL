-- Discord: Lenka P.
-- Druha vyzkumna otazka
SELECT 
	price.name,
	price.avg_price,
	payroll.sum_payroll,
	payroll.`year`,
	ROUND ( payroll.sum_payroll / price.avg_price, 2 ) AS 'count'
FROM (
	SELECT 
		name,
		ROUND (AVG(value), 2) AS avg_price,
		`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'price'
	AND category_code IN ('114201', '111301')
	AND `year` = 2006 AND year_value IN (1, 2, 3)
	GROUP BY name, `year`
UNION ALL
	SELECT 
		name,
		ROUND (AVG(value), 2) AS avg_price,
		`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'price'
	AND category_code IN ('114201', '111301')
	AND `year` = 2018 AND year_value IN (10, 11, 12)
	GROUP BY name, `year`
	) price
JOIN (
	SELECT 
		SUM (value) AS sum_payroll,
		`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'payroll'
	AND `year` = 2006 AND year_value = 1
	GROUP BY `year` 
UNION ALL
	SELECT 
		SUM (value) AS sum_payroll,
		`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'payroll'
	AND `year` = 2018 AND year_value = 4
	GROUP BY `year` ) payroll
ON price.`year` = payroll.`year`;

-- Jednotliva pracovni odvetvi
SELECT 
	price.name AS category_name,
	ROUND (AVG (price.value), 2) AS price,
	price.`year`,
	payroll.name AS industry_name,
	AVG (payroll.value) AS payroll,
	payroll.`year`,
	ROUND (AVG (payroll.value) / ROUND (AVG (price.value), 2), 1) AS 'count'
FROM (
		SELECT 
			*
		FROM t_lenka_pazourova_project_sql_primary_final pf
		WHERE category_code IN ('114201', '111301')
			AND pf.`year` = 2006 AND pf.year_value IN (1, 2, 3)
	UNION ALL
		SELECT 
			*
		FROM t_lenka_pazourova_project_sql_primary_final pf
		WHERE category_code IN ('114201', '111301')
			AND pf.`year` = 2018 AND pf.year_value IN (10, 11, 12)
	) price
LEFT JOIN (
		SELECT 
			*
		FROM t_lenka_pazourova_project_sql_primary_final pf2
		WHERE value_type = 'payroll'
			AND pf2.`year` = 2006 AND pf2.year_value = 1
	UNION ALL	
		SELECT 
			*
		FROM t_lenka_pazourova_project_sql_primary_final pf2
		WHERE value_type = 'payroll'
			AND pf2.`year` = 2018 AND pf2.year_value = 4
		) payroll
ON price.`year`= payroll.`year`
GROUP BY price.name, price.`year`, payroll.name, payroll.`year`;

