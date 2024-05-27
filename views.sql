CREATE VIEW vw_total_sales_per_product AS
SELECT
    p.ProductID,
    p.Name,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.Price) AS TotalSales
FROM
    Products p
JOIN
    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID, p.Name;

CREATE VIEW vw_orders_by_customer AS
SELECT
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID;

CREATE VIEW vw_product_stock_levels AS
SELECT
    p.ProductID,
    p.Name,
    p.Stock
FROM
    Products p;
