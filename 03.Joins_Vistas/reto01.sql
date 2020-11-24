USE tienda;

/*01*/
select * from puesto where salario > 100000;
SELECT nombre FROM empleado where id_puesto in ((select id_puesto from puesto where salario > 100000));

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