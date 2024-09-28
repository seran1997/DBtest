/*Сформируйте статистику по категориям фильмов. Отобразите в итоговой таблице два поля:
название категории,
число фильмов из этой категории.
Фильмы для второго поля нужно отобрать по условию. Посчитайте фильмы только с теми актёрами и актрисами, которые больше семи раз снимались в фильмах, вышедших после 2013 года. 
Назовите поля name_category и total_films соответственно. Отсортируйте таблицу по количеству фильмов от большего к меньшему, а затем по полю с названием категории в лексикографическом порядке.*/
SELECT name AS name_category,
       COUNT(film_id) AS total_films 
FROM category AS c
LEFT JOIN film_category AS fc ON fc.category_id = c.category_id
WHERE film_id IN (
                  SELECT film_id
                  FROM film_actor AS fa
                  WHERE actor_id IN (-- Актеры снимавшиеся больше 7 раз
                                       SELECT DISTINCT fa.actor_id
                                       FROM film_actor AS fa
                                       WHERE fa.film_id IN (--Фильмы вышедшие после 2013 года
                                                            SELECT film_id
                                                            FROM movie AS m
                                                            WHERE m.release_year > 2013)
                   GROUP BY fa.actor_id
                   HAVING COUNT(fa.film_id) > 7))
GROUP BY name
ORDER BY total_films DESC,
         name_category