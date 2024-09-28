/*Составьте сводную таблицу. Посчитайте заказы, оформленные за каждый месяц в течение нескольких лет: с 2011 по 2013 год включительно. Итоговая таблица должна включать четыре поля: invoice_month, year_2011, year_2012, year_2013. Поле invoice_month должно хранить месяц в виде числа от 1 до 12. 
Если в какой-либо месяц заказы не оформляли, номер такого месяца всё равно должен попасть в таблицу.
В этом задании не будет подсказок. Используйте любые методы, которые посчитаете нужными.*/
SELECT t_1.month AS invoice_month,
       t_1.count AS year_2011,
       t_2.count AS year_2012,
       t_3.count AS year_2013
FROM (SELECT DISTINCT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
             COUNT(invoice_id)
      FROM invoice
      WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date)) = 2011
      GROUP BY EXTRACT(MONTH FROM CAST(invoice_date AS date))
      ORDER BY month) AS t_1 
FULL OUTER JOIN (
    SELECT DISTINCT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
             COUNT(invoice_id)
      FROM invoice
      WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date)) = 2012
      GROUP BY EXTRACT(MONTH FROM CAST(invoice_date AS date))
      ORDER BY month) AS t_2 ON t_1.month = t_2.month
FULL OUTER JOIN (
    SELECT DISTINCT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
             COUNT(invoice_id)
      FROM invoice
      WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date)) = 2013
      GROUP BY EXTRACT(MONTH FROM CAST(invoice_date AS date))
      ORDER BY month) AS t_3 ON t_1.month = t_3.month