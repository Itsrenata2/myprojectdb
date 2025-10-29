-- * MOST SOLD ARTISTS
-- By joining the invoice_line, track, album, artist tables, we get the total sum of the artist
-- grouped by name and with this query we learn that the most sold tracks are from the artist Iron Maiden,
-- with 140 tracks sold, followed by U2, Metallica and Led Zepellin.

SELECT 
    ar.name,
    SUM(i.quantity) AS total_sold
FROM invoice_line AS i
JOIN track AS t
    ON i.track_id = t.track_id
JOIN album AS al
    ON t.album_id = al.album_id
JOIN artist AS ar
    ON al.artist_id = ar.artist_id
GROUP BY ar.name
ORDER BY total_sold DESC;