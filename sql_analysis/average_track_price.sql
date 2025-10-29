-- * AVERAGE TRACK PRICE PER GENRE
-- By joining the invoice_line, track and genre tables we get the average price for each grouped genre and
-- with this query we learn that the Sci Fi & Fantasy has the highest average track price.

SELECT 
    g.name AS genre,
    CEIL(AVG(i.unit_price)) AS avg_track_price
FROM invoice_line AS i
JOIN track AS t
    ON i.track_id = t.track_id
JOIN genre AS g
    ON t.genre_id = g.genre_id
GROUP BY g.name
ORDER BY avg_track_price DESC;