-- 1
SELECT COUNT(*) FROM performance_reviews;                -- 16

-- 2
SELECT e.name, r.rating, r.review_year
FROM employees e
INNER JOIN performance_reviews r ON e.emp_id = r.emp_id
ORDER BY e.emp_id, r.review_year;

-- 3
SELECT e.name, r.rating
FROM employees e
LEFT JOIN performance_reviews r ON e.emp_id = r.emp_id;   -- 21 rows

SELECT e.name
FROM employees e
LEFT JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE r.review_id IS NULL;                                -- 7 rows

-- 4
SELECT e.name, r.review_id, r.emp_id, r.rating
FROM employees e
RIGHT JOIN performance_reviews r ON e.emp_id = r.emp_id;  -- 16 rows

SELECT r.review_id, r.emp_id, r.rating
FROM employees e
RIGHT JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE e.emp_id IS NULL;                                   -- 2 rows

-- 5
SELECT e.emp_id, e.name, r.review_id, r.emp_id AS review_emp_id, r.rating
FROM employees e
FULL JOIN performance_reviews r ON e.emp_id = r.emp_id;   -- 23 rows

-- 6
SELECT CASE
           WHEN e.emp_id IS NULL THEN 'Orphan review'
           WHEN r.review_id IS NULL THEN 'No review'
       END AS issue,
       COUNT(*) AS row_count
FROM employees e
FULL JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE e.emp_id IS NULL OR r.review_id IS NULL
GROUP BY CASE
             WHEN e.emp_id IS NULL THEN 'Orphan review'
             WHEN r.review_id IS NULL THEN 'No review'
         END;

-- 7
SELECT COALESCE(e.name, 'UNKNOWN') AS employee, r.rating
FROM employees e
FULL JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE e.emp_id IS NULL;

-- 8
SELECT e.name, COUNT(r.review_id) AS review_count
FROM employees e
LEFT JOIN performance_reviews r ON e.emp_id = r.emp_id
GROUP BY e.emp_id, e.name
ORDER BY e.emp_id;

-- 9
SELECT e.department, ROUND(AVG(r.rating), 2) AS avg_rating
FROM employees e
LEFT JOIN performance_reviews r ON e.emp_id = r.emp_id
GROUP BY e.department;

-- 10
SELECT e.department,
       COUNT(DISTINCT e.emp_id) AS total_employees,
       COUNT(DISTINCT r.emp_id) AS reviewed_employees
FROM employees e
LEFT JOIN performance_reviews r ON e.emp_id = r.emp_id
GROUP BY e.department;

-- 11
SELECT e.name AS employee, m.name AS manager
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id;        -- 15 rows

SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;         -- 20 rows

-- 12
SELECT e.name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id
WHERE m.emp_id IS NULL;

-- 13
SELECT m.name AS manager, COUNT(*) AS reportees
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
GROUP BY m.emp_id, m.name
ORDER BY reportees DESC;

-- 14
SELECT m.name AS manager, COUNT(*) AS reportees
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
GROUP BY m.emp_id, m.name
HAVING COUNT(*) > 2;

-- 15
SELECT e.name, e.salary, m.name AS manager, m.salary AS manager_salary
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;                                -- 0 rows

SELECT e.name, e.salary, m.name AS manager, m.salary AS manager_salary
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
WHERE e.salary > m.salary * 0.85;                         -- 2 rows

-- 16
SELECT e1.name AS emp1, e2.name AS emp2, e1.city
FROM employees e1
INNER JOIN employees e2
    ON e1.city = e2.city AND e1.emp_id < e2.emp_id
ORDER BY e1.city, e1.name;                                -- 11 rows

-- 17
SELECT d.dept_name, q.quarter
FROM departments d
CROSS JOIN (VALUES ('Q1'), ('Q2'), ('Q3'), ('Q4')) AS q(quarter)
ORDER BY d.dept_name, q.quarter;                          -- 24 rows

-- 18
SELECT COUNT(*) FROM employees e CROSS JOIN departments d;                              -- 120
SELECT COUNT(*) FROM employees e CROSS JOIN departments d WHERE e.department = d.dept_name;   -- 20


Mini quiz
FULL JOIN kya deta hai? Result mein kaun si teen tarah ki rows hoti hain?
Source aur target table ka mismatch FULL JOIN se kaise dhundhoge?
SELF JOIN kab use karte hain? Aliases kyun zaroori hain?
Pairs nikalte waqt e1.emp_id < e2.emp_id kyun lagate hain?
CROSS JOIN kab kaam aata hai aur kya khatra hai?
Join ki key NULL ho to us row ka kya hota hai?

Dono tables ki saari rows. Teen tarah ki rows: mel wali, sirf left wali (right ke columns NULL), sirf right wali (left ke columns NULL)
FULL JOIN karo aur WHERE a.id IS NULL OR b.id IS NULL lagao. Jo rows aayengi wahi mismatch hain (jaise Q6)
Jab ek hi table ki rows ka aapas mein rishta ho (employee aur manager) ya ek hi table ke andar pairs chahiye ho. Aliases isliye zaroori hain ki database ko pata chale ki kaun si "copy" ka kaun sa column hai
Taaki ek row khud se mel na khaye (A, A) aur ek hi jodi do baar na aaye (A, B aur B, A)
Har row × har row ke combinations chahiye hon (jaise report ka dhancha). Khatra: rows ka dher lag jata hai (m × n), bade tables pe system atak sakta hai
NULL = NULL true nahi hota, isliye us row ka koi mel nahi hota (INNER JOIN mein wo gayab ho jati hai)

SELF JOIN ka classic sawaal "employees who earn more than their managers" (Q15) lagbhag har SQL interview mein aata hai.