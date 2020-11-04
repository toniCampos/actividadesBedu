USE tienda;

SELECT nombre, count(*) FROM puesto GROUP BY nombre;
SELECT nombre, sum(salario) FROM puesto GROUP BY nombre;
SELECT id_empleado, count(*) FROM venta GROUP BY id_empleado;
SELECT id_articulo, count(*) FROM venta GROUP BY id_articulo;