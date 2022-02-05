use prueba;
# Ejercicios

/* 1- Lista todas las columnas de la tabla producto.*/
SELECT *
FROM producto;

/* 2- Lista el nombre de todos los productos que hay en la tabla producto, renombrando la columna a NOMBRE_PRODUCTO.*/
SELECT nombre AS nombre_producto
FROM producto;

/* 3- Lista los nombres de los productos ordenados por el nombre de forma descendente.*/
SELECT nombre
FROM producto
ORDER BY nombre desc;

/*4- Lista el nombre de los productos que tienen un precio menor o igual a 120€.*/
SELECT nombre
FROM producto
WHERE precio <= 120;

/*5- Lista todos los productos que tengan un precio entre 80€ y 300€.*/
SELECT nombre
FROM producto
WHERE precio BETWEEN 80 AND 300;

/* 6- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.*/
SELECT nombre
FROM fabricante
WHERE nombre like 'S%';

/*7- Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.*/
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

/*8- Lista todos los productos donde el código de fabricante sea 1, 3 o 5.*/
SELECT nombre
FROM producto
WHERE codigo_fabricante IN (1, 3, 5);

/*9- Lista la cantidad de productos que hay en la tabla productos.*/
SELECT count(0)
FROM producto;

/*10- Listar el precio más caro y el más barato entre todos los productos.*/
SELECT MAX(precio) AS precio_mas_caro, MIN(precio) AS precio_mas_barato
FROM producto;

/*11- Lista los nombres, convirtiéndolos a mayúscula, y los precios redondeados a 1 decimal, de todos los productos de la tabla producto.*/
SELECT UPPER(nombre) as nombre, ROUND(precio, 1) as precio_redondeado
FROM producto;

/*12- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.*/
SELECT p.nombre as nombre_producto, p.precio, f.nombre
as nombre_fabricante
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

/*13- Devuelve una lista de todos los productos del fabricante "Crucial" que tengan un precio mayor que 200€.*/
SELECT pr.nombre as nombre_producto
FROM producto pr
INNER JOIN fabricante fab ON pr.codigo_fabricante = fab.codigo
WHERE fab.nombre = 'Crucial'
AND pr.precio > 200;

/*14- Lista todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate.*/
SELECT *
FROM producto
WHERE nombre IN ('Asus', 'HP' 'Seagate');

/*15- Contar la cantidad de productos que tiene cada fabricante.*/
SELECT fab.nombre, count(0) as cant_productos
FROM producto pr
INNER JOIN fabricante fab ON pr.codigo_fabricante = fab.codigo
GROUP BY fab.nombre;

/*16- A partir de la query anterior, solo listar aquellos que tienen 2 o más productos.*/
SELECT fab.nombre, count(0) as cant_productos
FROM producto pr
INNER JOIN fabricante fab ON pr.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
HAVING count(0) >= 2;

/*17- Lista a todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.*/
SELECT fab.nombre as fabricante, pr.nombre as producto
FROM fabricante fab
LEFT JOIN producto pr ON fab.codigo = pr.codigo_fabricante;

/*18- Lista aquellos fabricantes que no tienen ningún producto asociado.*/
SELECT fab.nombre as fabricante
FROM fabricante fab
LEFT JOIN producto pr ON fab.codigo = pr.codigo_fabricante
WHERE pr.codigo_fabricante IS NULL;

