/*Составьте список с уникальными названиями закрытых компаний, для которых первый раунд финансирования оказался последним.*/
SELECT name
FROM company AS c
JOIN funding_round AS fr ON c.id = fr.company_id
WHERE STATUS ='closed'
AND is_first_round = 1
AND is_last_round = 1
GROUP BY name;