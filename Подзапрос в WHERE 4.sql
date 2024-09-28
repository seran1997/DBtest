/*Выгрузите уникальные названия городов, в которых оформлялся заказ стоимостью, превышающей максимальное значение за 2009 год.*/
SELECT DISTINCT billing_city
FROM invoice
WHERE total > (SELECT MAX(total)
              FROM invoice
              GROUP BY EXTRACT(YEAR FROM cast(invoice_date as date))
              HAVING EXTRACT(YEAR FROM cast(invoice_date as date))= 2009
              )