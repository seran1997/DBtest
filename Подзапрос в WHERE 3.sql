/*Отберите два самых коротких по продолжительности трека и выгрузите названия их жанров.*/
SELECT g.name
FROM genre as g
WHERE genre_id IN (SELECT t.genre_id
FROM track as t
ORDER BY t.milliseconds
LIMIT 2)