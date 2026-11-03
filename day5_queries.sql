-- 1
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;

-- 2
SELECT department, SUM(salary) AS total_salary, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department;

-- 3
SELECT department, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employees
GROUP BY department;

-- 4
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
ORDER BY emp_count DESC;

-- 5
SELECT city, COUNT(*) AS emp_count
FROM employees
GROUP BY city
ORDER BY emp_count DESC;

-- 6
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 7
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;

-- 8
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) >= 5;

-- 9
SELECT department, COUNT(*) AS emp_count
FROM employees
WHERE salary > 50000
GROUP BY department;

-- 10
SELECT department, COUNT(*) AS emp_count
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) >= 3;

-- 11
SELECT city, COUNT(*) AS emp_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 1;                         -- 5 rows (NULL bhi aata hai)

SELECT city, COUNT(*) AS emp_count
FROM employees
WHERE city IS NOT NULL
GROUP BY city
HAVING COUNT(*) > 1;                         -- 4 rows

-- 12
SELECT manager_id, COUNT(*) AS reportees
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id;

-- 13
SELECT manager_id, COUNT(*) AS reportees
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING COUNT(*) > 2;

-- 14
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS joiners
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;

-- 15
SELECT department, name, COUNT(*) FROM employees GROUP BY department;   -- ERROR
SELECT department, COUNT(*) FROM employees GROUP BY department;         -- sahi

-- 16
SELECT department, COUNT(*) FROM employees WHERE COUNT(*) > 3 GROUP BY department;   -- ERROR
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;                                                    -- sahi

-- 17
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

-- 18
SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

-- 19
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;

-- 20
SELECT customer_id, SUM(amount) AS total
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 3000;

-- 21
SELECT customer_id, SUM(amount) AS total
FROM orders
GROUP BY customer_id
ORDER BY total DESC
LIMIT 3;

-- 22
SELECT EXTRACT(MONTH FROM order_date) AS order_month,
       COUNT(*) AS order_count,
       SUM(amount) AS revenue
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY order_month;

-- 23
SELECT EXTRACT(MONTH FROM order_date) AS order_month, SUM(amount) AS revenue
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
HAVING SUM(amount) >= 4000;