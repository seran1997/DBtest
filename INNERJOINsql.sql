SELECT employee.id,employee.firstname,employee.lastname,salary.salary1+salary.bonus as total_val
FROM employee
INNER JOIN salary ON salary.id=employee.id;
/* подсчёт общей зп для конкретного сотрудника используя INNER JOIN(после ON записанно условие
объединения (в данном случае по идентификатору id, который содержится в обеих таблицах и указывает
на конкретного рабочего)). Так же обратить внимание на название столбцов(лучше записывать названия
столбцов в нижнем регистре, иначе при обращении к столбцу, возможно ошибка).