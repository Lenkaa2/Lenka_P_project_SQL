-- Discord: Lenka P.
-- Primarni tabulka
CREATE TABLE t_Lenka_Pazourova_project_SQL_primary_final
SELECT 
	cp.category_code,
	cpc.name,
	cp.value,
	'price' AS value_type,
	YEAR (cp.date_from) AS 'year',
	MONTH (cp.date_from) AS year_value,
	'month' AS year_value_type
FROM (
		SELECT 
			category_code,
			value,
			date_from
		FROM czechia_price 
		WHERE region_code IS NULL
		AND YEAR (date_from) BETWEEN 2006 AND 2018
	  ) cp
JOIN czechia_price_category cpc 
ON cp.category_code = cpc.code
UNION ALL
SELECT 
	cpay.industry_branch_code AS category_code,
	cpib.name,
	cpay.value,
	'payroll' AS value_type,
	cpay.payroll_year AS 'year',
	cpay.payroll_quarter AS year_value,
	'quarter' AS year_value_type
FROM (
		SELECT 
			industry_branch_code,
			value,
			payroll_year,
			payroll_quarter
		FROM czechia_payroll
		WHERE value_type_code = 5958
		AND industry_branch_code IS NOT NULL
		AND unit_code = 200
		AND calculation_code = 100
		AND payroll_year BETWEEN 2006 AND 2018
	  ) cpay
LEFT JOIN czechia_payroll_industry_branch cpib 
ON cpay.industry_branch_code = cpib.code;
