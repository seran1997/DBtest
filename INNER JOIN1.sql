/*
Теперь проанализируйте получившуюся таблицу. Нужно посчитать суммарную стоимость треков для каждого плейлиста. Отобразите в таблице два поля: playlist_name с названием плейлиста и total_revenue с суммарной стоимостью. Отсортируйте данные по значению в поле total_revenue от большего к меньшему.
*/
SELECT 
p.name AS playlist_name,
SUM(i.unit_price) AS total_revenue
FROM track AS t
INNER JOIN invoice_line AS i ON t.track_id=i.track_id
INNER JOIN playlist_track AS pl ON t.track_id=pl.track_id
INNER JOIN playlist AS p ON pl.playlist_id = p.playlist_id
GROUP BY playlist_name
ORDER BY total_revenue DESC;