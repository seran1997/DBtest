/*Посчитайте среднюю стоимость аренды фильма каждого возрастного рейтинга. Среди них найдите рейтинг с самыми дорогими для аренды фильмами.
Выведите на экран названия категорий фильмов с этим рейтингом. Добавьте второе поле со средним значением продолжительности фильмов категории.*/
SELECT c.name,AVG(m.length)
FROM movie as m
INNER JOIN film_category as fc ON m.film_id=fc.film_id
LEFT JOIN category as c ON fc.category_id=c.category_id                
WHERE rating = (SELECT  rating
                  FROM movie AS m
                  GROUP BY rating
                  ORDER BY AVG(rental_rate) DESC
                  LIMIT 1)
GROUP BY c.name             