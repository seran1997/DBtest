/*
Выгрузите таблицу из двух полей: первое поле с фамилией сотрудника, второе — с количеством пользователей, чьи запросы этот сотрудник обработал. Назовите поля employee_last_name и all_customers соответственно. Сгруппируйте записи по идентификатору сотрудника (лучше так, чем по фамилии, чтобы избежать неточностей). Отсортируйте количество пользователей по убыванию, а фамилии сотрудников — в лексикографическом порядке.
*/
SELECT s.last_name as employee_last_name,
        COUNT(c.support_rep_id) as all_customers
FROM staff as s 
LEFT OUTER JOIN client as c ON s.employee_id=c.support_rep_id
GROUP BY employee_id
ORDER BY all_customers DESC, employee_last_name