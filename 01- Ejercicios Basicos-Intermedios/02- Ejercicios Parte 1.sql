use sakila; 

/* 1- Consulta store_id, first_name y last_name de la tabla customer de la base de datos sakila.
Cambia el nombre de las columnas store_id, first_name y last_name a Tienda, Nombre y Apellido respectivamente.
Ordena de manera descendente la columna Apellido*/

SELECT 
	store_id AS Tienda, first_name AS Nombre, last_name AS Apellido
FROM
	customer
ORDER BY
	Apellido DESC;
    
 /* 2- Consulta la tabla payment de la base de datos sakila.
¿Cuál es la cantidad mas baja y mas alta de la columna amount?   */
SELECT 
	DISTINCT amount 
FROM
	payment 
ORDER BY 
	amount ASC;
/* 3- Consulta description, release_year de la tabla film de la base de datos sakila.
Filtra la información donde title sea IMPACT ALADDIN */
SELECT 
	description, release_year
FROM
	film
WHERE 
	title = 'IMPACT ALADDIN';
    
/*4- Consulta la tabla payment de la base de datos sakila.
Filtra la información donde amount sea mayor a 0.99. */
SELECT 
	*
FROM 
	payment
WHERE 
	amount > 0.99;
/* 5- Consulta la tabla payment de la base de datos sakila.
Filtra la información donde customer_id sea igual a 36, amount sea mayor a 0.99 y staff_id sea igual a 1. */
SELECT 
	*
FROM 
	payment
WHERE 
	customer_id =36 AND
    amount > 0.99 AND
    staff_id =1;

/* 6- Consulta la tabla rental de la base de datos sakila.
Filtra la información donde staff_id no sea 1, customer_id sea mayor a 250 y inventory_id sea menor de 100.*/
SELECT
	*
FROM 
	rental
WHERE NOT 
	staff_id = 1 AND
    customer_id > 250 AND
    inventory_id < 100;
    
/* 7- Consulta la tabla film_text de la base de datos sakila.
Filtra la información donde title  sea ZORRO ARK, VIRGIN DAISY, UNITED PILO */
SELECT 
	*
FROM 
	film_text
WHERE 
	title IN ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');
    
/* 8- Consulta la tabla city de la base de datos sakila.
Filtra la información donde city sea Chiayi, Dongying, Fukuyama y Kilis.*/    
SELECT
	*
FROM 
	city
WHERE 
	city IN ('Chiayi', 'Dongying', 'Fukuyama', 'Kilis');

/* 9- Consulta la tabla payment de la base de datos sakila.
Filtra la información donde amount esté entre 2.99 y 4.99,  staff_id sea igual a 2 y customer_id sea 1 y 2.*/
SELECT 
	*
FROM 
	payment
WHERE amount BETWEEN 2.99 AND 4.99 AND
	staff_id = 2 AND
	customer_id BETWEEN 1 AND 2;

/* 10- Consulta la tabla address de la base de datos sakila.
Filtra la información donde city_id esté entre 300 y 350*/

SELECT
	*
FROM 
	address
WHERE 
	city_id BETWEEN 300 and 350;
    
/* 11- Consulta la tabla film de la base de datos sakila.
Filtra la información donde rental_rate esté entre 0.99 y 2.99, length sea menor igual de 50  y replacement_cost sea menor de 20.*/

SELECT 
	*
FROM
	film
WHERE
	rental_rate BETWEEN 0.99 AND 2.99 AND 
	length <=50 AND 
	replacement_cost < 20;
/* 12- Consulta la tabla film de la base de datos sakila.
Filtra la información donde release_year sea igual a 2006  y title empiece con ALI.*/

SELECT
	*
FROM
	film
WHERE
	release_year = 2006 AND
	title LIKE 'ALI%';
    
/* 13- Consulta la tabla address de la base de datos sakila.
Realiza un INNER JOIN con las tablas city y country
Mostrar las columnas address, city, country*/

SELECT 
	a.address,
	c.city,
	co.country
FROM 
	address a 
INNER JOIN city c ON (a.city_id = c.city_id)
INNER JOIN country co ON (c.country_id = co.country_id);

/* 14- Consulta la tabla customer de la base de datos sakila.
Realiza un LEFT JOIN con las tablas store y address
Mostrar las columnas first_name, address, store_id*/

SELECT 
	c.first_name,
	a.address,
	s.store_id
FROM 
	customer c
LEFT JOIN store s ON (c.store_id = s.store_id)
LEFT JOIN address a ON (c.address_id = a.address_id);

/* 15- Consulta la tabla rental de la base de datos sakila.
Realiza un INNER JOIN con la tabla staff
Mostrar las columnas rental_id, first_name*/

SELECT
	r.rental_id,
	s.first_name
FROM
	rental r
INNER JOIN staff s ON (r.staff_id = s.staff_id);

/* 16- Consulta la tabla rental de la base de datos sakila.
Realiza un COUNT de  la columna rental_id*/

SELECT
	count(rental_id)
FROM
	rental;

/*
17- Consulta la tabla payment de la base de datos sakila.
Realiza un MAX de  la columna amount
*/

SELECT
	MAX(amount)
FROM
	payment;

/*
18- Consulta la tabla payment de la base de datos sakila.
Realiza un MIN de  la columna amount
*/

SELECT
	MIN(amount)
FROM
	payment;

/*
19- Consulta la tabla payment de la base de datos sakila.
Realiza un AVG de  la columna amount
*/

SELECT
	AVG(amount)
FROM
	payment;


/*
20- Consulta la tabla rental de la base de datos sakila.
Realiza un MAX de  la columna rental_date 
*/

SELECT
	customer_id, MAX(rental_date)
FROM
	rental
GROUP BY
	customer_id;
    

/*
21- Consulta la tabla actor de la base de datos sakila.
Realiza un COUNT de  last_name
Mostrar cuando el COUNT sea mayor de 2
*/

SELECT
	last_name, COUNT(0)
FROM
	actor
GROUP BY
	last_name
HAVING COUNT(0) > 2;

/*22 - Qué actores tienen el primer nombre 'Scarlett'? */

SELECT
	*
FROM
	actor
WHERE
	first_name = 'Scarlett';


/*23 - Qué actores tienen el apellido "Johansson"?*/
SELECT
	*
FROM
	actor
WHERE last_name LIKE 'Johansson';

/* 24- Cuántos apellidos de actores distintos hay?*/
SELECT
	COUNT(distinct last_name)
FROM
	actor;

/*25- ¿Qué apellidos no se repiten?*/

SELECT
	last_name
FROM 
	actor
GROUP BY
	last_name
HAVING COUNT(0) = 1;


/* 26- Qué actor ha aparecido en la mayoría de las películas? */
SELECT
	a.actor_id, a.first_name, a.last_name, count(a.actor_id) as film_count
FROM
	actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY
	a.actor_id
ORDER BY
	film_count desc;

/* 27- ¿Se puede alquilar ‘Academy Dinosaur’ en la tienda 1?*/

SELECT
	f.film_id, f.title, s.store_id, i.inventory_id
FROM
	inventory i
INNER JOIN store s USING (store_id) 
INNER JOIN film f USING (film_id)
WHERE 
	f.title = 'Academy Dinosaur' AND
    s.store_id = 1;
    
    
    
    
    
    
   