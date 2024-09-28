/*Составьте сводную таблицу и выведите среднюю сумму инвестиций для стран, в которых есть стартапы, зарегистрированные в 2011, 2012 и 2013 годах. Данные за каждый год должны быть в отдельном поле. Отсортируйте таблицу по среднему значению инвестиций за 2011 год от большего к меньшему.*/
WITH
y11 AS (SELECT country_code AS country,
        AVG(funding_total) AS y_2011
        FROM company
        WHERE EXTRACT(YEAR FROM CAST(founded_at AS date))=2011
        GROUP BY country
       ),
y12 AS (SELECT country_code AS country,
        AVG(funding_total) AS y_2012
        FROM company
        WHERE EXTRACT(YEAR FROM CAST(founded_at AS date))=2012
        GROUP BY country
       ),
y13 AS (SELECT country_code AS country,
        AVG(funding_total) AS y_2013
        FROM company
        WHERE EXTRACT(YEAR FROM CAST(founded_at AS date))=2013
        GROUP BY country
       )
SELECT y11.country,y11.y_2011,y12.y_2012,y13.y_2013
FROM y11
INNER JOIN y12 ON y11.country=y12.country
INNER JOIN y13 ON y11.country=y13.country
ORDER BY y_2011 DESC