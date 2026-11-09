-- 1
SELECT o.order_id, c.name, o.amount, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- 2
SELECT o.order_id, c.name, c.country, o.amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- 3
SELECT * FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;   -- 7 columns

SELECT customer_id FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;   -- ERROR: ambiguous
SELECT o.customer_id FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id; -- sahi

-- 4
SELECT c.name, o.amount, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.country = 'India';

-- 5
SELECT o.order_id, c.name, c.country, o.amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.amount > 1000
ORDER BY o.amount DESC;

-- 6
SELECT o.order_id, o.amount, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Aarav Kapoor';

SELECT SUM(o.amount) AS total_spent
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Aarav Kapoor';                    -- 5510

-- 7
SELECT c.customer_id, c.name, SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- 8
SELECT c.country, COUNT(*) AS order_count, SUM(o.amount) AS revenue
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY revenue DESC;

-- 9
SELECT c.country, ROUND(AVG(o.amount), 2) AS avg_order
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country;

-- 10
SELECT c.customer_id, c.name, SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(o.amount) > 3000;

-- 11
SELECT c.customer_id, c.name, COUNT(*) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(*) >= 3;

-- 12
SELECT EXTRACT(MONTH FROM o.order_date) AS order_month, SUM(o.amount) AS revenue
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.country = 'India'
GROUP BY EXTRACT(MONTH FROM o.order_date)
ORDER BY order_month;

-- 13
SELECT c.country, MAX(o.amount) AS biggest_order
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country;

-- 14
SELECT COUNT(*) FROM departments;                 -- 6

-- 15
SELECT e.name, d.dept_name, d.location
FROM employees e
INNER JOIN departments d ON e.department = d.dept_name;

-- 16
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.department = d.dept_name
WHERE d.location = 'Mumbai';

-- 17
SELECT d.location, COUNT(*) AS emp_count, SUM(e.salary) AS total_salary
FROM employees e
INNER JOIN departments d ON e.department = d.dept_name
GROUP BY d.location;

-- 18
SELECT d.dept_name, COUNT(*) AS emp_count
FROM departments d
INNER JOIN employees e ON e.department = d.dept_name
GROUP BY d.dept_name;                             -- Legal nahi aata (koi employee nahi)

-- 19
SELECT e.name, e.department, e.salary
FROM employees e
INNER JOIN departments d ON e.department = d.dept_name
WHERE d.budget > 2500000
ORDER BY e.salary DESC
LIMIT 3;

-- 20
SELECT d.dept_name, d.location, ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
INNER JOIN departments d ON e.department = d.dept_name
GROUP BY d.dept_name, d.location;

-- 21
SELECT COUNT(*) FROM orders o CROSS JOIN customers c;    -- 375

-- 22
SELECT COUNT(*) FROM orders o, customers c
WHERE o.customer_id = c.customer_id;                     -- 25

-- 23
SELECT COUNT(*) FROM orders o
INNER JOIN customers c ON o.order_id = c.customer_id;    -- 15 (galat, par chal gaya)