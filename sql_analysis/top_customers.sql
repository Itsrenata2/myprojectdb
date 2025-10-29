-- * TOP CUSTOMER BY TOTAL PURCHASES
-- By joining the customer and invoices tables we get group the costumers by their 
-- first and last names for uniqueness and then get the total spent on the store by each customer.
-- Then, we learn that Helena Holú is the store's top customer.

SELECT 
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customer AS c
JOIN invoice AS i
    ON i.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;