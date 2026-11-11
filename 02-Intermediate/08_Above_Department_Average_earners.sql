-- ====================================================
-- Exercise 08: Above Department Average Earners
-- Level: Intermediate
-- Description: Retrieve employees whose salary is greater 
--              than the average salary of their respective department using a temporary result set (CTE) and JOIN.
-- ====================================================

WITH department_avg_salary AS (
    SELECT 
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.salary,
    e.department_id
FROM employees e
INNER JOIN department_avg_salary d ON d.department_id = e.department_id
WHERE e.salary > d.average_salary
ORDER BY e.department_id ASC, e.salary DESC;

/* 
EXPECTED OUTPUT:
+-------------+-------------------+----------+---------------+
| employee_id | full_name         | salary   | department_id |
+-------------+-------------------+----------+---------------+
| 201         | Michael Hartstein | 13000.00 | 2             |
| 114         | Den Raphaely      | 11000.00 | 3             |
| 121         | Adam Fripp        | 8200.00  | 5             |
| 120         | Matthew Weiss     | 8000.00  | 5             |
| 122         | Payam Kaufling    | 7900.00  | 5             |
| 123         | Shanta Vollman    | 6500.00  | 5             |
| 103         | Alexander Hunold  | 9000.00  | 6             |
| 104         | Bruce Ernst       | 6000.00  | 6             |
| 145         | John Russell      | 14000.00 | 8             |
| 100         | Steven King       | 24000.00 | 9             |
| 108         | Nancy Greenberg   | 12000.00 | 10            |
| 109         | Daniel Faviet     | 9000.00  | 10            |
| 205         | Shelley Higgins   | 12000.00 | 11            |
+-------------+-------------------+----------+---------------+
*/
