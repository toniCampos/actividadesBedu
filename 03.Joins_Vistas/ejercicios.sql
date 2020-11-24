show databases;
use classicmodels;
show tables;

/* util */
select * from products;
select * from orders order by customerNumber;
select * from customers;
select * from employees;
select * from payments;
select * from orderdetails;

/* 1 */
/* no es necesario usar joins */
select productCode, productName, productDescription
from products;

/* 2 */
select od.orderNumber, o.status, sum(od.priceEach * od.quantityOrdered) as total
from orderdetails od
right join orders o
on od.orderNumber = o.orderNumber
group by o.orderNumber;

/* 3 */
select * from orderdetails;
select od.orderNumber, o.orderDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
from orders o
right join orderdetails od
on od.orderNumber = o.orderNumber
left join products p
on od.productCode = p.productCode;

/* 4 */
select * from orderdetails;
select od.orderNumber, p.productName, p.MSRP, od.priceEach
from orders o
right join orderdetails od
on od.orderNumber = o.orderNumber
left join products p
on od.productCode = p.productCode;

/* 5 */
select o.customerNumber, c.customerName, o.orderNumber, c.state 
from orders o
left join customers c
	on o.customerNumber = c.customerNumber
order by o.customerNumber;

/* 6 */
/*pendiente*/
select *
from customers c
left join orders o
	on o.customerNumber = c.customerNumber
where o.orderNumber = NULL;

/*select * from orders order by customerNumber;
select * from customers;*/

/* 7 */
select e.lastName as employeeLastName, e.firstName as employeeFirstName, c.customerName, p.checkNumber, p.amount
from employees e
left join customers c
	on e.employeeNumber = c.salesRepEmployeeNumber
left join payments p
	on p.customerNumber = c.customerNumber;
    
/* 8 convertir ejercicios anteriores con right join*/
/* 8.1 ejercicio 5 */
select o.customerNumber, c.customerName, o.orderNumber, c.state 
from customers c
right join orders o
	on o.customerNumber = c.customerNumber
order by o.customerNumber;

/* 8.2 ejercicio 6 */
/* pendiente */

/* 8.3 ejercicio 7 */
select e.lastName as employeeLastName, e.firstName as employeeFirstName, c.customerName, p.checkNumber, p.amount
from payments p
right join customers c
	on p.customerNumber = c.customerNumber
right join employees e
	on e.employeeNumber = c.salesRepEmployeeNumber;
    
/* 9 */
/* crear vistas de ejercicios anteriores, por ahora no tengo permisos para crear las vistas pero dejo las consultas necesarias*/
/* 9.1 vista de ejercicio 5*/
create view customer_order_status_056 as
(
	select o.customerNumber, c.customerName, o.orderNumber, c.state 
	from orders o
	left join customers c
		on o.customerNumber = c.customerNumber
	order by o.customerNumber
);

select * from customer_order_status_056;

/* 9.2 vista de ejercicio 7*/
create view employee_customer_check_056 as (
	select e.lastName as employeeLastName, e.firstName as employeeFirstName, c.customerName, p.checkNumber, p.amount
	from employees e
	left join customers c
		on e.employeeNumber = c.salesRepEmployeeNumber
	left join payments p
		on p.customerNumber = c.customerNumber
);

select * from employee_customer_check_056;

/* 9.3 vista de ejercicio 4*/
create view order_product_prices_056 as
(
	select od.orderNumber, p.productName, p.MSRP, od.priceEach
	from orders o
	right join orderdetails od
		on od.orderNumber = o.orderNumber
	left join products p
		on od.productCode = p.productCode
);

select * from order_product_prices_056;