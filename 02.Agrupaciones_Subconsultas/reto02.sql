USE tienda;

SELECT avg(salario) AS promedio_salario FROM puesto;
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%pasta%';
SELECT max(salario) AS salario_maximo, min(salario) AS salario_minimo FROM puesto;
SELECT sum(salario) FROM puesto WHERE id_puesto > ((SELECT max(id_puesto) FROM puesto) - 5);