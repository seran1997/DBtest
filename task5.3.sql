/*Составьте таблицу, куда войдут уникальные пары с номерами сотрудников из предыдущей задачи и учебным заведением, которое окончил сотрудник.*/
SELECT DISTINCT p.id,ed.instituition
FROM people AS p
INNER JOIN education AS ed ON  p.id=ed.person_id
WHERE p.company_id IN 
(SELECT c.id
FROM company AS c
JOIN funding_round AS fr ON c.id = fr.company_id
WHERE STATUS ='closed'
AND is_first_round = 1
AND is_last_round = 1
GROUP BY c.id);