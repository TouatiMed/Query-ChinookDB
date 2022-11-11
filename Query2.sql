/* Query 2: A query that calculates the average song length per genre for the top 5 genres that sold the most. */

WITH T2 AS
  (SELECT Genre
   FROM
     (SELECT SUM(il.Quantity) AS Sales,
             g.Name AS Genre
      FROM InvoiceLine il
      JOIN Track t ON t.TrackId=il.TrackId
      JOIN Genre g ON g.GenreId=t.GenreId
      JOIN Invoice i ON il.InvoiceId=i.InvoiceId
      GROUP BY g.Name
      ORDER BY 1 DESC
      LIMIT 5) T1)
SELECT g.Name AS Genre,
       ROUND(AVG(t.Milliseconds)/1000/60, 2) AS "Average Length(min)"
FROM Track t
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name IN T2
GROUP BY 1
ORDER BY 2 DESC;
