# CHAR_LENGTH() 
SELECT email, char_length(email) as Longitud
FROM customer;

SELECT name, CHAR_LENGTH(name) AS Longitud
FROM category;

SELECT city, CHAR_LENGTH(city) AS Longitud
FROM city;

-- CONCAT()
SELECT first_name, last_name, CONCAT(first_name," ",last_name) as "Nombre Completo " FROM customer;

SELECT CONCAT_WS(' - ', title, release_year, rating) FROM film as Peli_Descrip; # Concatena varias columnas con el separador elegido

-- ROUND()
SELECT amount, ROUND(amount,0) as Monto FROM payment;

-- UCASE()
SELECT *, LCASE(CONCAT(first_name, " ", last_name)) as "Nombre en minusculas" FROM actor;


-- INSER INTO()
SELECT * FROM city;
INSERT INTO city (city, country_id)
VALUES ('Mexico', '100');
SELECT * FROM city;

INSERT INTO actor (first_name, last_name)
VALUES ('OSCAR', 'PEREZ');
SELECT * FROM actor;

INSERT INTO category (name)
VALUES ('Terror');
SELECT * FROM category;


-- UPDATE()
UPDATE city
SET city='New York'
WHERE country_id=2;
SELECT * FROM city ORDER BY 3;

UPDATE actor
SET first_name = 'HARPO'
WHERE first_name='GROUCHO' AND last_name='WILLIAMS';
SELECT * FROM actor;

UPDATE staff
SET first_name = 'Raul'
WHERE staff_id=1;
SELECT * FROM staff;


-- ALTER TABLE()

ALTER TABLE actor
ADD COLUMN description char(5) ;
SELECT * FROM actor;

ALTER TABLE actor
DROP COLUMN description;


-- CASE
SELECT * FROM address;

SELECT address, address2,
CASE
WHEN address2 IS NULL THEN "Sin direccion 2"
ELSE "Con direccion"
END AS Comentario
FROM address;

SELECT payment_id, amount,
CASE
WHEN amount < 1 THEN "Precio Minimo"
WHEN amount between 1 and 3 THEN "Precio Intermedio"
ELSE "Precio Maximo"
END AS Comentario
FROM payment;


-- JOINS
-- ¿Quien ha vendido mas del STAFF desde Agosto 2005?
SELECT first_name, last_name, SUM(amount) as 'Total Amount'
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
AND payment_date LIKE '2005-08%'
GROUP BY first_name, last_name;

-- Haga una lista de cada película y el número de actores que figuran en esa película. Utiliza tablas film_actor y film.
SELECT title, COUNT(actor_id) as 'Actor Count'
FROM film_actor INNER JOIN film
ON film_actor.film_id = film.film_id
GROUP BY title;


-- ¿Cuántas copias de la película Hunchback Impossible existen en el sistema de inventario?
SELECT title, COUNT(title) as 'Copies Available'
FROM film INNER JOIN inventory
ON film.film_id = inventory.film_id
WHERE title = 'Hunchback Impossible';


-- Anote el total pagado por cada cliente. Listar los clientes alfabéticamente por apellido:
SELECT first_name, last_name, SUM(amount) as 'Total Paid by Each Customer'
FROM payment INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY first_name, last_name
ORDER BY last_name;


-- SUBQUERY
SELECT title
FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%'
AND title IN
(
SELECT title
FROM film
WHERE language_id IN
(
SELECT language_id
FROM language
WHERE name ='English'
)
);


SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
SELECT actor_id
FROM film_actor
WHERE film_id IN
(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'
)
);



SELECT title
FROM film
WHERE film_id IN
(
SELECT film_id
FROM film_category
WHERE category_id IN
(
SELECT category_id
FROM category
WHERE name='Family'
)
);


-- VIEW
CREATE VIEW top_revenues_by_genre AS
SELECT name, SUM(amount)
FROM category
INNER JOIN film_category
ON category.category_id = film_category.category_id
INNER JOIN inventory
ON film_category.film_id = inventory.film_id
INNER JOIN rental
ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment
ON rental.rental_id = payment.rental_id
GROUP BY name
ORDER BY SUM(amount) DESC LIMIT 5;

SELECT * FROM top_revenues_by_genre;
DROP VIEW top_revenues_by_genre;