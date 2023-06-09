# Lenka_P_project_SQL
Průvodní listina

1.	Popis datových sad

1.1.	Primární tabulka t_Lenka_Pazourova_project_SQL_primary_final

Primární tabulka t_Lenka_Pazourova_project_SQL_primary_final byla s ohledem na výzkumné otázky připravena sjednocením tabulek czechia_price (informace o cenách vybraných potravin za několikaleté období) a czechia_payroll (informace o mzdách v různých odvětvích za několikaleté období). Z tabulky czechia_payroll byla použita pouze data týkající se průměrných mezd v jednotlivých odvětvích, z tabulky czechia_price byla použita data odpovídající celorepublikovým průměrům jednotlivých kategorií potravin. Výše uvedené tabulky byly dále sjednoceny na vzájemně porovnatelné období, tedy na období mezi roky 2006 až 2018. 
Pro větší přehlednost a lepší filtrovatelnost dat byl do primární tabulky doplněn sloupec ‚value_type‘, který udává, jestli se hodnota ‚value‘ vztahuje k cenám potravin (price) nebo k průměrným mzdám (payroll) za sledované období. 
Dále byl do primární tabulky přidán ještě jeden sloupec ‚year_value_type‘, který blíže specifikuje měřené období neboli udává, jestli sloupec ‚year_value‘ představuje jednotlivé měsíce (month) nebo celá čtvrtletí (quarter).

1.2.	Sekundární tabulka t_Lenka_Pazourova_project_SQL_secondary_final

Sekundární tabulka t_Lenka_Pazourova_project_SQL_secondary_final byla vytvořena z tabulky economies, neboť se jedna z výzkumných otázek týkala vlivu výšky HDP na růst mezd a cen potravin. S přihlédnutím k této skutečnosti, byly z tabulky economies vybrána pouze data týkající se HDP v České republice mezi roky 2006 - 2018, aby byla data vzájemně porovnatelná.

2.	Výzkumné otázky

2.1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

Z celkem 19. pracovních odvětví jich kontinuální meziroční nárůst průměrných mezd ve sledovaném období vykazovalo pouze 5. Konkrétně se jedná o odvětví: Administrativní a podpůrné činnosti, Doprava a skladování, Ostatní činnosti, Zdravotní a sociální péče a Zpracovatelský průmysl. Všechna ostatní pracovní odvětví zaznamenala ve sledovaném období minimálně jeden meziroční pokles průměrných mezd. Odvětví Těžba a dobývání zaznamenalo meziroční pokles průměrných mezd mezi roky 2006 až 2018 dokonce čtyřikrát. Nejvýraznější meziroční pokles průměrných mezd byl zaznamenán u odvětví Peněžnictví a pojišťovnictví mezi roky 2012 a 2013, kdy průměrné mzdy klesly o 9 %. 
Porovnáme-li však mezi sebou pouze první a poslední rok sledovaného období, tedy roky 2006 a 2018, došlo k nárůstu průměrných mezd ve všech sledovaných pracovních odvětvích. Průměrný nárůst mezd mezi těmito dvěma roky byl 58,67 %. Nejvyšší nárůst průměrných mezd za celé sledované období, tedy od roku 2006 do roku 2018, zaznamenalo odvětví Zdravotní a sociální péče, kdy došlo k nárůstu průměrných mezd o téměř 76 %. Naopak nejnižší nárůst mezd za celé sledované období vykazuje odvětví Penežnictví a pojišťovnictví, kde došlo k nárůstu průměrných mezd o 35,54 %. 

2.2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední porovnatelné období?

