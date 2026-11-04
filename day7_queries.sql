-- 1
SELECT 100 + NULL;                         -- NULL
SELECT NULL = NULL;                        -- NULL
SELECT NULL IS NULL;                       -- true
SELECT COALESCE(NULL, NULL, 'x');          -- x
SELECT 10 / 0;                             -- ERROR: division by zero
SELECT 10 / NULLIF(0, 0);                  -- NULL

-- 2
SELECT name, COALESCE(city, 'Unknown') AS city FROM employees;

-- 3
SELECT name || ' - ' || COALESCE(city, 'Unknown') AS name_city FROM employees;

-- 4
SELECT COUNT(*) - COUNT(city) AS null_cities FROM employees;

-- 5
SELECT name, COALESCE(manager_id, 0) AS manager_id FROM employees;
SELECT COUNT(*) FROM employees WHERE COALESCE(manager_id, 0) = 0;   -- 5

-- 6
SELECT ROUND(AVG(manager_id), 2) AS avg_ignoring_null,
       ROUND(AVG(COALESCE(manager_id, 0)), 2) AS avg_null_as_zero
FROM employees;                            -- 6.60 aur 4.95

-- 7
SELECT name, salary,
       CASE
           WHEN salary >= 75000 THEN 'High'
           WHEN salary >= 55000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_band
FROM employees;

-- 8
SELECT CASE
           WHEN salary >= 75000 THEN 'High'
           WHEN salary >= 55000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_band,
       COUNT(*) AS emp_count
FROM employees
GROUP BY CASE
           WHEN salary >= 75000 THEN 'High'
           WHEN salary >= 55000 THEN 'Medium'
           ELSE 'Low'
         END;

-- 9
SELECT CASE
           WHEN salary >= 75000 THEN 'High'
           WHEN salary >= 55000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_band,
       SUM(salary) AS total_salary
FROM employees
GROUP BY CASE
           WHEN salary >= 75000 THEN 'High'
           WHEN salary >= 55000 THEN 'Medium'
           ELSE 'Low'
         END;

-- 10
SELECT CASE
           WHEN hire_date < '2021-01-01' THEN 'Veteran'
           WHEN hire_date < '2023-01-01' THEN 'Mid'
           ELSE 'New'
       END AS tenure,
       COUNT(*) AS emp_count
FROM employees
GROUP BY CASE
           WHEN hire_date < '2021-01-01' THEN 'Veteran'
           WHEN hire_date < '2023-01-01' THEN 'Mid'
           ELSE 'New'
         END;

-- 11
SELECT CASE WHEN manager_id IS NULL THEN 'Top' ELSE 'Team' END AS level_type,
       COUNT(*) AS emp_count
FROM employees
GROUP BY CASE WHEN manager_id IS NULL THEN 'Top' ELSE 'Team' END;

-- 12
SELECT name, department, salary,
       salary * CASE WHEN department = 'Sales' THEN 1.10 ELSE 1.05 END AS new_salary
FROM employees;

SELECT SUM(salary * CASE WHEN department = 'Sales' THEN 1.10 ELSE 1.05 END) AS total_new_salary
FROM employees;                            -- 1313850

-- 13
SELECT name, department
FROM employees
ORDER BY CASE department
             WHEN 'Engineering' THEN 1
             WHEN 'Sales' THEN 2
             ELSE 3
         END,
         name;

-- 14
SELECT SUM(CASE WHEN department = 'Sales' THEN 1 ELSE 0 END)       AS sales_cnt,
       SUM(CASE WHEN department = 'Engineering' THEN 1 ELSE 0 END) AS eng_cnt,
       SUM(CASE WHEN department = 'HR' THEN 1 ELSE 0 END)          AS hr_cnt
FROM employees;

-- 15
SELECT SUM(CASE WHEN salary >= 75000 THEN 1 ELSE 0 END)                    AS high_cnt,
       SUM(CASE WHEN salary >= 55000 AND salary < 75000 THEN 1 ELSE 0 END) AS medium_cnt,
       SUM(CASE WHEN salary < 55000 THEN 1 ELSE 0 END)                     AS low_cnt
FROM employees;                            -- 4, 9, 7

-- 16
SELECT department,
       SUM(CASE WHEN salary >= 75000 THEN 1 ELSE 0 END) AS high_paid
FROM employees
GROUP BY department;

-- 17
SELECT department,
       SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS missing_city
FROM employees
GROUP BY department;

-- 18
SELECT CASE WHEN country = 'India' THEN 'Domestic' ELSE 'International' END AS customer_type,
       COUNT(*) AS customer_count
FROM customers
GROUP BY CASE WHEN country = 'India' THEN 'Domestic' ELSE 'International' END;

-- 19
SELECT CASE
           WHEN amount >= 2000 THEN 'Large'
           WHEN amount >= 1000 THEN 'Medium'
           ELSE 'Small'
       END AS order_size,
       COUNT(*) AS order_count
FROM orders
GROUP BY CASE
           WHEN amount >= 2000 THEN 'Large'
           WHEN amount >= 1000 THEN 'Medium'
           ELSE 'Small'
         END;

-- 20
SELECT CASE
           WHEN amount >= 2000 THEN 'Large'
           WHEN amount >= 1000 THEN 'Medium'
           ELSE 'Small'
       END AS order_size,
       COUNT(*) AS order_count,
       SUM(amount) AS revenue
FROM orders
GROUP BY CASE
           WHEN amount >= 2000 THEN 'Large'
           WHEN amount >= 1000 THEN 'Medium'
           ELSE 'Small'
         END;

-- 21
SELECT CASE
           WHEN EXTRACT(MONTH FROM order_date) <= 3 THEN 'Q1'
           WHEN EXTRACT(MONTH FROM order_date) <= 6 THEN 'Q2'
           WHEN EXTRACT(MONTH FROM order_date) <= 9 THEN 'Q3'
           ELSE 'Q4'
       END AS quarter,
       COUNT(*) AS order_count,
       SUM(amount) AS revenue
FROM orders
GROUP BY CASE
           WHEN EXTRACT(MONTH FROM order_date) <= 3 THEN 'Q1'
           WHEN EXTRACT(MONTH FROM order_date) <= 6 THEN 'Q2'
           WHEN EXTRACT(MONTH FROM order_date) <= 9 THEN 'Q3'
           ELSE 'Q4'
         END
ORDER BY quarter;

-- 22
SELECT SUM(CASE WHEN amount >= 1000 THEN 1 ELSE 0 END) AS big_orders,
       SUM(CASE WHEN amount < 1000 THEN 1 ELSE 0 END)  AS small_orders
FROM orders;                               -- 10, 15

-- 23
SELECT name, salary,
       CASE WHEN salary > 60000 THEN 'Y' ELSE 'N' END AS above_60k
FROM employees;

SELECT CASE WHEN salary > 60000 THEN 'Y' ELSE 'N' END AS above_60k,
       COUNT(*) AS emp_count
FROM employees
GROUP BY CASE WHEN salary > 60000 THEN 'Y' ELSE 'N' END;   -- Y 9, N 11