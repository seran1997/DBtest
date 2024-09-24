/*Выгрузите таблицу, в которой будут такие поля:
название компании-покупателя;
сумма сделки;
название компании, которую купили;
сумма инвестиций, вложенных в купленную компанию;
доля, которая отображает, во сколько раз сумма покупки превысила сумму вложенных в компанию инвестиций, округлённая до ближайшего целого числа.
Не учитывайте те сделки, в которых сумма покупки равна нулю. Если сумма инвестиций в компанию равна нулю, исключите такую компанию из таблицы. 
Отсортируйте таблицу по сумме сделки от большей к меньшей, а затем по названию купленной компании в лексикографическом порядке. Ограничьте таблицу первыми десятью записями.

WITH l AS (SELECT c.id AS id_1, 
 c.name AS pur, 
 a.price_amount AS price 
 FROM acquisition AS a 
 LEFT JOIN company AS c ON a.acquiring_company_id = c.id 
 WHERE a.price_amount > 0), 
 b AS (SELECT c.id AS id_2, 
 c.name AS buy, 
 c.funding_total AS ft 
           FROM acquisition AS a
 LEFT JOIN company AS c ON a.acquired_company_id = c.id 
 WHERE c.funding_total > 0)  
SELECT l.pur, 
 l.price, 
 b.buy, 
 b.ft, 
 ROUND(l.price/b.ft ) AS prfund 
FROM l JOIN b ON l.id_1 = b.id_2  
ORDER BY l.price DESC, b.buy 
LIMIT 10*/

SELECT c.name AS acquiring_name,
       a.price_amount,
       c2.name AS acquired_name,
       c2.funding_total,
       ROUND((a.price_amount / c2.funding_total))

FROM acquisition AS a
LEFT JOIN company AS c ON a.acquiring_company_id=c.id
LEFT JOIN company AS c2 ON a.acquired_company_id=c2.id
WHERE a.price_amount != 0 AND c2.funding_total != 0
ORDER BY  a.price_amount DESC, c2.name
LIMIT 10;
