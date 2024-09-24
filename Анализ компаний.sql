/*Выгрузите таблицу, в которую войдут названия компаний из категории social, получившие финансирование с 2010 по 2013 год включительно. Проверьте, что сумма инвестиций не равна нулю. Выведите также номер месяца, в котором проходил раунд финансирования.*/
SELECT c.name,
       EXTRACT(MONTH FROM fr.funded_at)
FROM company AS c
LEFT JOIN funding_round as fr ON c.id=fr.company_id
WHERE c.category_code = 'social' 
        AND raised_amount>0
        AND EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013;