-- 1
SELECT * FROM employees ORDER BY salary DESC;

-- 2
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- 3
SELECT * FROM employees ORDER BY salary ASC LIMIT 3;

-- 4
SELECT * FROM employees ORDER BY name;

-- 5
SELECT * FROM employees ORDER BY hire_date ASC;

-- 6
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 3;

-- 7
SELECT * FROM employees ORDER BY department ASC, salary DESC;

-- 8
SELECT * FROM employees
WHERE department = 'Sales'
ORDER BY salary DESC
LIMIT 1;

-- 9
SELECT * FROM employees
WHERE city IN ('Delhi', 'Pune')
ORDER BY salary DESC;

-- 10
SELECT * FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- 11
SELECT * FROM employees ORDER BY salary DESC LIMIT 3 OFFSET 3;

-- 12
SELECT name, salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC
LIMIT 3;

-- 13
SELECT DISTINCT department FROM employees;

-- 14
SELECT DISTINCT city FROM employees;

-- 15
SELECT DISTINCT city FROM employees ORDER BY city;                  -- NULL neeche
SELECT DISTINCT city FROM employees ORDER BY city DESC;             -- NULL upar
SELECT DISTINCT city FROM employees ORDER BY city DESC NULLS LAST; -- NULL neeche

-- 16
SELECT DISTINCT country FROM customers;

-- 17
SELECT * FROM customers ORDER BY country ASC, name ASC;

-- 18
SELECT * FROM orders ORDER BY amount DESC LIMIT 3;

-- 19
SELECT * FROM orders ORDER BY order_date DESC LIMIT 5;

-- 20
SELECT DISTINCT customer_id FROM orders;