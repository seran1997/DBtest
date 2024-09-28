/*Отберите фамилии пользователей, которые:
оформили хотя бы один заказ в январе 2013 года,
а также сделали хотя бы один заказ в любом другом месяце того же года.
Пользователей, которые оформили заказы только в январе, а в остальное время ничего не заказывали, в таблицу включать не нужно.*/
SELECT last_name
FROM client
WHERE customer_id IN
    (SELECT not_january.customer_id
     FROM
       (SELECT DISTINCT(customer_id)
        FROM invoice
        WHERE (CAST(invoice_date AS DATE) BETWEEN '2013-01-01' AND '2013-01-31')) AS january
     INNER JOIN
       (SELECT DISTINCT(customer_id)
        FROM invoice
        WHERE (CAST(invoice_date AS DATE) BETWEEN '2013-02-01' AND '2013-12-31')) AS not_january ON january.customer_id = not_january.customer_id);