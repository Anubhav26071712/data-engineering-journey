-- ===== Part 1 =====
-- 1
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    course     VARCHAR(30),
    fees       INT,
    join_date  DATE
);
SELECT * FROM students;                       -- 0 rows

-- 2
INSERT INTO students (student_id, name, course, fees, join_date)
VALUES (1, 'Aman Gupta', 'SQL', 12000, '2026-10-01');

-- 3
INSERT INTO students (student_id, name, course, fees, join_date) VALUES
(2, 'Bhavna Rao',  'Python',  15000, '2026-10-03'),
(3, 'Chirag Jain', 'SQL',     12000, '2026-10-05'),
(4, 'Deepa Nair',  'PySpark', 20000, '2026-10-07'),
(5, 'Esha Verma',  'Python',  15000, '2026-10-10'),
(6, 'Farhan Khan', 'SQL',     12000, '2026-10-12'),
(7, 'Gita Menon',  'PySpark', 20000, '2026-10-15'),
(8, 'Harsh Vyas',  'Azure',   25000, '2026-10-18');

-- 4
SELECT COUNT(*) AS total_students, SUM(fees) AS total_fees FROM students;   -- 8, 131000

-- 5 (ERROR: duplicate key value violates unique constraint)
INSERT INTO students (student_id, name, course, fees, join_date)
VALUES (1, 'Zara Ali', 'SQL', 12000, '2026-10-20');

-- 6 (ERROR: null value in column "name" violates not-null constraint)
INSERT INTO students (student_id, name) VALUES (10, NULL);

-- 7
INSERT INTO students (student_id, name) VALUES (9, 'Ishita Das');

-- 8
ALTER TABLE students ADD COLUMN city VARCHAR(30);
ALTER TABLE students ADD COLUMN status VARCHAR(10) DEFAULT 'active';
SELECT COUNT(*) FROM students WHERE status = 'active';    -- 9

-- ===== Part 2 =====
-- 9
SELECT * FROM students WHERE course = 'SQL';              -- pehle dekho: 3 rows
UPDATE students SET fees = 14000 WHERE course = 'SQL';

-- 10
UPDATE students SET fees = fees * 1.10 WHERE course = 'PySpark';

-- 11
UPDATE students SET city = 'Pune'  WHERE student_id IN (2, 5);
UPDATE students SET city = 'Delhi' WHERE student_id IN (1, 3, 6);

-- 12
UPDATE students
SET course = 'Azure', fees = 25000, join_date = '2026-10-20'
WHERE student_id = 9;

SELECT SUM(fees) FROM students;                           -- 166000

-- 13
CREATE TABLE students_copy AS SELECT * FROM students;
UPDATE students_copy SET fees = 0;                        -- 9 rows, bina WHERE ke
SELECT SUM(fees) FROM students_copy;                      -- 0

-- 14
UPDATE students SET city = 'Unknown' WHERE city IS NULL;  -- 4 rows

-- ===== Part 3 =====
-- 15
SELECT * FROM students WHERE student_id = 9;
DELETE FROM students WHERE student_id = 9;                -- ab 8 rows

-- 16
DELETE FROM students WHERE course = 'Python';             -- 2 rows, ab 6

-- 17
DELETE FROM students WHERE fees < 15000;                  -- 3 rows, ab 3
SELECT SUM(fees) FROM students;                           -- 69000

-- 18
DELETE FROM students_copy;                                -- 9 rows
SELECT COUNT(*) FROM students_copy;                       -- 0

-- 19
INSERT INTO students_copy SELECT * FROM students;         -- 3 rows
TRUNCATE TABLE students_copy;                             -- 0 rows, table bachi
DROP TABLE students_copy;                                 -- table hi gayi
SELECT * FROM students_copy;                              -- ERROR: relation does not exist

-- ===== Part 4: Week 1 test =====
-- W1
SELECT name, department, salary FROM employees
WHERE salary BETWEEN 50000 AND 70000
ORDER BY salary DESC;

-- W2
SELECT * FROM employees
WHERE department = 'Sales'
ORDER BY salary DESC
LIMIT 3;

-- W3
SELECT * FROM employees WHERE name LIKE 'S%';

-- W4
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- W5
SELECT city, COUNT(*) AS emp_count
FROM employees
WHERE city IS NOT NULL
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY emp_count DESC;

-- W6
SELECT COUNT(*) FROM employees
WHERE department <> 'Engineering' AND salary > 60000;

-- W7
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
HAVING COUNT(*) >= 3
ORDER BY customer_count DESC;

-- W8
SELECT customer_id, SUM(amount) AS total
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 2000
ORDER BY total DESC;

-- W9
SELECT COUNT(*) AS order_count, SUM(amount) AS total
FROM orders
WHERE order_date BETWEEN '2026-07-01' AND '2026-09-30';

-- W10
SELECT DISTINCT amount FROM orders ORDER BY amount DESC LIMIT 1 OFFSET 1;   -- 2600

-- W11
SELECT COUNT(DISTINCT customer_id) FROM orders WHERE amount > 1000;

-- W12
SELECT department, COUNT(*) AS joiners
FROM employees
WHERE hire_date >= '2022-01-01'
GROUP BY department
HAVING COUNT(*) >= 2;

-- W13
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
ORDER BY max_salary DESC;

-- W14
SELECT * FROM employees WHERE city IS NULL OR salary < 45000;