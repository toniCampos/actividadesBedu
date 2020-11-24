USE tienda;

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
select v.clave, sum(a.precio) as total from venta as v
left join articulo as a
on a.id_articulo = v.id_articulo
group by v.clave
order by v.clave;