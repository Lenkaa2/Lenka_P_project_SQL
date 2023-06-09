-- Discord: Lenka P.
-- Prvni vyzkumna otazka
SELECT 
	prev_year.name,
	prev_year.avg_payroll AS prev_avg_payroll,
	prev_year.`year` AS prev_year,
	next_year.avg_payroll AS next_avg_payroll,
	next_year.`year` AS next_year,
	CASE 
		WHEN next_year.avg_payroll > prev_year.avg_payroll THEN 'YES'
		ELSE 'NO'
	END AS growth,
	ROUND ( next_year.avg_payroll / prev_year.avg_payroll * 100 - 100, 2 ) AS growth_percent
FROM (	
	SELECT 
		pf.name,
		AVG(pf.value) AS avg_payroll,
		pf.`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'payroll'
	GROUP BY pf.name, pf.`year`
	) prev_year
JOIN (
	SELECT 
		pf.name,
		AVG(pf.value) AS avg_payroll,
		pf.`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'payroll'
	GROUP BY pf.name, pf.`year`
	) next_year
ON prev_year.name = next_year.name
AND prev_year.`year` = next_year.`year` - 1;

-- Porovnani mezd roky 2006 a 2018
SELECT 
	prev_year.name,
	prev_year.avg_payroll AS prev_avg_payroll,
	prev_year.`year` AS prev_year,
	next_year.avg_payroll AS next_avg_payroll,
	next_year.`year` AS next_year,
	CASE 
		WHEN next_year.avg_payroll > prev_year.avg_payroll THEN 'YES'
		ELSE 'NO'
	END AS growth,
	ROUND ( next_year.avg_payroll / prev_year.avg_payroll * 100 - 100, 2 ) AS growth_percent
FROM (	
	SELECT 
		pf.name,
		AVG(pf.value) AS avg_payroll,
		pf.`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'payroll'
	GROUP BY pf.name, pf.`year`) prev_year
JOIN (
	SELECT 
		pf.name,
		AVG(pf.value) AS avg_payroll,
		pf.`year` 
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'payroll'
	GROUP BY pf.name, pf.`year`) next_year
ON prev_year.name = next_year.name
AND prev_year.`year` = next_year.`year` - 12;

