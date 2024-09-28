/*Перепишите один из своих прошлых запросов, используя ключевое слово WITH. 
Составьте сводную таблицу. Посчитайте заказы, оформленные за каждый месяц в течение нескольких лет: с 2011 по 2013 год. Итоговая таблица должна включать четыре поля: invoice_month, year_2011, year_2012, year_2013. Поле month должно хранить месяц в виде числа от 1 до 12. 
Если в какой-либо месяц заказы не оформляли, номер такого месяца всё равно должен попасть в таблицу.*/
WITH
t_1 AS (SELECT DISTINCT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
          COUNT(invoice_id)
         FROM invoice AS i
         WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date))=2011
         GROUP BY month
         ORDER BY month),
t_2 AS (SELECT DISTINCT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
          COUNT(invoice_id)
         FROM invoice AS i
         WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date))=2012
         GROUP BY month
         ORDER BY month),
t_3 AS (SELECT DISTINCT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
          COUNT(invoice_id) 
         FROM invoice AS i
         WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date))=2013
         GROUP BY month
         ORDER BY month)
SELECT t_1.month,
       t_1.count AS year_2011,
       t_2.count AS year_2012,
       t_3.count AS year_2013
FROM t_1
FULL JOIN t_2 ON t_1.month=t_2.month
FULL JOIN t_3 ON t_1.month=t_3.month