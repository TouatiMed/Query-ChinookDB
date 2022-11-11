/* Query 4: A query that shows a list of the European cities with the most Alternative & Punk fans. */

SELECT i.BillingCity || " " || "(" || i.BillingCountry|| ")" AS City,
       COUNT(DISTINCT i.CustomerId) "Fans Count"
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
WHERE g.name = "Alternative & Punk"
  AND i.BillingCountry IN ("Germany",
                           "Norway",
                           "Czech Republic",
                           "Austria",
                           "Belgium",
                           "Denmark",
                           "Portugal",
                           "France",
                           "Finland",
                           "Hungary",
                           "Ireland",
                           "Italy",
                           "Netherlands",
                           "Poland",
                           "Spain",
                           "Sweden",
                           "United Kingdom")
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
LIMIT 10;
