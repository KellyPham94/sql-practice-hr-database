-- ====================================================
-- Exercise 05: Department Employee Count & Payroll
-- Level: Intermediate
-- Description: Calculate total employees and total payroll per department,
--              filtering departments with a total payroll greater than 20,000.
-- ====================================================

SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    SUM(e.salary) AS total_payroll
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 20000
ORDER BY total_payroll DESC;

/* 
EXPECTED OUTPUT:
+-----------------+----------------+---------------+
| department_name | employee_count | total_payroll |
+-----------------+----------------+---------------+
| Executive       | 3              | 58000.00      |
| Sales           | 6              | 57700.00      |
| Finance         | 6              | 51600.00      |
| Shipping        | 7              | 41200.00      |
| IT              | 5              | 28800.00      |
| Purchasing      | 6              | 24900.00      |
| Accounting      | 2              | 20300.00      |
+-----------------+----------------+---------------+
*/
