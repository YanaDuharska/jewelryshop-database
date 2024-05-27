BEGIN TRANSACTION;

DECLARE @NewProductID INT;

INSERT INTO Products (Name, Category, Price, Stock) VALUES ('Platinum Necklace', 'Necklace', 800.00, 5);
SET @NewProductID = SCOPE_IDENTITY();

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (1, GETDATE(), 800.00);
DECLARE @NewOrderID INT = SCOPE_IDENTITY();

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (@NewOrderID, @NewProductID, 1);

COMMIT TRANSACTION;
- Simple index
CREATE INDEX idx_product_name ON Products(Name);

CREATE INDEX idx_orderdetails_orderid_productid ON OrderDetails(OrderID, ProductID);


CREATE INDEX idx_product_name_prefix ON Products(Name(10));
