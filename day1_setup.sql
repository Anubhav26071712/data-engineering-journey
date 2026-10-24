-- ============================================================
-- Data Engineering Journey | Day 1 | Practice database setup
-- Database: de_practice   (PostgreSQL)
-- Isko DBeaver mein poora select karke "Execute Script" (Alt+X) se chalao.
-- Dobara chalane se pehle ka data hat jayega (DROP TABLE), koi dikkat nahi.
-- ============================================================

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

-- ------------------------------------------------------------
-- 1) employees  (20 rows)
-- manager_id = us employee ka manager (SELF JOIN practice ke liye, Week 2)
-- 2 employees ki city NULL hai (NULL handling practice ke liye, Week 2)
-- ------------------------------------------------------------
CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    name        VARCHAR(50),
    department  VARCHAR(30),
    salary      INT,
    city        VARCHAR(30),
    hire_date   DATE,
    manager_id  INT
);

INSERT INTO employees (emp_id, name, department, salary, city, hire_date, manager_id) VALUES
(1,  'Rahul Sharma',   'Engineering', 95000, 'Bengaluru', '2020-03-15', NULL),
(2,  'Priya Singh',    'Engineering', 82000, 'Pune',      '2021-06-01', 1),
(3,  'Amit Verma',     'Engineering', 60000, 'Delhi',     '2022-01-10', 1),
(4,  'Neha Gupta',     'Engineering', 55000, 'Hyderabad', '2023-04-20', 2),
(5,  'Karan Mehta',    'Sales',       70000, 'Mumbai',    '2019-11-05', NULL),
(6,  'Anjali Rao',     'Sales',       52000, 'Delhi',     '2022-08-17', 5),
(7,  'Vikram Joshi',   'Sales',       48000, 'Pune',      '2023-02-01', 5),
(8,  'Sneha Iyer',     'Sales',       65000, 'Chennai',   '2021-09-12', 5),
(9,  'Rohit Kumar',    'HR',          58000, 'Delhi',     '2020-07-23', NULL),
(10, 'Pooja Nair',     'HR',          45000, 'Kochi',     '2023-05-30', 9),
(11, 'Manish Tiwari',  'HR',          42000, 'Lucknow',   '2024-01-15', 9),
(12, 'Divya Reddy',    'Finance',     88000, 'Hyderabad', '2018-12-03', NULL),
(13, 'Suresh Patil',   'Finance',     62000, 'Pune',      '2021-03-29', 12),
(14, 'Kavita Das',     'Finance',     57000, 'Kolkata',   '2022-10-11', 12),
(15, 'Arjun Malhotra', 'Marketing',   72000, 'Mumbai',    '2020-02-14', NULL),
(16, 'Isha Kapoor',    'Marketing',   51000, 'Delhi',     '2023-07-07', 15),
(17, 'Nikhil Bansal',  'Marketing',   47000, 'Jaipur',    '2024-03-18', 15),
(18, 'Tanvi Shah',     'Engineering', 78000, 'Ahmedabad', '2021-11-22', 1),
(19, 'Deepak Yadav',   'Sales',       44000, NULL,        '2024-06-10', 5),
(20, 'Meera Pillai',   'Engineering', 67000, NULL,        '2022-05-05', 2);

-- ------------------------------------------------------------
-- 2) customers  (15 rows)
-- customer_id 14 aur 15 ne koi order nahi diya (LEFT JOIN practice ke liye)
-- ------------------------------------------------------------
CREATE TABLE customers (
    customer_id  INT PRIMARY KEY,
    name         VARCHAR(50),
    country      VARCHAR(30)
);

INSERT INTO customers (customer_id, name, country) VALUES
(1,  'Aarav Kapoor',   'India'),
(2,  'Emily Clark',    'USA'),
(3,  'Rohan Das',      'India'),
(4,  'Sophie Martin',  'UK'),
(5,  'Lukas Weber',    'Germany'),
(6,  'Olivia Brown',   'USA'),
(7,  'Sanjay Gupta',   'India'),
(8,  'Liam Wilson',    'Canada'),
(9,  'Meena Iyer',     'India'),
(10, 'James Taylor',   'UK'),
(11, 'Hannah Schmidt', 'Germany'),
(12, 'Noah Johnson',   'USA'),
(13, 'Zoya Khan',      'India'),
(14, 'Ethan Lee',      'Canada'),
(15, 'Ananya Roy',     'India');

-- ------------------------------------------------------------
-- 3) orders  (25 rows)
-- ------------------------------------------------------------
CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    amount       INT,
    order_date   DATE
);

INSERT INTO orders (order_id, customer_id, amount, order_date) VALUES
(1,  1,  1200, '2026-01-05'),
(2,  2,   850, '2026-01-12'),
(3,  3,   430, '2026-01-20'),
(4,  1,  2200, '2026-02-03'),
(5,  4,   300, '2026-02-14'),
(6,  5,  1500, '2026-02-20'),
(7,  2,   990, '2026-03-02'),
(8,  6,   640, '2026-03-11'),
(9,  7,  2750, '2026-03-18'),
(10, 1,   310, '2026-04-01'),
(11, 8,   520, '2026-04-09'),
(12, 3,   780, '2026-04-22'),
(13, 9,  1100, '2026-05-06'),
(14, 10,  460, '2026-05-15'),
(15, 1,  1800, '2026-05-27'),
(16, 11,  950, '2026-06-04'),
(17, 2,  1250, '2026-06-19'),
(18, 12,  370, '2026-07-02'),
(19, 4,  2100, '2026-07-14'),
(20, 5,   680, '2026-07-29'),
(21, 13,  540, '2026-08-08'),
(22, 6,  1320, '2026-08-21'),
(23, 7,   410, '2026-09-03'),
(24, 9,  2600, '2026-09-16'),
(25, 3,   890, '2026-09-30');

-- ------------------------------------------------------------
-- Check: ye 3 queries ye numbers dikhani chahiye -> 20, 15, 25
-- ------------------------------------------------------------
SELECT 'employees' AS table_name, COUNT(*) AS total_rows FROM employees
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders;
