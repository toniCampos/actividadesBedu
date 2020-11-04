USE tienda;
SELECT * FROM empleado;
SELECT * FROM empleado WHERE nombre LIKE 'M%';
SELECT * FROM empleado WHERE nombre LIKE '%A';
SELECT * FROM empleado WHERE nombre LIKE 'M%A';
SELECT * FROM empleado WHERE nombre LIKE '%mon';
show tables;
/*reto 1 sesion 2*/
SELECT * FROM articulo WHERE nombre LIKE '%pasta%';
SELECT * FROM articulo WHERE nombre LIKE '%cannelloni%';
SELECT * FROM articulo WHERE nombre LIKE '%-%';
SELECT * FROM puesto WHERE nombre LIKE '%designer%';
SELECT * FROM puesto WHERE nombre LIKE '%developer%';

/* apuntes */
SELECT * FROM articulo;
SELECT avg(precio) FROM articulo;
SELECT avg(precio) AS promedio_precio FROM articulo;
SELECT count(*) AS conteo_precio FROM articulo;
SELECT max(precio) AS precio_maximo FROM articulo;
SELECT min(precio) AS precio_minimo FROM articulo;
SELECT sum(precio) AS precio_total FROM articulo;

/* reto 2 */
show tables;
describe puesto;
SELECT avg(salario) AS promedio_salario FROM puesto;
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%pasta%';
SELECT max(salario) AS salario_maximo FROM puesto;
SELECT min(salario) AS salario_minimo FROM puesto;
SELECT sum(salario) FROM puesto WHERE id_puesto > ((SELECT max(id_puesto) FROM puesto) - 5);
SELECT sum(salario) FROM puesto ORDER BY id_puesto DESC LIMIT 5;

/* apuntes */

describe articulo;
SELECT nombre, sum(precio) FROM articulo GROUP BY nombre;
SELECT nombre, count(*) AS cantidad FROM articulo GROUP BY nombre ORDER BY cantidad DESC;
SELECT nombre, min(salario) AS salario_minimo, max(salario) AS salario_maximo FROM puesto GROUP BY nombre;

/* reto 3 */
describe puesto;
SELECT nombre, count(*) FROM puesto GROUP BY nombre;
SELECT nombre, sum(salario) FROM puesto GROUP BY nombre;
show tables;
describe venta;

SELECT id_empleado, count(*) FROM venta GROUP BY id_empleado;
SELECT id_articulo, count(*) FROM venta GROUP BY id_articulo;
