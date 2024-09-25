/*Для каждой страны посчитайте среднюю стоимость заказов в 2009 году по месяцам. Отберите данные за 2, 5, 7 и 10-й месяцы и сложите средние значения стоимости заказов. Выведите названия стран, у которых это число превышает 10 долларов.*/
SELECT sub.country
FROM
  (SELECT billing_country AS country,
          EXTRACT(YEAR FROM CAST(invoice_date AS DATE)) AS YEAR,
          EXTRACT(MONTH FROM CAST (invoice_date AS DATE)) AS MONTH,
 AVG(total) AS avg_total
   FROM invoice AS i
   WHERE EXTRACT(YEAR FROM CAST(invoice_date AS DATE)) = 2009
   GROUP BY billing_country,
            EXTRACT(YEAR FROM CAST(invoice_date AS DATE)),
            EXTRACT (MONTH FROM CAST(invoice_date AS DATE))) AS sub
WHERE sub.MONTH IN (2, 5, 7, 10)
GROUP BY sub.country
HAVING SUM(sub.avg_total) > 10;