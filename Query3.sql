/* Query 3: A query that shows a list of the top 10 customers with the most purchases in 2013, who are located in the Americas region. */

WITH T1 AS
  (SELECT c.FirstName || " " || c.LastName || " " || "(" || c.Country || ")" AS Customers,
          SUM(il.UnitPrice*il.Quantity) AS Amount
   FROM Invoice i
   JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
   JOIN Customer c ON i.CustomerId = c.CustomerId
   WHERE i.BillingCountry IN ("USA",
                              "Brazil",
                              "Canada",
                              "Argentina",
                              "Chile")
     AND strftime('%Y', I.InvoiceDate) = "2013"
   GROUP BY 1)
SELECT Customers,
       Amount
FROM T1
ORDER BY 1 DESC
LIMIT 10;
