-- CREATE DATABASE inventory_managementdb;
-- USE inventory_managementdb;
-- Drop tables if they exist (for clean rerun)
DROP TABLE IF EXISTS OrderItems, Orders, Stock, Warehouses, Products, Suppliers, Customers;

-- Suppliers Table
CREATE TABLE Suppliers (
    supplierID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- Products Table
CREATE TABLE Products (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unitPrice DECIMAL(10, 2) NOT NULL,
    supplierID INT,
    FOREIGN KEY (supplierID) REFERENCES Suppliers(supplierID)
);

-- Customers Table
CREATE TABLE Customers (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- Orders Table
CREATE TABLE Orders (
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    orderDate DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

-- OrderItems Table (many-to-many between Orders and Products)
CREATE TABLE OrderItems (
    orderItemID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    productID INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

-- Warehouses Table
CREATE TABLE Warehouses (
    warehouseID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Stock Table (tracks product quantities in warehouses)
CREATE TABLE Stock (
    stockID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT,
    warehouseID INT,
    quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (productID) REFERENCES Products(productID),
    FOREIGN KEY (warehouseID) REFERENCES Warehouses(warehouseID),
    UNIQUE (productID, warehouseID)
);
