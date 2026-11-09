-- 1
SELECT c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;

-- 2
SELECT c.name, c.country
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 3
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL AND c.country = 'India';

-- 4
SELECT c.name, COUNT(o.order_id) AS order_count          -- sahi
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY order_count DESC;

SELECT c.name, COUNT(*) AS wrong_count                    -- galat: bina-mel wali row bhi ginti
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 5
SELECT c.name, COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- 6
SELECT c.name, COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COALESCE(SUM(o.amount), 0) < 1000;

-- 7
SELECT c.country,
       COUNT(DISTINCT c.customer_id) AS customers,
       COUNT(o.order_id)             AS orders,
       COALESCE(SUM(o.amount), 0)    AS revenue
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY revenue DESC;

-- 8
SELECT c.name,
       COALESCE(CAST(MAX(o.order_date) AS VARCHAR), 'No orders') AS last_order
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY c.customer_id;

-- 9 (shart ON mein: 18 rows)
SELECT c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.amount > 1000;

-- 10 (shart WHERE mein: 10 rows, LEFT JOIN ka asar khatam)
SELECT c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 1000;

-- 11
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.amount > 1000
WHERE o.order_id IS NULL;

-- 12
SELECT c.name, o.order_id, o.amount
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

-- 13
SELECT d.dept_name, e.name
FROM departments d
LEFT JOIN employees e ON e.department = d.dept_name;

-- 14
SELECT d.dept_name, d.location
FROM departments d
LEFT JOIN employees e ON e.department = d.dept_name
WHERE e.emp_id IS NULL;

-- 15
SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM departments d
LEFT JOIN employees e ON e.department = d.dept_name
GROUP BY d.dept_name;

-- 16
SELECT d.location,
       COUNT(*)        AS wrong_count,
       COUNT(e.emp_id) AS right_count
FROM departments d
LEFT JOIN employees e ON e.department = d.dept_name
GROUP BY d.location;

-- 17
SELECT d.dept_name,
       COALESCE(ROUND(AVG(e.salary), 2), 0) AS avg_salary
FROM departments d
LEFT JOIN employees e ON e.department = d.dept_name
GROUP BY d.dept_name;

-- 18
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.department = d.dept_name;

-- 19
SELECT o.order_id, c.name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- 20 (bonus)
SELECT name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);