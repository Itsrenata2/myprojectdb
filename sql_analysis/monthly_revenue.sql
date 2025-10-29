-- * AVERAGE MONTHLY REVENUE
-- By selecting and grouping the months we get the average
-- revenue by month. We learn that the average for each month
-- is even, not changing 

SELECT 
    EXTRACT(MONTH FROM invoice_date) AS month,
    ROUND(AVG(total)) AS avg_monthly_revenue
FROM invoice
GROUP BY 
    EXTRACT(MONTH FROM invoice_date)
ORDER BY month ASC