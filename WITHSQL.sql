/*Перепишите один из своих прошлых запросов с использованием ключевого слова WITH. 
Выведите топ-40 самых длинных фильмов, аренда которых составляет больше 2 долларов. Проанализируйте данные о возрастных рейтингах отобранных фильмов. Выгрузите в итоговую таблицу следующие поля:
возрастной рейтинг (поле rating);
минимальное и максимальное значения длительности (поле length), назовите поля min_length и max_length соответственно;
среднее значение длительности (поле length), назовите поле avg_length;
максимум, минимум и среднее для цены просмотра (поле rental_rate), назовите поля min_rental_rate, max_rental_rate, avg_rental_rate соответственно.
Отсортируйте среднюю длительность фильма по возрастанию.*/
WITH
t1 AS (SELECT title,rating,length,rental_rate
      FROM movie AS m
      WHERE rental_rate>2 
      ORDER BY length DESC
      LIMIT 40)
SELECT rating,
MIN(length) AS min_length,
MAX(length) AS max_length,
AVG(length) AS avg_length,
MIN(rental_rate) AS min_rental_rate,
MAX(rental_rate) AS max_rental_rate,
AVG(rental_rate) AS avg_rental_rate
FROM t1
GROUP BY rating
ORDER BY avg_length