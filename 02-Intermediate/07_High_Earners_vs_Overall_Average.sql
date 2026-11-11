-- ====================================================
-- Exercise 07: High Earners vs Overall Average
-- Level: Intermediate
-- Description: Retrieve employees whose salary is greater 
--              than the company's overall average salary using a Subquery.
-- ====================================================

SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    department_id
FROM employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees
)
ORDER BY salary DESC;

/* 
EXPECTED OUTPUT:
+-------------+---------------+----------+---------------+
| employee_id | full_name     | salary   | department_id |
+-------------+---------------+----------+---------------+
| 100         | Steven King   | 24000.00 | 9             |
| 102         | Lex De Haan   | 17000.00 | 9             |
| 101         | Neena Kochhar | 17000.00 | 9             |
| 145         | John Russell  | 14000.00 | 8             |
| 146         | Karen Partners| 13500.00 | 8             |
| 201         | Michael Hartstein | 13000.00 | 2             |
| 108         | Nancy Greenberg | 12000.00 | 10            |
| 205         | Shelley Higgins | 12000.00 | 11            |
| 114         | Den Raphaely  | 11000.00 | 3             |
+-------------+---------------+----------+---------------+
*/
