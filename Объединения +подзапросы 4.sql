/*Определите, летом какого года общая выручка в магазине была максимальной. Затем проанализируйте данные за этот год по странам. Выгрузите таблицу с полями:
country — название страны;
total_invoice — число заказов, оформленных в этой стране в тот год, когда общая выручка за лето была максимальной;
total_customer — число клиентов, зарегистрированных в этой стране.
Отсортируйте таблицу по убыванию значений в поле total_invoice, а затем добавьте сортировку по названию страны в лексикографическом порядке.*/
SELECT i.billing_country AS country,
       COUNT(i.total) AS total_invoice,
       с.total_customer
FROM invoice AS i
LEFT JOIN (SELECT country,
           COUNT(customer_id) AS total_customer
           FROM client
           GROUP BY country) AS с ON i.billing_country=с.country
WHERE EXTRACT(YEAR FROM CAST(invoice_date AS date))  = (
                                            --Год с максимальной выручкой летом
                                            SELECT EXTRACT(YEAR FROM CAST(invoice_date AS date)) AS year
                                            FROM invoice AS i
                                            WHERE EXTRACT(MONTH FROM CAST(invoice_date AS date)) IN (6,7,8)
                                            GROUP BY EXTRACT(YEAR FROM CAST(invoice_date AS date))
                                            ORDER BY SUM(total) DESC
                                            LIMIT 1)
 
GROUP BY i.billing_country,
         с.total_customer
ORDER BY total_invoice DESC,
         country;