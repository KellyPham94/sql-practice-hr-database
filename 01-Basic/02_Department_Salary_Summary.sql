-- ====================================================
-- Exercise 02: Department Salary Summary
-- Level: Basic
-- Description: Aggregate salary statistics (total employees, max, min, and avg salary)
--              for departments with 2 or more employees, ordered by average salary descending.
-- ====================================================

SELECT 
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    MAX(e.salary) AS max_salary,
    MIN(e.salary) AS min_salary,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) >= 2
ORDER BY avg_salary DESC;

/* 
EXPECTED OUTPUT:
+-----------------+-----------------+------------+------------+------------+
| department_name | total_employees | max_salary | min_salary | avg_salary |
+-----------------+-----------------+------------+------------+------------+
| Executive       | 3               | 24000.00   | 17000.00   | 19333.33   |
| Accounting      | 2               | 12000.00   | 8300.00    | 10150.00   |
| Sales           | 6               | 14000.00   | 6200.00    | 9616.67    |
| Marketing       | 2               | 13000.00   | 6000.00    | 9500.00    |
| Finance         | 6               | 12000.00   | 6900.00    | 8600.00    |
| Shipping        | 7               | 8200.00    | 2700.00    | 5885.71    |
| IT              | 5               | 9000.00    | 4200.00    | 5760.00    |
| Purchasing      | 6               | 11000.00   | 2500.00    | 4150.00    |
+-----------------+-----------------+------------+------------+------------+
*/
