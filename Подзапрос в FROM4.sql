/*Отберите альбомы, названия которых содержат слово 'Rock' и производные от него. В этих альбомах должно быть восемь или более треков. Выведите на экран одно число — среднее количество композиций в отобранных альбомах.*/
SELECT AVG(trc)
FROM (SELECT al.title,COUNT(t.track_id) as trc
FROM album as al
LEFT JOIN track as t ON t.album_id=al.album_id
WHERE title LIKE '%Rock%'
GROUP BY al.title
HAVING COUNT(t.track_id) >= 8) as rock8