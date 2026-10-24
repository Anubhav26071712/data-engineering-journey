-- 1
SELECT * FROM employees;

-- 2
SELECT name, salary FROM employees;

-- 3
SELECT name AS employee_name, salary AS monthly_salary FROM employees;

-- 4
SELECT name, salary * 12 AS annual_salary FROM employees;

-- 5
SELECT name || ' - ' || city AS name_city FROM employees;   -- city NULL ho to poora result NULL
SELECT CONCAT(name, ' - ', city) AS name_city FROM employees; 

-- 6
SELECT name, country FROM customers;

-- 7
SELECT order_id, amount, order_date FROM orders;

-- 8
SELECT department FROM employees;

-- 9
SELECT order_id, amount, amount * 1.18 AS amount_with_gst FROM orders;

-- 10
SELECT 'Hello SQL' AS msg, 2 + 3 AS total;