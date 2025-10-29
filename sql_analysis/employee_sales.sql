-- * REVENUE PER EMPLOYEE
-- Selecting the first and last name of the employees for unique identification
-- and then the total sum for the revenue. By grouping the names, we learn that Jane
-- Peacock is the employee with most sells.

SELECT 
    e.first_name,
    e.last_name,
    ROUND(SUM(i.total), 2) AS total_revenue
FROM employee AS e
JOIN customer AS c
    ON c.support_rep_id = e.employee_id
JOIN invoice AS i
    ON i.customer_id = c.customer_id
GROUP BY e.first_name, e.last_name
ORDER BY total_revenue DESC;