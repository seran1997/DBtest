/*
Массовую любовь к музыке 90-х можно понять. А как обстоит дело с жанрами — какие популярнее? Сгруппируйте данные по жанрам и посчитайте количество заказов. Выведите на экран два поля: одно с названием жанра, второе — с количеством купленных треков этого жанра. Отсортируйте таблицу по убыванию количества заказов.
*/
SELECT g.name,
SUM(il.quantity) as quant
FROM track as t
INNER JOIN genre as g t.genre_id=g.genre_id
INNER JOIN invoice_line as il t.track_id=il.track_id
ORDER BY quant DESC