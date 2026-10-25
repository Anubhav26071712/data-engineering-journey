-- 1
SELECT * FROM employees WHERE salary > 50000;

-- 2
SELECT * FROM employees WHERE department = 'Sales';

-- 3
SELECT * FROM employees WHERE department <> 'Engineering';

-- 4
SELECT * FROM employees WHERE city = 'Delhi' OR city = 'Pune';

-- 5
SELECT * FROM employees WHERE city IN ('Delhi', 'Pune');

-- 6
SELECT * FROM employees WHERE department = 'Engineering' AND salary > 70000;

-- 7
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 60000;

-- 8
SELECT * FROM employees WHERE name LIKE 'A%';

-- 9
SELECT * FROM employees WHERE name LIKE '%a';

-- 10
SELECT * FROM employees WHERE name LIKE '%ar%';   -- 3 rows (capital 'Ar' wala Arjun nahi aata)
SELECT * FROM employees WHERE name ILIKE '%ar%';  -- 4 rows (Arjun bhi aa gaya)

-- 11
SELECT * FROM employees WHERE name LIKE '____ %';

-- 12
SELECT * FROM employees WHERE city IS NULL;       -- 2 rows
SELECT * FROM employees WHERE city = NULL;        -- 0 rows (galat tareeka)

-- 13
SELECT * FROM employees WHERE city IS NOT NULL;

-- 14
SELECT * FROM employees WHERE hire_date >= '2022-01-01';

-- 15
SELECT * FROM employees
WHERE department = 'Sales' OR department = 'HR' AND salary > 50000;      -- 6 rows

SELECT * FROM employees
WHERE (department = 'Sales' OR department = 'HR') AND salary > 50000;   -- 4 rows

-- 16
SELECT * FROM employees WHERE department NOT IN ('Sales', 'HR');

-- 17
SELECT * FROM customers WHERE country IN ('India', 'UK');

-- 18
SELECT * FROM orders WHERE amount > 1000 AND order_date >= '2026-03-01';

-- 19
SELECT * FROM orders WHERE order_date BETWEEN '2026-04-01' AND '2026-06-30';

-- 20
SELECT * FROM orders WHERE customer_id NOT IN (1, 2, 3);