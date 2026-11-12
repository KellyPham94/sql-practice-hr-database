-- ====================================================
-- Exercise 09: Internal Department Salary Ranking
-- Level: Advanced
-- Description: Rank employee salaries within each department 
--              using the DENSE_RANK() window function.
-- ====================================================

SELECT 
    department_id,
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees
ORDER BY department_id ASC, salary_rank ASC, salary DESC;

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
| 3             | 117         | Sigal Tobias      | 2800.00  | 4           |
| 3             | 118         | Guy Himuro        | 2600.00  | 5           |
| 3             | 119         | Karen Colmenares  | 2500.00  | 6           |
+---------------+-------------+-------------------+----------+-------------+
*/
