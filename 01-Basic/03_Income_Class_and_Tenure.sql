-- ====================================================
-- Exercise 03: Income Class & Tenure Analysis
-- Level: Basic
-- Description: Classify employee income level based on salary 
--              and calculate tenure years from hire date to current date.
-- ====================================================

SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    YEAR(CURRENT_DATE) - YEAR(hire_date) AS tenure_year,
    CASE 
        WHEN salary >= 10000 THEN 'High'
        WHEN salary >= 5000 THEN 'Medium'
        ELSE 'Low'
    END AS income_level
FROM employees
ORDER BY tenure_year DESC;

/* 
EXPECTED OUTPUT:
+-------------+-----------------+----------+-------------+--------------+
| employee_id | full_name       | salary   | tenure_year | income_level |
+-------------+-----------------+----------+-------------+--------------+
| 200         | Jennifer Whalen | 4400.00  | 39          | Low          |
| 100         | Steven King     | 24000.00 | 39          | High         |
| 101         | Neena Kochhar   | 17000.00 | 37          | High         |
| 103         | Alexander Hunold| 9000.00  | 36          | Medium       |
| 104         | Bruce Ernst     | 6000.00  | 35          | Medium       |
+-------------+-----------------+----------+-------------+--------------+
*/
