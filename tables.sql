-- Create Database
CREATE DATABASE JewelryShop;

-- Use the database
USE JewelryShop;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- LoyaltyCards table
CREATE TABLE LoyaltyCards (
    LoyaltyCardID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT UNIQUE,
    CardNumber VARCHAR(20) NOT NULL UNIQUE,
    Points INT DEFAULT 0,
    IssuedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    FOREIGN KEY (name) REFERENCES Products(Category)
);

CREATE TABLE ProductCategories (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);



-- Insert initial data
INSERT INTO Customers (Name, Email) VALUES 
('Yana', 'yana@email.com'),
('Mia', 'mia@email.com'),
('Nadya', 'nadya@email.com'),
('Nikol', 'nikol@email.com');

INSERT INTO LoyaltyCards (CustomerID, CardNumber) VALUES 
(1, 'LC1001'),
(2, 'LC1002'),
(3, 'LC1003'),
(4, 'LC1004');

INSERT INTO Products (Name, Category, Price, Stock) VALUES 
('Gold Ring', 'Ring', 200.00),
('Silver Bracelet', 'Bracelet', 150.00),
('Diamond Earring', 'Earring', 500.00);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES 
(1, '2024-02-07', 200.00),
(2, '2024-03-22', 300.00),
(3, '2024-05-03', 700.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(3, 1, 1);

INSERT INTO Categories (name) VALUES
('Ring'),
('Bracelet'),
('Earring');

INSERT INTO ProductCategories (ProductID, CategoryID) VALUES
(1, 1),
(2, 2),
(3, 3);