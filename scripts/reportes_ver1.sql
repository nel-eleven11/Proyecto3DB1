select * from customer;
select * from employee e ;
select * from orders_facts of2 ;
select * from product p ;
select * from supplier s ;
select * from time;

CREATE TABLE public.customer (
    customerid character varying(30) NOT NULL,
    companyname character varying(255),
    city character varying(100),
    country character varying(100)
);

CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    emplastname character varying(255),
    mnglastname character varying(255)
);

CREATE TABLE public.orders_facts (
    customerid character varying(30) NOT NULL,
    productid integer NOT NULL,
    employeeid integer NOT NULL,
    timeid integer NOT NULL,
    supplierid integer NOT NULL,
    price numeric(10,2),
    quantity integer
);

CREATE TABLE public.product (
    productid integer NOT NULL,
    productname character varying(255),
    productcategory character varying(100)
);

CREATE TABLE public.supplier (
    supplierid integer NOT NULL,
    companyname character varying(255),
    country character varying(100)
);

CREATE TABLE public."time" (
    timeid integer NOT NULL,
    date date,
    year integer,
    quarter integer,
    month integer,
    day integer
);

CREATE VIEW ventas_totales_cliente_anio AS
SELECT 
    c.customerid,
    c.companyname,
    t.year,
    SUM(o.price * o.quantity) AS total_sales
FROM 
    orders_facts o
JOIN 
    customer c ON o.customerid = c.customerid
JOIN 
    "time" t ON o.timeid = t.timeid
GROUP BY 
    c.customerid, c.companyname, t.year
;

select * from ventas_totales_cliente_anio;

CREATE VIEW ventas_totales_producto_mes AS
SELECT 
    p.productid,
    p.productname,
    t.year,
    t.month,
    SUM(o.price * o.quantity) AS total_sales
FROM 
    orders_facts o
JOIN 
    product p ON o.productid = p.productid
JOIN 
    "time" t ON o.timeid = t.timeid
GROUP BY 
    p.productid, p.productname, t.year, t.month;
   
select * from ventas_totales_producto_mes;

CREATE VIEW ventas_totales_empleado_trimestre AS
SELECT 
    e.employeeid,
    e.emplastname,
    t.year,
    t.quarter,
    SUM(o.price * o.quantity) AS total_sales
FROM 
    orders_facts o
JOIN 
    employee e ON o.employeeid = e.employeeid
JOIN 
    "time" t ON o.timeid = t.timeid
GROUP BY 
    e.employeeid, e.emplastname, t.year, t.quarter;

select * from ventas_totales_empleado_trimestre;

CREATE VIEW ventas_totales_pais_proveedor_anio AS
SELECT 
    s.country,
    t.year,
    SUM(o.price * o.quantity) AS total_sales
FROM 
    orders_facts o
JOIN 
    supplier s ON o.supplierid = s.supplierid
JOIN 
    "time" t ON o.timeid = t.timeid
GROUP BY 
    s.country, t.year;

select * from ventas_totales_pais_proveedor_anio;
 
CREATE VIEW productos_mas_vendidos_categoria AS
SELECT 
    p.productcategory,
    p.productid,
    p.productname,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(o.price * o.quantity) AS total_sales
FROM 
    orders_facts o
JOIN 
    product p ON o.productid = p.productid
GROUP BY 
    p.productcategory, p.productid, p.productname
ORDER BY 
    p.productcategory, total_quantity_sold DESC;

select * from productos_mas_vendidos_categoria;

