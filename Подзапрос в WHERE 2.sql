/*Для каждой страны (поле billing_country) посчитайте минимальное, максимальное и среднее значение выручки из поля total. Назовите поля так: min_total, max_total и avg_total. Нужные поля для выгрузки хранит таблица invoice. 
При подсчёте учитывайте только те заказы, которые включают более пяти треков. Стоимость заказа должна превышать среднюю цену одного трека. Используйте код, написанный в предыдущих заданиях. 
Отсортируйте итоговую таблицу по значению в поле avg_total от большего к меньшему. Записи с одинаковым значением avg_total отсортируйте по названию страны в лексикографическом порядке.*/
SELECT billing_country,MIN(total) as min_total,MAX(total) as max_total, AVG(total) as avg_total
FROM invoice 
WHERE invoice_id IN (SELECT nl.invoice_id
                  FROM invoice_line AS nl 
                  LEFT JOIN track AS t ON nl.invoice_id = t.track_id
                  GROUP BY nl.invoice_id
                  HAVING COUNT(t.track_id) > 5)
AND total > (SELECT AVG(total)
FROM invoice)
GROUP BY billing_country
ORDER BY avg_total DESC,billing_country