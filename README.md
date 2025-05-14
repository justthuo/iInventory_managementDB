# iInventory_managementDB
PROJECT DB
Project Title

Inventory Management System

Description

The Inventory Management System is a MySQL-based application designed to help warehouses and retail stores keep track of products, suppliers, customers, orders, and stock levels across multiple locations. It provides a clear relational schema that ensures data integrity and supports common operations such as:

Adding, updating, and deleting products, suppliers, and customers.

Creating and processing customer orders with detailed line items.

Managing stock levels in different warehouses.

Enforcing relational constraints to prevent invalid data entries.

How to Run / Setup

Prerequisites

MySQL Server installed (version 5.7+ recommended).

MySQL client or GUI (e.g., MySQL Workbench, phpMyAdmin, or CLI).

Clone or Download

Download the project files, including inventory_management.sql and this README.md.

Import the Database

Using MySQL CLI:

mysql -u <username> -p < database_name < inventory_management.sql

Using MySQL Workbench:

Open Workbench and connect to your MySQL server.

Create a new schema (e.g., inventoryDB).

Go to File → Run SQL Script, select inventory_management.sql, and execute.

Verify Tables

USE inventoryDB;
SHOW TABLES;

You should see the following tables:

Suppliers

Products

Customers

Orders

OrderItems

Warehouses

Stock

Populate Sample Data (Optional)

Write or run INSERT statements to add sample suppliers, products, customers, orders, and stock records.

Run Queries

Perform typical operations:

Check current stock:

SELECT p.productName, w.name AS warehouse, s.quantity
FROM Stock s
JOIN Products p ON s.productID = p.productID
JOIN Warehouses w ON s.warehouseID = w.warehouseID;

View order history for a customer:

SELECT o.orderID, o.orderDate, oi.productID, oi.quantity, oi.price
FROM Orders o
JOIN OrderItems oi ON o.orderID = oi.orderID
WHERE o.customerID = 1;

