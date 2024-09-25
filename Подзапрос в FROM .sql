/*1.
Найдите топ-40 самых длинных фильмов, аренда которых составляет больше 2 долларов. Выведите на экран:
название фильма — title;
цену аренды — rental_rate;
длительность фильма — length;
возрастной рейтинг — rating.*/
SELECT *
FROM (SELECT m.title,
              m.rental_rate,
              m.length,
              m.rating
        FROM movie AS m
       WHERE m.rental_rate>2
      ORDER BY length DESC
      LIMIT 40) AS best_long_films; 