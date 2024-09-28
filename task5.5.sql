/*Дополните предыдущий запрос и выведите среднее число учебных заведений (всех, не только уникальных), которые окончили сотрудники разных компаний. Нужно вывести только одну запись, группировка здесь не понадобится.*/
WITH db1 AS (SELECT DISTINCT p.id,COUNT(ed.instituition) AS ce 
FROM people AS p
INNER JOIN education AS ed ON  p.id=ed.person_id
WHERE p.company_id IN 
(SELECT c.id
FROM company AS c
JOIN funding_round AS fr ON c.id = fr.company_id
WHERE STATUS ='closed'
AND is_first_round = 1
AND is_last_round = 1
GROUP BY c.id)
GROUP BY p.id)
SELECT AVG(db1.ce)
FROM db1