use prueba2;
#Ejercicios

/*1- Lista los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en
primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por los apellidos
y el nombre de los empleados.*/
SELECT emp.nombre, emp.apellido1, dep.nombre
FROM empleado emp
INNER JOIN departamento dep ON emp.codigo_departamento = dep.codigo
ORDER BY dep.nombre, emp.apellido1, emp.nombre;

/*2- Lista el código y el nombre del departamento, solamente de aquellos departamentos que tienen
empleados.*/
SELECT DISTINCT dep.codigo, dep.nombre
FROM departamento dep, empleado emp
WHERE emp.codigo_departamento = dep.codigo;

/*3- Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.*/
SELECT dep.nombre
FROM departamento dep, empleado emp
WHERE emp.codigo_departamento = dep.codigo
AND emp.nombre = 'Pepe'
AND emp.apellido1 = 'Ruiz'
AND emp.apellido2 = 'Santana';

/*4- Lista a todos los empleados junto con los datos de los departamentos donde trabajan. Este listado
también debe incluir los empleados que no tienen ningún departamento asociado.*/
SELECT emp.nombre, emp.apellido1, emp.apellido2, dep.nombre AS departamento
FROM departamento dep, empleado emp
WHERE emp.codigo_departamento = dep.codigo;

/*5- Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado
asociado*/
SELECT dep.nombre AS departamento
FROM departamento dep, empleado emp
WHERE dep.codigo = emp.codigo_departamento
AND emp.codigo_departamento IS NULL;

/*6- Calcula el número de empleados que trabajan en cada uno de los departamentos que tienen un
presupuesto mayor a 200000.*/
SELECT DISTINCT dep.nombre AS departamento
FROM departamento dep, empleado emp
WHERE dep.codigo = emp.codigo_departamento
AND dep.presupuesto > 200000;