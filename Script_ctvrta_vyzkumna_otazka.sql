-- Ctvrta vyzkumna otazka
SELECT 
	summary.*,
	CASE
		WHEN (summary.price_growth_percent - summary.payroll_growth_percent) > 10 THEN 'yes'
		ELSE 'no'
	END AS diff_percent
FROM (
	SELECT 
		sum_price_prev.sum_value AS sum_price_prev,
		sum_price_prev.`year` AS year_price_prev,
		sum_price_next.sum_value AS sum_price_next,
		sum_price_next.`year` AS year_price_next,
		ROUND ( sum_price_next.sum_value / sum_price_prev.sum_value * 100 - 100, 2 ) AS price_growth_percent,
		sum_payroll_prev.sum_value AS sum_payroll_prev,
		sum_payroll_prev.`year` AS year_payroll_prev,
		sum_payroll_next.sum_value AS sum_payroll_next,
		sum_payroll_next.`year` AS year_payroll_next,
		ROUND ( sum_payroll_next.sum_value / sum_payroll_prev.sum_value * 100 - 100, 2 ) AS payroll_growth_percent
	FROM (
		SELECT 
			SUM (avg_price_prev.avg_value) sum_value,
			avg_price_prev.`year` 
		FROM (
			SELECT 
				name,
				ROUND (AVG (value), 2) AS avg_value,
				`year` 
			FROM t_lenka_pazourova_project_sql_primary_final pf
			WHERE value_type = 'price'
			GROUP BY name, `year` ) avg_price_prev 
		GROUP BY avg_price_prev.`year`
		) sum_price_prev 
	JOIN (
		SELECT 
			SUM (avg_price_next.avg_value) AS sum_value,
			avg_price_next.`year` 
		FROM (
			SELECT 
				name,
				ROUND (AVG (value), 2) AS avg_value,
				`year` 
			FROM t_lenka_pazourova_project_sql_primary_final pf
			WHERE value_type = 'price'
			GROUP BY name, `year` ) avg_price_next 
		GROUP BY avg_price_next.`year`
		) sum_price_next 
	ON sum_price_prev.`year` = sum_price_next.`year` - 1
	JOIN (
		SELECT 
			SUM (avg_payroll_prev.avg_value) AS sum_value,
			avg_payroll_prev.`year` 
		FROM (
			SELECT 
				name,
				ROUND (AVG (value), 2) AS avg_value,
				`year` 
			FROM t_lenka_pazourova_project_sql_primary_final pf
			WHERE value_type = 'payroll'
			GROUP BY name, `year` ) avg_payroll_prev 
		GROUP BY avg_payroll_prev.`year`
		) sum_payroll_prev 
	ON sum_price_prev.`year` = sum_payroll_prev.`year`
	JOIN (
		SELECT 
			SUM (avg_payroll_next.avg_value) AS sum_value,
			avg_payroll_next.`year` 
		FROM (
			SELECT 
				name,
				ROUND (AVG (value), 2) AS avg_value,
				`year` 
			FROM t_lenka_pazourova_project_sql_primary_final pf
			WHERE value_type = 'payroll'
			GROUP BY name, `year` ) avg_payroll_next 
		GROUP BY avg_payroll_next.`year`
		) sum_payroll_next 
	ON sum_payroll_prev.`year` = sum_payroll_next.`year` - 1
	) summary;