Prvním a posledním porovnatelným obdobím je první čtvrtletí roku 2006 a poslední čtvrtletí roku 2018. Je však třeba brát v úvahu skutečnost, že v posledním čtvrletí roku 2018 bylo měření průměrných cen jednotlivých kategorí potravin realizováno pouze jeden týden v měsíci, zatímco v prvním čtvrletí roku 2006 bylo měření realizováno ve třech týdench v měsíci. Tato skutečnost by však data měla ovlivnit minimálně. 
Sečteme-li průměrné mzdy ve všech pracovních odvětvích v prvním čtvrletí roku 2006, dojdeme k závěru, že souhrně bylo možné koupit 24 816,5 kg chleba a 25 688 l mléka. Při stejném mechanismu výpočtu pro rok 2018 nám vyjde, že by souhrně bylo možné koupit 26 996,5 kg chleba a 33 066,5 l mléka. Pokud mezi sebou tyto údaje porovnáme, zjistíme, že oproti prvnímu čtvrletí roku 2006 bylo v posledním čtvrtletí roku 2018 možné koupit o 2 180 kg chleba a 7 378,5 l mléka více. Na základě tohoto lze konstatovat, že chléb zdražil výrazně více než mléko, neboť mléka bylo možné v posledním čtvrtletí roku 2018 koupit o 28,72 % více než v prvním čtvrtletí roku 2006, zatímco v případě chleba to bylo pouze o 8,78 % více.
Podíváme-li se na jednotlivá pracovní odvětví, zjistíme, že nejvíce kilogramů chleba a litrů mléka si v prvním čtvrtletí roku 2006 mohli koupit zaměstnanci pracující v odvětví Peněžnictví a pojišťovnictví (2 949 kg chleba a 3 053 l mléka) a naopak nejméně kilogramů chleba a litrů mléka si mohli koupit zaměstnanci pracující v odvětví Zemědělství, lesnictví a rybářství (850 kg chleba a 880 l mléka). V posledním čtvrtletí roku 2018 si nejvíce kilogramů chleba a litrů mléka mohli koupit zaměstnanci v odvětví Informační a komunikační činnosti (2 353 kg chleba a 2 883 l mléka) a naopak nejméně kilogramů chleba a litrů mléka si mohli koupit zaměstnanci pracující v odvětví Ubytování, stravování a pohostinství (791 kg chleba a 969 l mléka). 

2.3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší procentuální meziroční nárůst)?

Porovnáme-li mezi sebou pouze roky 2006 a 2018, zjistíme, že nejnižší procentuální nárůst cen vybraných kategorií potravin byl zaznamenán u cukru krystalového, který byl v roce 2018 dokonce o 27,52 % levnější než v roce 2006. V tomto případě tedy nelze hovořit o nárůstu ceny, nýbrž o jejím poklesu. Druhou a zároveň poslední potravinou, u které byl mezi roky 2006 a 2018 zaznamenán pokles průměrné ceny, byla rajská jablka červená kulatá, která zlevnila o 23,07 %. Na opačném spektru stojí máslo, u kterého byl mezi roky 2006 a 2018 zaznamenán nárůst jeho průměrné ceny o 98,37 % a těstoviny vaječné, u kterých byl nárůst průměrné ceny 83,45 %. 
Podíváme-li se na procentuální rozdíly vybraných kategorií potravin mezi jednotlivými roky, byl nejvyšší pokles průměrné ceny zaznamenán u rajských jablek červených kulatých mezi roky 2006 a 2007 přičemž tento pokles činil 30,28 %. A naopak nejvyšší nárůst průměrné ceny byl zaznamenán u paprik, rovněž mezi roky 2006 a 2007, kdy došlo k jejich zdražení o téměř 95 %.

2.4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

Sečteme-li průměrné ceny vybraných potravin a průměrné mzdy v jednotlivých pracovních odvětvích v rámci jednotlivých roků, zjistíme, že rok, ve kterém by byl meziroční nárůst cen potravin oproti meziročnímu nárůstu mezd větší než 10 %, neexistuje. Za zmínku jistě stojí období mezi roky 2010 až 2013, ve kterém byl meziroční nárůst cen potravin vyšší než růst mezd. Nejvýraznější rozdíl mezi růstem cen potravin a růstem mezd byl zaznamenán mezi roky 2012 a 2013, kdy ceny potravin vzrostly o 5,1 % a průměrné mzdy naopak o 1,56 % poklesly. Následkem toho byl nárůst cen potravin v roce 2013 v porovnání se mzdami o 6,66 % vyšší.

2.5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Na základě získaných dat lze konstatovat, že mezi výškou HDP a cenami potravin existuje v rámci jednoho roku vzájemná souvislost. Neboli pokud HDP klesne v jednom roce, zaznamenají pokles i ceny potravin v témže roce. Tomuto trendu se však vymyká období mezi roky 2011 až 2014, kdy byl tento jev opačný, zatímco HDP meziročně klesalo, ceny potravin stoupaly a opačně. K ustálení došlo opět v roce 2015 a do konce sledovaného období se pomyslné křivky HDP a cen potravin opět vzájemně kopírovaly. 
Vzájemný vztah mezi výškou HDP a průměrnými mzdami není úplně jednoznačný. Nicméně na základě získaných dat by se dalo usuzovat, že obě sledované veličiny jsou ve vzájemně inverzním vztahu. Neboli pokud v jednom roce vzroste HDP, dojde k poklesu mezd v témže roce a opačně, pokud HDP klesne, ve stejném roce dojde k nárůstu průměrných mezd. Tento trend vykazovalo 8 sledovaných roků z celkových 11. Ve zbylých třech případech vykazovaly pomyslné křivky HDP a mezd stejný charakter. 
