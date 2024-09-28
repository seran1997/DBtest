/*Напишите похожий запрос: выведите среднее число учебных заведений (всех, не только уникальных), которые окончили сотрудники Socialnet.*/
WITH db1 AS 
    (SELECT p.id,
    COUNT(ed.instituition) AS c1
    FROM people AS p
    RIGHT JOIN education AS ed ON p.id=ed.person_id
    WHERE company_id IN (
    SELECT id
    FROM company AS p
    WHERE name='Socialnet')
    GROUP BY p.id)
SELECT AVG(c1)
FROM db1