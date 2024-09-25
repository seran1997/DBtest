/*Используйте запрос из первого задания и проанализируйте данные о возрастных рейтингах отобранных фильмов. Выгрузите в итоговую таблицу следующие поля:
возрастной рейтинг — rating;
минимальное и максимальное значения длительности фильма — min_length и max_length соответственно;
среднее значение длительности фильма — avg_length;
минимум, максимум и среднее для цены просмотра — min_rental_rate, max_rental_rate, avg_rental_rate соответственно.
Отсортируйте среднюю длительность фильма по возрастанию.*/
SELECT tl.rating,
        MIN(tl.length) as min_length,
        MAX(tl.length) as max_length,
        AVG(tl.length) as avg_length,
        MIN(tl.rental_rate) as min_rental_rate,
        MAX(tl.rental_rate) as max_rental_rate,
        AVG(tl.rental_rate) as avg_rental_rate
FROM (SELECT title,
       rental_rate,
	   length,
	   rating
FROM movie as m
WHERE rental_rate > 2
ORDER BY length DESC
LIMIT 40) as tl
GROUP BY tl.rating
ORDER BY avg_length