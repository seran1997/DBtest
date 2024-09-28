/*Отберите данные по месяцам с 2010 по 2013 год, когда проходили инвестиционные раунды. Сгруппируйте данные по номеру месяца и получите таблицу, в которой будут поля:
номер месяца, в котором проходили раунды;
количество уникальных названий фондов из США, которые инвестировали в этом месяце;
количество компаний, купленных за этот месяц;
общая сумма сделок по покупкам в этом месяце.*/
WITH db1 AS (SELECT DISTINCT EXTRACT(MONTH FROM cast(fr.funded_at AS date)) AS month,
             COUNT(DISTINCT f.name) AS cf
             FROM fund AS f             
             LEFT JOIN investment AS i ON f.id = i.fund_id
             LEFT JOIN funding_round AS fr ON i.funding_round_id = fr.id
             WHERE f.country_code='USA' AND
             EXTRACT (YEAR FROM fr.funded_at) IN (2010,2011,2012,2013)
             GROUP BY month),
db2 AS (SELECT DISTINCT EXTRACT(MONTH FROM cast(acq.acquired_at AS date)) AS month,
       COUNT(acquired_company_id) AS cc,
       SUM(price_amount) AS totalval
       FROM acquisition AS acq
       WHERE EXTRACT (YEAR FROM acq.acquired_at) IN (2010,2011,2012,2013)
       GROUP BY month)
SELECT db1.month,db1.cf,db2.cc,db2.totalval
FROM db1
LEFT JOIN db2 ON db1.month=db2.month