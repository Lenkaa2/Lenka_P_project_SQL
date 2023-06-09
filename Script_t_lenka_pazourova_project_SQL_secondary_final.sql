-- Discord: Lenka P.
-- Sekundarni tabulka
CREATE TABLE t_lenka_pazourova_project_SQL_secondary_final
SELECT 
	country,
	`year`,
	GDP
FROM economies
WHERE country = 'Czech Republic'
AND `year` BETWEEN 2006 AND 2018
ORDER BY `year` ASC;
