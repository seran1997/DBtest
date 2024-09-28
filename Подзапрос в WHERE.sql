/*Напишите код для первого подзапроса. Таблица invoice_line хранит информацию о купленных треках. Выгрузите из неё только те заказы (поле invoice_id), которые включают больше пяти треков.*/
SELECT invoice_id
FROM invoice_line
WHERE invoice_id IN (SELECT nl.invoice_id
                  FROM invoice_line AS nl 
                  LEFT JOIN track AS t ON nl.invoice_id = t.track_id
                  GROUP BY nl.invoice_id
                  HAVING COUNT(t.track_id) > 5)
GROUP BY invoice_id