show databases;
use classicmodels;
/*util*/
show tables;
describe employees;
describe products;
describe orderdetails;
describe orders;
describe offices;
describe customers;
describe payments;
/*1*/
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'a%';
/*2*/
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on';
/*3*/
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on%';
/*4*/
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '_o_';
/*5*/
SELECT employeeNumber, lastName, firstName FROM employees WHERE !(firstName LIKE 'b%');
/*6*/
SELECT productCode, productName FROM products WHERE productCode LIKE '%\_20%';
/*7*/
SELECT orderNumber, sum(quantityOrdered * priceEach) AS total FROM orderdetails GROUP BY orderNumber;
/*8*/
SELECT YEAR(orderDate) as anio, count(*) AS ordenes FROM orders GROUP BY YEAR(orderDate);
/*9*/
SELECT officeCode FROM offices WHERE country = 'USA';
SELECT lastName, firstName FROM employees WHERE officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA');
/*10*/
SELECT max(amount) FROM payments;
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount = (SELECT max(amount) FROM payments);
/*11*/
SELECT avg(amount) FROM payments;
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount > (SELECT avg(amount) FROM payments) ORDER BY amount;
/*12*/
SELECT customerNumber FROM orders;
SELECT * FROM customers WHERE !(customerNumber IN (SELECT customerNumber FROM orders));
/*13*/
SELECT orderNumber, sum(quantityOrdered) AS productos FROM orderdetails GROUP BY orderNumber;
SELECT max(productos) AS maximo_productos, min(productos) AS minimo_productos, avg(productos) AS promedio_productos
FROM (
SELECT sum(quantityOrdered) AS productos FROM orderdetails GROUP BY orderNumber
) AS sub;
/*14*/
select * from orders;
select * from customers;
select customerNumber, count(*) as ordenes from orders group by customerNumber;
select sum(ordenes)
from
(
	select customerNumber, count(*) as ordenes from orders group by customerNumber
) as sub;
