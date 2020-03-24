SELECT p.ProductID FROM Product p 
INNER JOIN OrderItem oi ON p.ProductID  = oi.ProductID 
INNER JOIN Orders o ON o.OrderID  = oi.OrderID 
INNER JOIN Customer c ON c.CustomerID  = o.CustomerID 
INNER JOIN Invoice i ON i.InvoiceID  = o.InvoiceID 
WHERE oi.ItemStatus  <> 'shipped' AND i.InvoiceStatus = 'paid'
AND o.CustomerID  = (SELECT CustomerID FROM Customer WHERE FullName  = 'Ben')

SELECT TOP 3 (oi.ProductID) , SUM(oi.Quantity) AS TotalQuantity FROM ProductType pt
INNER JOIN Product p ON p.ProductTypeID  = pt.ProductTypeID 
INNER JOIN OrderItem oi ON oi.ProductID = p.ProductID 
INNER JOIN Orders o ON o.OrderID  = oi.OrderID 
INNER JOIN Invoice i ON i.InvoiceID = o.InvoiceID 
WHERE i.InvoiceStatus = 'paid'
GROUP BY oi.ProductID
ORDER BY TotalQuantity DESC

SELECT pt.ProductTypeDesc FROM ProductType pt 
WHERE pt.ParentID IS NOT NULL

SELECT TOP 1 (ProdMatches), ProductID1, ProductID2 FROM 
(SELECT COUNT(*) AS ProdMatches, ProductID1, ProductID2 FROM 
(SELECT oi.ProductID AS ProductID1 , oi2.ProductID AS ProductID2 FROM OrderItem oi 
INNER JOIN OrderItem oi2 ON oi2.OrderID  = oi.OrderID 
WHERE oi2.ProductID <> oi.ProductID AND oi2.OrderID  = oi.OrderID) AS d
GROUP BY ProductID1, ProductID2) AS d2

SELECT TOP 3 Email FROM Customer 
ORDER BY NEWID()
