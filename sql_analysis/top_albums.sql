-- * MOST SOLD ALBUMS
-- We begin by joining the invoice_line, track and album tables to get the total sum of the albums 
-- sold quantity and with this query we learn that the album Minha História was the highest sold album.

SELECT
    al.title,
    SUM(i.quantity) AS total_sold
FROM invoice_line AS i
JOIN track AS t
    ON i.track_id = t.track_id
JOIN album AS al
    ON t.album_id = al.album_id
GROUP BY al.title
ORDER BY total_sold DESC;