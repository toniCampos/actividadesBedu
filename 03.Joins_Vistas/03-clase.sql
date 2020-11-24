/*Apuntes*/
USE tienda;
SELECT * FROM puesto;

SELECT max(id_puesto) -5 FROM puesto;
/*forma estatica*/
SELECT sum(salario)
FROM puesto
WHERE id_puesto > 995;
/*forma dinamica*/
SELECT sum(salario) 
FROM puesto 
WHERE id_puesto > (SELECT max(id_puesto)-5 FROM puesto);

/*where in*/
SELECT id_puesto
FROM puesto
WHERE nombre = 'Junior Executive';

SELECT *
FROM empleado
WHERE id_puesto in 
(
SELECT id_puesto
FROM puesto
WHERE nombre = 'Junior Executive'
);

/*from*/
/*mayor y menor cantidad de ventas en un articulo*/

SELECT * FROM venta;

SELECT clave, id_articulo, count(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY cantidad DESC;

SELECT id_articulo, min(cantidad) AS cantidad_min, max(cantidad) AS cantidad_max
FROM
(
SELECT clave, id_articulo, count(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY cantidad DESC
) AS subconsulta
ORDER BY id_articulo;

/*reto 01*/
SHOW TABLES;
select * from empleado;
select * from puesto;
select * from venta;
select * from puesto where salario < 15000;
/*01*/
SELECT nombre FROM empleado where id_puesto in ((select id_puesto from puesto where salario < 10000));
/*02*/
select id_empleado, clave, count(*) from venta group by id_empleado, clave order by id_empleado;
select id_empleado, min(total), max(total) FROM 
(
select id_empleado, clave, count(*) as total from venta group by id_empleado, clave
) as subconsulta
group by id_empleado;
/* 03 */
select id_articulo from articulo where precio > 5000;
select id_articulo, clave from venta where id_articulo in (select id_articulo from articulo where precio > 5000);

/*apuntes */
show tables;
show keys from venta;
select * from puesto;
select * from empleado;

select *
from empleado as e
join puesto as p
on e.id_puesto = p.id_puesto;

select *
from puesto as p
left join empleado as e
on e.id_puesto = p.id_puesto;

select *
from empleado as e
right join puesto as p
on e.id_puesto = p.id_puesto;

/*reto 02*/

/*01*/
select * from empleado;
select v.id_venta, v.clave, e.nombre
from venta as v
join empleado as e
on v.id_empleado = e.id_empleado
order by clave;

/* 02 */
select v.id_venta, v.clave, a.nombre
from venta as v
left join articulo as a
on a.id_articulo = v.id_articulo;

/* 03 */
select * from venta;
select * from articulo;

select v.clave, sum(a.precio) as total from venta as v
left join articulo as a
on a.id_articulo = v.id_articulo
group by v.clave
order by v.clave;

/*apuntes*/

select v.clave, v.fecha, a.nombre as producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) as empleado
from venta v
join empleado e
on v.id_empleado = e.id_empleado
join articulo a
on v.id_articulo = a.id_articulo;

create view tickets_056 as
(
select v.clave, v.fecha, a.nombre as producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) as empleado
from venta v
join empleado e
on v.id_empleado = e.id_empleado
join articulo a
on v.id_articulo = a.id_articulo
);

select * from tickets_056;

/* reto 03*/
select * from empleado;
select * from puesto;
select * from venta;
select * from puesto;

/* 01 */
select concat(e.nombre, ' ', e.apellido_paterno) as nombre_completo, p.nombre as puesto
from empleado e
left join puesto p
on e.id_puesto = p.id_puesto;

create view empleados_puestos_056 as
(
select concat(e.nombre, ' ', e.apellido_paterno) as nombre_completo, p.nombre as puesto
from empleado e
left join puesto p
on e.id_puesto = p.id_puesto
);

select * from empleados_puestos_056;

/* 02 */
select v.id_venta, v.clave, concat(e.nombre, ' ', e.apellido_paterno) as nombre_completo, a.nombre
from venta v
left join empleado e
on e.id_empleado = v.id_empleado
left join articulo a
on a.id_articulo = v.id_articulo
order by e.nombre, e.apellido_paterno;

create view venta_empleado_articulo_056 as (
	select v.id_venta, v.clave, concat(e.nombre, ' ', e.apellido_paterno) as nombre_completo, a.nombre
	from venta v
	left join empleado e
		on e.id_empleado = v.id_empleado
	left join articulo a
		on a.id_articulo = v.id_articulo
	order by e.nombre, e.apellido_paterno
);

select * from venta_empleado_articulo_056;

/* 03 */

select p.nombre as puesto, count(*) as ventas
from venta v
left join empleado e
	on e.id_empleado = v.id_empleado
left join puesto p
	on e.id_puesto = p.id_puesto
group by p.id_puesto;

create view ventas_puesto_056 as
(
	select p.nombre as puesto, count(*) as ventas
	from venta v
	left join empleado e
		on e.id_empleado = v.id_empleado
	left join puesto p
		on e.id_puesto = p.id_puesto
	group by p.id_puesto
);

select * from ventas_puesto_056;
