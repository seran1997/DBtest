/*Составьте список уникальных номеров сотрудников, которые работают в компаниях, отобранных в предыдущем задании.*/
SELECT DISTINCT p.id
FROM people AS p
WHERE p.company_id IN 
(SELECT c.id
FROM company AS c
JOIN funding_round AS fr ON c.id = fr.company_id
WHERE STATUS ='closed'
AND is_first_round = 1
AND is_last_round = 1
GROUP BY c.id);
 