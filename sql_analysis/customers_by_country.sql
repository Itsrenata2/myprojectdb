-- * CUSTOMERS PER COUNTRY AND CITY
-- Selecting the total count and the countries and grouping by the country, 
-- we get the total count of customers per country. Which is USA, where the most
-- customers are located.

SELECT
    COUNT(*) AS customers_per_country,
    country
FROM customer AS c
GROUP BY country
ORDER BY customers_per_country DESC;

-- alternative: by cities
SELECT
    COUNT(*) AS customers_per_city,
    city
FROM customer AS c
GROUP BY city
ORDER BY customers_per_country DESC;