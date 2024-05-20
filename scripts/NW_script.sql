--Script para crear las tablas de la base de datos de Oracle (DB transaccional)

CREATE TABLE Northwind_Categories (
    CategoryID NUMBER(38) PRIMARY KEY,
    CategoryName VARCHAR2(128 BYTE) NOT NULL,
    Description VARCHAR2(128 BYTE),
    PRIMARY KEY (CategoryID)
);

CREATE TABLE Northwind_Product (
    ProductID NUMBER(38) PRIMARY KEY,
    ProductName VARCHAR2(128 BYTE) NOT NULL,
    QuantityPerUnit VARCHAR2(20 BYTE),
    UnitPrice NUMBER(10, 2),
    Discontinued NUMBER(38),
    CategoryID NUMBER(10),
    PRIMARY KEY (ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Northwind_Categories(CategoryID)
);

CREATE TABLE Northwind_Order_Items (
    OrderID NUMBER(38),
    ProductID NUMBER(38),
    UnitPrice NUMBER(38, 1),
    Quantity NUMBER(38),
    Discount NUMBER(38, 2),
    FOREIGN KEY (OrderID) REFERENCES Northwind_Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Northwind_Products(ProductID)
);

CREATE TABLE Northwind_Orders (
    OrderID NUMBER(38),
    CustomerID VARCHAR2(26 BYTE),
    EmployeeID NUMBER(38),
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipperID NUMBER(38),
    Freight NUMBER(38, 2),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Northwind_Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Northwind_Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Northwind_Shippers(ShipperID)
);


CREATE TABLE Northwind_Customers (
    CustomerID VARCHAR2(26 BYTE) PRIMARY KEY,
    CompanyName VARCHAR2(128 BYTE) NOT NULL,
    ContactName VARCHAR2(50 BYTE),
    ContactTitle VARCHAR2(50 BYTE),
    City VARCHAR2(26 BYTE),
    Country VARCHAR2(26 BYTE),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Northwind_Shippers (
    ShipperID NUMBER(10) PRIMARY KEY,
    CompanyName VARCHAR2(128 BYTE) NOT NULL,
    PRIMARY KEY (ShipperID)
);

CREATE TABLE Northwind_Employees (
    EmployeeID NUMBER(38) PRIMARY KEY,
    EmployeeName VARCHAR2(26 BYTE) NOT NULL,
    Title VARCHAR2(26 BYTE),
    City VARCHAR2(26 BYTE),
    Country VARCHAR2(26 BYTE),
    ReportsTo NUMBER(38),
    PRIMARY KEY (EmployeeID)    
);






