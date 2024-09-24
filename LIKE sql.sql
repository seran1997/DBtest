SELECT lastname,age 
FROM employee
WHERE lastname LIKE 'A_d%';
/* Функция LIKE + регулярные выражения в SQL
Использование подстановочного знака [Шарль]
Следующая инструкция SQL выбирает всех клиентов с городом, начинающимся с "b", "s" или "p":

Пример
SELECT * FROM Customers
WHERE City LIKE '[bsp]%';
Следующая инструкция SQL выбирает всех клиентов с городом, начинающимся с «a», «b» или «c»:

Пример
SELECT * FROM Customers
WHERE City LIKE '[a-c]%';
С помощью [!charlist] Подстановочный знак
Две следующие инструкции SQL выбирают всех клиентов с городом, не начинающимся с "b", "s" или "p":

Пример
SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';
Or:

Пример
SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';
*/