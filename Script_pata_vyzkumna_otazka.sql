-- Discord: Lenka P.
-- Pata vyzkumna otazka
SELECT 
	summary.year_price_prev AS prev_year,
	summary.year_price_next AS next_year,
	summary.HDP_growth_percent,
	summary.price_growth_percent,
	summary.payroll_growth_percent
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
		ROUND ( sum_payroll_next.sum_value / sum_payroll_prev.sum_value * 100 - 100, 2 ) AS payroll_growth_percent,
		HDP_prev.HDP_value_prev,
		HDP_prev.prev_year,
		HDP_next.HDP_value_next,
		HDP_next.next_year,
		ROUND ( HDP_next.HDP_value_next / HDP_prev.HDP_value_prev * 100 - 100, 2) AS HDP_growth_percent
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
	JOIN (
		SELECT
			GDP AS HDP_value_prev,
			`year` AS prev_year
		FROM t_lenka_pazourova_project_sql_secondary_final sf
		) HDP_prev
	ON sum_payroll_prev.`year` = HDP_prev.prev_year
	JOIN (
		SELECT
			GDP AS HDP_value_next,
			`year` AS next_year
		FROM t_lenka_pazourova_project_sql_secondary_final sf
		) HDP_next
	ON HDP_prev.prev_year = HDP_next.next_year - 1
	) summary;
