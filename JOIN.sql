/*Для каждой компании найдите количество учебных заведений, которые окончили её сотрудники. Выведите название компании и число уникальных названий учебных заведений. Составьте топ-5 компаний по количеству университетов.
*/
SELECT c.name,
COUNT(DISTINCT e.instituition)
FROM company AS c
INNER JOIN people AS p ON c.id = p.company_id
INNER JOIN education as e ON e.person_id=p.id
GROUP BY c.name
ORDER BY COUNT(DISTINCT e.instituition) DESC
LIMIT 5;