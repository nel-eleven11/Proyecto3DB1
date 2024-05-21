-- Crear la tabla Northwind_Categories
CREATE TABLE Northwind_Categories (
    categoryID NUMBER(38) PRIMARY KEY,
    categoryName VARCHAR2(128 BYTE) NOT NULL,
    description VARCHAR2(128 BYTE)
);

-- Crear la tabla Northwind_Product
CREATE TABLE Northwind_Product (
    productID NUMBER(38) PRIMARY KEY,
    productName VARCHAR2(128 BYTE) NOT NULL,
    quantityPerUnit VARCHAR2(20 BYTE),
    unitPrice NUMBER(38, 2),
    discontinued NUMBER(38),
    categoryID NUMBER(10),
    FOREIGN KEY (categoryID) REFERENCES Northwind_Categories(categoryID)
);

-- Crear la tabla Northwind_Customers
CREATE TABLE Northwind_Customers (
    customerID VARCHAR2(26 BYTE) PRIMARY KEY,
    companyName VARCHAR2(128 BYTE) NOT NULL,
    contactName VARCHAR2(50 BYTE),
    contactTitle VARCHAR2(50 BYTE),
    city VARCHAR2(26 BYTE),
    country VARCHAR2(26 BYTE)
);

-- Crear la tabla Northwind_Shippers
CREATE TABLE Northwind_Shippers (
    shipperID NUMBER(38) PRIMARY KEY,
    companyName VARCHAR2(128 BYTE) NOT NULL
);

-- Crear la tabla Northwind_Employees
CREATE TABLE Northwind_Employees (
    employeeID NUMBER(38) PRIMARY KEY,
    employeeName VARCHAR2(26 BYTE) NOT NULL,
    title VARCHAR2(26 BYTE),
    city VARCHAR2(26 BYTE),
    country VARCHAR2(26 BYTE),
    reportsTo NUMBER(38)
);

-- Crear la tabla Northwind_Orders
CREATE TABLE Northwind_Orders (
    orderID NUMBER(38) PRIMARY KEY,
    customerID VARCHAR2(26 BYTE),
    employeeID NUMBER(38),
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipperID NUMBER(38),
    freight NUMBER(38, 2),
    FOREIGN KEY (customerID) REFERENCES Northwind_Customers(customerID),
    FOREIGN KEY (employeeID) REFERENCES Northwind_Employees(employeeID),
    FOREIGN KEY (shipperID) REFERENCES Northwind_Shippers(shipperID)
);

-- Crear la tabla Northwind_Order_Items
CREATE TABLE Northwind_Order_Items (
    orderID NUMBER(38),
    productID NUMBER(38),
    unitPrice NUMBER(38, 1),
    quantity NUMBER(38),
    discount NUMBER(38, 2),
    FOREIGN KEY (orderID) REFERENCES Northwind_Orders(orderID),
    FOREIGN KEY (productID) REFERENCES Northwind_Product(productID)
);