USE tienda;

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