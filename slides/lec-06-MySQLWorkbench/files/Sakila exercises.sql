USE sakila;

SHOW TABLES;

SELECt *
FROM actor
WHERE first_name = 'Scarlett';

SELECT *
FROM actor
WHERE last_name LIKE 'Johansson';

# oppure
SELECT *
FROM actor
WHERE last_name LIKE 'Jo%';

SELECT last_name
FROM actor;

SELECT DISTINCT last_name
FROM actor;

SELECT count(DISTINCT last_name)
FROM  actor;

SELECT  last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

# Quali cognomi compaiono piu` di una volta?
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

# Qual e l'attore che ha recitato nel maggior numero di film?
SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(actor.actor_id) AS film_count
FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY film_count DESC
LIMIT 1;

# Inserire un record per rappresentare ‘Mary Smith’ 
# che oggi affitta ‘Academy Dinosaur’ da ‘Mike Hillyer’
# presso lo Store 1.
SELECT customer_id
FROM Customer
WHERE first_name='Mary' AND last_name='Smith';

INSERT INTO rental
(rental_date, inventory_id, customer_id, staff_id)
VALUES
(NOW(), 1, 1, 1);

SELECT *
FROM rental
ORDER BY rental_date DESC
LIMIT 1;

# oppure
SELECT *
FROM rental
ORDER BY rental_id DESC
LIMIT 1;

# Qual `e la lunghezza media di tutti i film del DB sakila?
SELECT AVG(length)
FROM film;

# Qual e la durata media dei film per categoria?
SELECT category.name, AVG(length)
FROM film JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.category_id
ORDER BY AVG(length) DESC;

# Elenco i titoli di tutti i film che durano piu` di 113 minuti:
SELECT title, length
FROM film
WHERE length >= 113;

# Elencare i film la cui durata `e compresa tra 130 e 150 minuti (estremi compresi) e il cui rating `e NC-17:
SELECT title
FROM film
WHERE length >= 130 AND length <= 150 AND rating = 'NC-17';

# oppure
SELECT title
FROM film
WHERE length BETWEEN 130 AND 150 AND rating = "NC-17";

# Elencare nome e cognome di tutti gli attori che hanno recitato nel film “TEEN APOLLO”.
SELECT first_name, last_name
FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE film.title = 'TEEN APOLLO';

# Indicare il numero di film e la durata media dei film in cui ha recitato ZERO CAGE

SELECT COUNT(*) AS 'n. film', AVG(film.length) AS 'durata media'
FROM film JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name = 'ZERO' AND actor.last_name = 'CAGE';

# oppure

SELECT COUNT(*) AS 'n. film', AVG(film.length) AS 'durata media'
FROM film JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.first_name, actor.last_name
HAVING actor.first_name = 'ZERO' AND actor.last_name = 'CAGE';

# Elencare gli attori per nome, cognome e numero di film fatti, 
# ordinati da chi ha fatto piu` film a chi ne ha fatti meno 
# e in caso di ugual numero di film ordinarli per cognome.
#Nell’elenco devono comparire solo gli attori che hanno fatto 
# piu` di 33 film (33 compreso)

SELECT actor.first_name, actor.last_name, COUNT(*) AS 'conteggio'
FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.first_name, actor.last_name
HAVING conteggio >= 33
ORDER BY conteggio DESC, last_name;

# oppure
SELECT actor.first_name, actor.last_name, COUNT(*) AS 'conteggio'
FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
HAVING conteggio >= 33
ORDER BY conteggio DESC, last_name;

# Trovare il film con la durata maggiore, indicandone titolo e durata.
# Se fossero piu` di uno, elencarli in ordine di titolo.

SELECT title, length
FROM film
WHERE length IN (
	SELECT MAX(length)
	FROM film
)
ORDER BY title;

# Trovare quanti sono i film la cui durata `e maggiore di almeno 60 minuti 
# della durata media di tutti i film.
SELECT COUNT(*) AS 'n. film > durata media + 60'
FROM film
WHERE length >= (
SELECT AVG(length) + 60
FROM film
);







