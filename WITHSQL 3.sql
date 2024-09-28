/*Проанализируйте данные из таблицы invoice за 2012 и 2013 годы. В итоговую таблицу должны войти поля:
month — номер месяца;
sum_total_2012 — выручка за этот месяц в 2012 году;
sum_total_2013 — выручка за этот месяц в 2013 году;
perc — процент, который отображает, насколько изменилась месячная выручка в 2013 году по сравнению с 2012 годом.
Округлите значение в поле perc до ближайшего целого числа. Отсортируйте таблицу по значению в поле month от меньшего к большему.*/
WITH
t_1 AS (SELECT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
         SUM(total) 
         FROM invoice AS i
         WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date))=2012
         GROUP BY month
         ORDER BY month),
 t_2 AS (SELECT EXTRACT(MONTH FROM CAST(invoice_date AS date)) AS month,
         SUM(total)
         FROM invoice AS i
         WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date))=2013
         GROUP BY month
         ORDER BY month)
SELECT t_1.month,
       t_1.SUM AS sum_total_2012,
       t_2.SUM AS sum_total_2013,
       ROUND((t_2.SUM - t_1.SUM) / t_1.SUM * 100) AS perc
FROM t_1
FULL JOIN t_2 ON t_1.month=t_2.month
ORDER BY t_1.month