--select * from customer;
--select * from employee e ;
--select * from orders_facts of2 ;
--select * from product p ;
--select * from supplier s ;
--select * from time;

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
create index idx_time on time (year, month);
--drop index idx_time;
--drop view ventas_totales_producto_mes;

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
--explain select distinct * from ventas_totales_empleado_trimestre;
create index idx_empleado on employee (emplastname);
--drop index idx_empleado;

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
--explain select distinct * from productos_mas_vendidos_categoria;
create index idx_category on product (productcategory);
--drop index idx_category;

