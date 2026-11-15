-- 1
SELECT 'products' AS check_name, COUNT(*) AS value FROM products
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;

-- 2
SELECT oi.order_id, p.product_name, oi.quantity, p.price,
       oi.quantity * p.price AS line_total
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.order_id, oi.item_id;

-- 3
SELECT o.order_id, o.order_date, p.product_name, oi.quantity,
       oi.quantity * p.price AS line_total
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p     ON oi.product_id = p.product_id
ORDER BY o.order_id, oi.item_id;

-- 4
SELECT p.product_name, oi.quantity, oi.quantity * p.price AS line_total
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
WHERE oi.order_id = 9;

SELECT SUM(oi.quantity * p.price) AS order_total
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
WHERE oi.order_id = 9;                                   -- 2750

-- 5
SELECT p.product_name,
       SUM(oi.quantity)           AS units_sold,
       SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

-- 6
SELECT p.category, SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 7
SELECT SUM(o.amount) AS wrong_total                      -- 67620 (fan-out)
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id;

SELECT SUM(oi.quantity * p.price) AS right_total         -- 26940
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id;

SELECT SUM(amount) AS orders_total FROM orders;          -- 26940

-- 8
SELECT o.order_id, o.amount, SUM(oi.quantity * p.price) AS items_total
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p     ON oi.product_id = p.product_id
GROUP BY o.order_id, o.amount
HAVING SUM(oi.quantity * p.price) <> o.amount;           -- 0 rows

-- 9
SELECT order_id, COUNT(*) AS product_lines
FROM order_items
GROUP BY order_id
HAVING COUNT(*) >= 3;

-- 10
SELECT o.order_id, p.product_name, oi.quantity
FROM customers c
INNER JOIN orders o       ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p     ON oi.product_id = p.product_id
WHERE c.name = 'Aarav Kapoor'
ORDER BY o.order_id, oi.item_id;

-- 11
SELECT c.name, SUM(oi.quantity) AS total_units
FROM customers c
INNER JOIN orders o       ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_units DESC
LIMIT 3;

-- 12
SELECT c.country, SUM(oi.quantity) AS total_units
FROM customers c
INNER JOIN orders o       ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.country
ORDER BY total_units DESC;

-- 13
SELECT DISTINCT c.name
FROM customers c
INNER JOIN orders o       ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p     ON oi.product_id = p.product_id
WHERE p.product_name = 'Monitor';

-- 14
SELECT c.country,
       SUM(oi.quantity)           AS units,
       SUM(oi.quantity * p.price) AS revenue
FROM customers c
INNER JOIN orders o       ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p     ON oi.product_id = p.product_id
WHERE p.product_name = 'Monitor'
GROUP BY c.country;

-- 15
SELECT c.country, SUM(oi.quantity * p.price) AS accessories_revenue
FROM customers c
INNER JOIN orders o       ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p     ON oi.product_id = p.product_id
WHERE p.category = 'Accessories'
GROUP BY c.country
ORDER BY accessories_revenue DESC;

-- 16
SELECT p.product_name, p.category, p.price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.item_id IS NULL;

-- 17
SELECT p.product_name, COALESCE(SUM(oi.quantity), 0) AS units_sold
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- 18
SELECT p.category,
       COUNT(DISTINCT p.product_id)   AS products,
       COALESCE(SUM(oi.quantity), 0)  AS units_sold
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY units_sold DESC;



W1	Domestic (India) aur International (baaki) ke hisaab se orders ki ginti aur revenue (JOIN + CASE)
W2	Country-wise kitne customers ne kabhi order nahi diya (LEFT JOIN + IS NULL)
W3	Country-wise bade orders (1000 ya zyada) aur chhote orders (1000 se kam) ki ginti, ek hi query mein (SUM(CASE ...))
W4	Wo employees jinka koi review nahi (naam dikhao)
W5	Manager-wise uske reportees ki average salary (2 decimal), bade se chhota (SELF JOIN)
W6	Department-wise kitne employees ko kisi review mein rating 4 ya zyada mili (alag-alag employees ginno)
W7	Wo employees jinki salary 75000 ya zyada hai aur kisi review mein rating 5 mili	2 rows
W8	Wo employees jo kisi ke manager nahi hain (SELF JOIN + IS NULL)
W9	Wo customers jinhone 0 ya 1 order diya (HAVING)

-- ===== Part D: Week 2 mixed test =====
-- W1
SELECT CASE WHEN c.country = 'India' THEN 'Domestic' ELSE 'International' END AS customer_type,
       COUNT(*) AS order_count,
       SUM(o.amount) AS revenue
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY CASE WHEN c.country = 'India' THEN 'Domestic' ELSE 'International' END;

-- W2
SELECT c.country, COUNT(*) AS never_ordered
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
GROUP BY c.country;

-- W3
SELECT c.country,
       SUM(CASE WHEN o.amount >= 1000 THEN 1 ELSE 0 END) AS big_orders,
       SUM(CASE WHEN o.amount < 1000  THEN 1 ELSE 0 END) AS small_orders
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country;

-- W4
SELECT e.name
FROM employees e
LEFT JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE r.review_id IS NULL;

-- W5
SELECT m.name AS manager, ROUND(AVG(e.salary), 2) AS avg_reportee_salary
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
GROUP BY m.emp_id, m.name
ORDER BY avg_reportee_salary DESC;

-- W6
SELECT e.department, COUNT(DISTINCT e.emp_id) AS good_performers
FROM employees e
INNER JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE r.rating >= 4
GROUP BY e.department;

-- W7
SELECT DISTINCT e.name
FROM employees e
INNER JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE e.salary >= 75000 AND r.rating = 5;

-- W8
SELECT e.name
FROM employees e
LEFT JOIN employees r ON r.manager_id = e.emp_id
WHERE r.emp_id IS NULL;

-- W9
SELECT c.name, COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) <= 1;