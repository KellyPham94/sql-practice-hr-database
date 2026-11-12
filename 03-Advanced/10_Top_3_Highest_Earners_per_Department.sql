-- ====================================================
-- Exercise 10: Top 3 Highest Earners per Department
-- Level: Advanced
-- Description: Retrieve the top 3 highest-paid employees in each department 
--              using a temporary result set with DENSE_RANK() window function and INNER JOIN.
-- ====================================================

WITH ranks AS (
    SELECT 
        employee_id,
        DENSE_RANK() OVER (
            PARTITION BY department_id 
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT 
    e.department_id,
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.salary,
    r.salary_rank
FROM employees e
INNER JOIN ranks r ON r.employee_id = e.employee_id
WHERE r.salary_rank <= 3
ORDER BY e.department_id ASC, r.salary_rank ASC;

/* 
EXACT OUTPUT:
+---------------+-------------+-------------------+----------+-------------+
| department_id | employee_id | full_name         | salary   | salary_rank |
+---------------+-------------+-------------------+----------+-------------+
| 1             | 200         | Jennifer Whalen   | 4400.00  | 1           |
| 2             | 201         | Michael Hartstein | 13000.00 | 1           |
| 2             | 202         | Pat Fay           | 6000.00  | 2           |
| 3             | 114         | Den Raphaely      | 11000.00 | 1           |
| 3             | 115         | Alexander Khoo    | 3100.00  | 2           |
| 3             | 116         | Shelli Baida      | 2900.00  | 3           |
| 4             | 203         | Susan Mavris      | 6500.00  | 1           |
| 5             | 121         | Adam Fripp        | 8200.00  | 1           |
| 5             | 120         | Matthew Weiss     | 8000.00  | 2           |
| 5             | 122         | Payam Kaufling    | 7900.00  | 3           |
| 6             | 103         | Alexander Hunold  | 9000.00  | 1           |
| 6             | 104         | Bruce Ernst       | 6000.00  | 2           |
| 6             | 106         | Valli Pataballa   | 4800.00  | 3           |
| 6             | 105         | David Austin      | 4800.00  | 3           |
+---------------+-------------+-------------------+----------+-------------+
*/
