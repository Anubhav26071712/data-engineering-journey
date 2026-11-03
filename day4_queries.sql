-- 1
SELECT COUNT(*) AS total_employees FROM employees;

-- 2
SELECT COUNT(*) AS total_rows, COUNT(city) AS city_known FROM employees;

-- 3
SELECT COUNT(manager_id) AS with_manager FROM employees;

-- 4
SELECT SUM(salary) AS total_salary FROM employees;

-- 5
SELECT AVG(salary) AS avg_salary FROM employees;

-- 6
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees;

-- 7
SELECT COUNT(*) AS emp_count, SUM(salary) AS total_salary, AVG(salary) AS avg_salary
FROM employees
WHERE department = 'Sales';

-- 8
SELECT ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE department = 'Engineering';

-- 9
SELECT SUM(salary) / COUNT(*) AS int_division, AVG(salary) AS true_avg
FROM employees
WHERE department = 'Engineering';   -- 72833 aur 72833.3333...

-- 10
SELECT COUNT(*) AS emp_count, SUM(salary) AS total_salary
FROM employees
WHERE city = 'Delhi';

-- 11
SELECT COUNT(*) FROM employees WHERE salary > 60000;

-- 12
SELECT COUNT(DISTINCT department) FROM employees;

-- 13
SELECT COUNT(DISTINCT city) FROM employees;   -- NULL nahi ginta, isliye 11

-- 14
SELECT MIN(hire_date) AS oldest, MAX(hire_date) AS newest FROM employees;

-- 15
SELECT ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE hire_date >= '2022-01-01';

-- 16
SELECT name, MAX(salary) FROM employees;   -- ERROR (kal GROUP BY se samjhenge)
SELECT name, salary FROM employees ORDER BY salary DESC LIMIT 1;   -- sahi tareeka

-- 17
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM customers WHERE country = 'India';

-- 18
SELECT COUNT(*) AS total_orders,
       SUM(amount) AS revenue,
       ROUND(AVG(amount), 2) AS avg_order,
       MIN(amount) AS min_order,
       MAX(amount) AS max_order
FROM orders;

-- 19
SELECT COUNT(*) AS order_count, SUM(amount) AS total, ROUND(AVG(amount), 2) AS avg_order
FROM orders
WHERE customer_id = 1;

-- 20
SELECT COUNT(*) AS order_count, SUM(amount) AS total
FROM orders
WHERE amount > 1000;

-- 21
SELECT COUNT(*) AS order_count, SUM(amount) AS total
FROM orders
WHERE order_date BETWEEN '2026-04-01' AND '2026-06-30';

-- 22
SELECT COUNT(DISTINCT customer_id) FROM orders;

-- 23
SELECT MIN(order_date) AS first_order, MAX(order_date) AS last_order FROM orders;