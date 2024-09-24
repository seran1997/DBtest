/*
Отберите названия уникальных категорий фильмов, в которых снималась Ума Вуд (англ. Uma Wood).
*/
SELECT DISTINCT c.name AS category_name        
FROM actor AS a
JOIN film_actor AS fa ON fa.actor_id = a.actor_id
JOIN film_category AS fc ON fc.film_id = fa.film_id
JOIN category AS c ON c.category_id = fc.category_id
WHERE a.first_name = 'Uma' AND  a.last_name = 'Wood';
