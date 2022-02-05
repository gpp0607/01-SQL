use sakila;

SELECT actor_id, CONCAT(first_name,' ', last_name) AS nombre_completo, last_update
FROM actor;

SELECT UPPER(name)
FROM language;

SELECT film_id, LOWER(title) AS Titulo 
FROM film_text;

-- 1. Mostrar el nombre de las películas y el nombre de los actores que participaron en cada una.
SELECT f.title, a.first_name, a.last_name
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id;

-- 2. Mostrar el nombre de las películas y el de sus categorías.
SELECT f.title, c.name FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id;

-- 3. Mostrar el país, la ciudad y la primera dirección de cada miembro del staff.
SELECT c.country, ci.city, a.address 
FROM country c
INNER JOIN city ci ON ci.country_id = c.country_id
INNER JOIN address a ON a.city_id = ci.city_id;

-- 4 Mostrar cuántas películas ha realizado el actor ED CHASE.
SELECT COUNT(0) AS Cantidad_Peliculas
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name ='ED' AND a.last_name = 'CHASE';

-- 5 Mostrar el promedio de duración de las películas cada categoría.
SELECT c.name, ROUND(AVG(f.length),2) AS Promedio_Duracion
FROM category c
INNER JOIN film_category fc ON fc.category_id = c.category_id
INNER JOIN film f on f.film_id = fc.film_id
GROUP BY c.name;

-- Generar un union.
-- Generar una tabla calendario, en la que se unifiquen las fechas de alquileres y pagos.
SELECT payment_date
FROM payment
UNION
SELECT rental_date
FROM rental;