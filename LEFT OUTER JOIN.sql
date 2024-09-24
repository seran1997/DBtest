/*
Отобразите названия фильмов, в которых снимались актёры, не указанные в базе.
*/
SELECT m.title
FROM movie AS m
LEFT OUTER JOIN film_actor AS fa ON m.film_id = fa.film_id
GROUP BY m.title
HAVING COUNT(fa.actor_id) = 0;