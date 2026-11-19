-- ====================================================
-- Exercise 11: Cumulative Salary (Running Total)
-- Level: Advanced
-- Description: Calculate cumulative salary within each department 
--              using SUM() OVER (PARTITION BY department_id ORDER BY salary ASC).
-- ====================================================

SELECT 
    department_id,
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    SUM(salary) OVER (
        PARTITION BY department_id 
        ORDER BY salary ASC
    ) AS running_total_salary
FROM employees
ORDER BY department_id ASC, salary ASC, employee_id ASC;

/* 
EXPECTED OUTPUT:
+---------------+-------------+--------------------+----------+----------------------+
| department_id | employee_id | full_name          | salary   | running_total_salary |
+---------------+-------------+--------------------+----------+----------------------+
| 1             | 200         | Jennifer Whalen    | 4400.00  | 4400.00              |
| 2             | 202         | Pat Fay            | 6000.00  | 6000.00              |
| 2             | 201         | Michael Hartstein  | 13000.00 | 19000.00             |
| 3             | 119         | Karen Colmenares   | 2500.00  | 2500.00              |
| 3             | 118         | Guy Himuro         | 2600.00  | 5100.00              |
| 3             | 117         | Sigal Tobias       | 2800.00  | 7900.00              |
| 3             | 116         | Shelli Baida       | 2900.00  | 10800.00             |
| 3             | 115         | Alexander Khoo     | 3100.00  | 13900.00             |
| 3             | 114         | Den Raphaely       | 11000.00 | 24900.00             |
+---------------+-------------+--------------------+----------+----------------------+
*/

