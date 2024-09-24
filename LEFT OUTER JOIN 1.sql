/*
Для каждого года, выраженного числом, посчитайте уникальные названия купленных треков.
*/
SELECT EXTRACT(YEAR FROM CAST(i.invoice_date AS date)) AS year_of_invoice,
       COUNT(DISTINCT t.name)
FROM invoice AS i-- определите левую таблицу
LEFT OUTER JOIN invoice_line AS il ON i.invoice_id = il.invoice_id
LEFT OUTER JOIN track AS t ON il.track_id = t.track_id
GROUP BY year_of_invoice;

*/ 2 вариант на коце вылетела сумма (? почему)
SELECT EXTRACT(YEAR FROM CAST(i.invoice_date AS date)) AS year_of_invoice,
       COUNT(DISTINCT t.name)
FROM track AS t-- определите левую таблицу
LEFT OUTER JOIN invoice_line AS il ON t.track_id = il.track_id
LEFT OUTER JOIN invoice AS i ON i.invoice_id = il.invoice_id
GROUP BY year_of_invoice;