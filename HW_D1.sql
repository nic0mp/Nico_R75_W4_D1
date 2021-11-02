-- Hello World SQL, Select all records from actor table
SELECT *
FROM actor;

--Query for first name and last_name
SELECT first_name, last_name
FROM actor; 

--Query forr a first_name that equals Nick using the WHERE clause
SELECT last_name, first_name
FROM actor
WHERE first_name = 'Nick';

-- Query for first_name that is Like Nick using LIKE and WHERE
SELECT last_name, first_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_names stsarting with J using LIKE, WHERE and the wildcard
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

--Quer for all first_name data that starts with K and has 2 letters after the k.
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

--Query for first_name data that starts with K and ends with 'th'
--Using LIKE,WHERE WILDCARD AND UNDERSCORE
SELECT *
FROM actor
WHERE first_name LIKE 'K__%th';

--comparing operators are:
--Greater than (>) -- Less than (<)
--Greater or equal (>=) less or equal (<=)
--not equal <>

--Explore Data with SELECT * QUERY (Do this when you change to a new table)
SELECT*
FROM payment;

--Query for dsata that shows customers who paid an amount greater than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

--Query for data that shows customers who paid an anount LESS than $7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

--Query for data that shows customers who paid an anount LESS than or equal to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

--Query for data that shows customers who paid an anount LESS than or equal to $2
SELECT customer_id, amount
FROM payment
WHERE amount <= 2.00
-- in ascending order
ORDER BY amount ASC;

-- Boolean Operators in SQL
-- BETWEEN
-- AND

--Query for data that shows customers who paid an amount Between $2 and $7.99
--Using the BETWEEN with the AND Clause -- Attached to the WHERE Clause
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND  7.99;

-- Query for data that shows customers who paid
-- an amount NOT EQUAL to $0.00
-- Order the results in DESCENDING order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SQL aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

--Query to display sum of amounts paid that are greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

--Query to display average of amounts paid that are greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

--Query to display count of amounts paid that are greater than 5.99
SELECT COUNT (amount)
FROM payment
WHERE amount > 5.99;

-- SELECT amount
-- FROM payment;

--Query to display DISTINCT (DISTINCT ignores duplicates) of amounts paid that are greater than 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

--Query to display MIN amount paid that are greater than 7.99
SELECT MIN(amount) AS max_num_payments
FROM payment
WHERE amount > 7.99;

--Query to display MAX amount paid that are greater than 7.99
SELECT MAX(amount) AS max_num_payments
FROM payment
WHERE amount > 7.99;

-- Query to display all amounts above 7.99 (To display what the GROUP BY Clause does)
SELECT amount
FROM payment
WHERE amount > 7.99;

-- Query to display the count of the amount equal to $7.99
-- WHILE ALSO displaying the actual amount as well
-- Using the GROUP BY clause to produce the count
SELECT amount, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY amount;

--Query displaying different amounts grouped together and counts the amounts
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY count DESC;

--Query to display customer_id across from summed amount paid
SELECT customer_id, SUM(amount) AS total_paid
FROM payment
GROUP BY customer_id
ORDER BY total_paid DESC;

--Query to display same as abpve but differently
SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

--Select all from customer to see table
SELECT *
FROM customer;

--SQL HAVING clause

--Query to display customer_ids that show up more than 5 times group by customer email
SELECT COUNT(customer_id), email
FROM customer
GROUP BY email
HAVING COUNT(customer_id) >1;

--Query to display customer emails where the first_name is Lisa
SELECT first_name, email
FROM customer
WHERE first_name LIKE 'Lisa';


-- 1. How many actors are there with the last name ‘Wahlberg’? 
--ANSWER: 2
SELECT first_name, last_name
FROM actor
WHERE last_name='Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99? 
--ANSWER: 5607
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND  5.99;

-- 3. What film does the store have the most of? (search in inventory) 
--ANSWER: Multiple films are tied at 8
SELECT *
FROM inventory;

-- 4. How many customers have the last name ‘William’? 
--ANSWER:0
SELECT last_name, first_name
FROM customer
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals? 
--ANSWER: 1 - 8040 
SELECT COUNT(staff_id)
FROM rental
GROUP BY staff_id;

-- 6. How many different district names are there? 
--ANSWER: 378
SELECT COUNT(DISTINCT(district))
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
--ANSWER: film_id 508 - 15 actors
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 
--ANSWER: 13
SELECT last_name, store_id 
FROM customer
WHERE store_id = '1' AND last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 
-- for customers  with ids between 380 and 430? (use group by and having > 250) 
--ANSWER: 3
-- SELECT *
-- FROM payment
SELECT amount, customer_id
FROM payment
WHERE amount BETWEEN 4.99 AND 5.99 AND customer_id BETWEEN 380 AND 430


-- 10. Within the film table, how many rating categories are there? And what rating has 
-- the most  movies total?
--ANSWER:5 ratings, PG-13 has the most
-- SELECT *
-- FROM film
SELECT COUNT(DISTINCT(rating))
FROM film;







