-- ====================================================
-- Exercise 01: US Employees Location Report
-- Level: Basic
-- Description: Retrieve all employees working in the United States ('US')
--              along with their department names and cities.
-- ====================================================

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name,
    l.city,
    l.country_id
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id
INNER JOIN locations l ON l.location_id = d.location_id
WHERE l.country_id = 'US'
ORDER BY e.employee_id;

/* 
EXPECTED OUTPUT:
+-------------+------------+-----------+--------+-----------------+----------+------------+
| employee_id | first_name | last_name | salary | department_name | city     | country_id |
+-------------+------------+-----------+--------+-----------------+----------+------------+
| 100         | Steven     | King      | 24000  | Executive       | Seattle  | US         |
| 101         | Neena      | Kochhar   | 17000  | Executive       | Seattle  | US         |
| 102         | Lex        | De Haan   | 17000  | Executive       | Seattle  | US         |
+-------------+------------+-----------+--------+-----------------+----------+------------+
*/

