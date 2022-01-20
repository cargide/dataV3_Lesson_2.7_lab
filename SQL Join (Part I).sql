-- 1) How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT C.name AS genre, COUNT(F.film_id) AS amount_films
FROM sakila.film_category F
INNER JOIN sakila.category C 
USING(category_id)
GROUP BY F.category_id
ORDER BY COUNT(F.film_id) DESC;

-- 2) Display the total amount rung up by each staff member in August of 2005.
SELECT S.first_name, S.last_name, SUM(P.amount) AS total_gains_per_member
FROM sakila.payment P
INNER JOIN sakila.staff S
USING(staff_id)
WHERE date_format(payment_date, '%Y') = 2005  AND date_format(payment_date, '%M') = 'August'
GROUP BY S.staff_id;

-- 3) Which actor has appeared in the most films?
SELECT A.first_name, A.last_name, COUNT(F.film_id) AS number_of_films
FROM sakila.actor A
INNER JOIN sakila.film_actor F
USING(actor_id)
GROUP BY A.actor_id
ORDER BY COUNT(F.film_id) DESC
LIMIT 1;

-- 4) Most active customer (the customer that has rented the most number of films)
SELECT C.first_name, C.last_name, COUNT(R.rental_id) AS number_of_films_rented
FROM sakila.customer C
INNER JOIN sakila.rental R
USING(customer_id)
GROUP BY C.customer_id
ORDER BY COUNT(R.rental_id) DESC
LIMIT 1;

-- 5) Display the first and last names, as well as the address, of each staff member.
SELECT S.first_name, S.last_name, A.address, A.address2
FROM sakila.staff S
JOIN sakila.address A
USING(address_id);

-- 6) List each film and the number of actors who are listed for that film.
SELECT F.title, COUNT(A.actor_id)
FROM sakila.film F
JOIN sakila.film_actor A
USING (film_id)
GROUP BY A.film_id
ORDER BY COUNT(A.actor_id) DESC;

-- 7) Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT C.first_name, C.last_name, SUM(P.amount)
FROM sakila.payment P 
INNER JOIN sakila.customer C USING(customer_id)
GROUP BY P.customer_id
ORDER BY C.last_name;

-- 8) List number of films per category.
SELECT C.name AS category, COUNT(F.film_id) AS amount_films
FROM sakila.film_category F
INNER JOIN sakila.category C 
USING(category_id)
GROUP BY F.category_id
ORDER BY COUNT(F.film_id) DESC;