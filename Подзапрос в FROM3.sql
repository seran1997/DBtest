/*Найдите средние значения полей, в которых указаны минимальная и максимальная длительность отобранных фильмов. Отобразите только два этих поля. Назовите их avg_min_length и avg_max_length соответственно.*/
SELECT AVG(sub.min_length) AS avg_min_length,
 AVG(sub.max_length) AS avg_max_length
FROM (SELECT top.rating,
       MIN(top.length) AS min_length,
       MAX(top.length) AS max_length,
       AVG(top.length) AS avg_length,
       MIN(top.rental_rate) AS min_rental_rate,
       MAX(top.rental_rate) AS max_rental_rate,
       AVG(top.rental_rate) AS avg_rental_rate
FROM
  (SELECT title,
          rental_rate,
          length,
          rating
   FROM movie
   WHERE rental_rate > 2
   ORDER BY length DESC
   LIMIT 40) AS top
GROUP BY top.rating
ORDER BY avg_length) as sub;