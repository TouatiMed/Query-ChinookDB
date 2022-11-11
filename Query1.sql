/* Query 1: A query that shows the Top 5 artists that sold the most tracks in the Americas in the Metal genre and their earning amount. */

WITH T1 AS
  (SELECT ar.Name AS Artists,
          il.UnitPrice * il.Quantity AS total
   FROM Artist ar
   JOIN Album a ON ar.ArtistId = a.ArtistId
   JOIN Track t ON a.AlbumId = t.AlbumId
   JOIN InvoiceLine il ON t.TrackId = il.TrackId
   JOIN Genre g ON g.GenreId = T.GenreId
   JOIN Invoice i ON il.InvoiceId = i.InvoiceId
   WHERE g.name = "Metal"
     AND i.BillingCountry IN ("USA",
                              "Brazil",
                              "Canada",
                              "Argentina",
                              "Chile"))
SELECT T1.Artists,
       SUM(T1.total) AS "Earning Amount"
FROM T1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
