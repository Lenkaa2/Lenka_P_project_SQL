-- Discord: Lenka P.
-- Treti vyzkumna otazka
SELECT 
	price_prev.name,
	price_prev.avg_value AS avg_value_prev,
	price_prev.`year` AS prev_year,
	price_next.avg_value AS avg_value_next,
	price_next.`year` AS next_year,
	ROUND ( price_next.avg_value / price_prev.avg_value * 100 - 100, 2 ) AS prc_growth_percent
FROM (
	SELECT 
		name,
		ROUND (AVG(value), 2) AS avg_value,
		`year`
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'price'
	GROUP BY name, `year`) price_prev
JOIN (
	SELECT 
		name,
		ROUND (AVG(value), 2) AS avg_value,
		`year`
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'price'
	GROUP BY name, `year`) price_next
ON price_prev.name = price_next.name
AND price_prev.`year` = price_next.`year`- 12
ORDER BY prc_growth_percent ASC;

-- Rozdily cen mezi jednotlivymi roky
SELECT 
	price_prev.name,
	price_prev.avg_value AS avg_value_prev,
	price_prev.`year` AS prev_year,
	price_next.avg_value AS avg_value_next,
	price_next.`year` AS next_year,
	ROUND ( price_next.avg_value / price_prev.avg_value * 100 - 100, 2 ) AS prc_growth_percent
FROM (
	SELECT 
		name,
		ROUND (AVG(value), 2) AS avg_value,
		`year`
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'price'
	GROUP BY name, `year`) price_prev
JOIN (
	SELECT 
		name,
		ROUND (AVG(value), 2) AS avg_value,
		`year`
	FROM t_lenka_pazourova_project_sql_primary_final pf
	WHERE value_type = 'price'
	GROUP BY name, `year`) price_next
ON price_prev.name = price_next.name
AND price_prev.`year` = price_next.`year`- 1
ORDER BY prc_growth_percent DESC;
