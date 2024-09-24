/*Нужно посмотреть продажи по годам. Выгрузите таблицу, в которую войдут:
год покупки;
минимальная сумма заказа;
максимальная сумма заказа;
общая сумма выручки;
количество заказов;
средняя выручка на уникального покупателя, округлённая до ближайшего целого числа.
Отсортируйте таблицу по году от большего к меньшему. Отберите только те записи, в которых в поле billing_country указаны страны: США (англ. USA), Великобритания (англ. United Kingdom) и Германия (англ. Germany).
*/
SELECT EXTRACT( YEAR FROM cast(invoice_date as date)),
                MIN(total),
                MAX(total),
                SUM(total),
                COUNT(customer_id),
                ROUND(SUM(total)/COUNT(DISTINCT(customer_id))) 
FROM invoice
WHERE billing_country IN ('USA','United Kingdom','Germany')
GROUP BY EXTRACT( YEAR FROM cast(invoice_date as date))
ORDER BY EXTRACT( YEAR FROM cast(invoice_date as date)) DESC;