USE world;

# Visualizzare id, nome, popolazione dalla tabella 
# city e limitare i risultati solo alle prime 10 righe.
SELECT id, city.name, population
FROM city
LIMIT 10;

# Visualizzare id, nome, popolazione dalla tabella city e limitare 
# i risultati alle righe 31-40.
SELECT id, city.name, population
FROM city
LIMIT 30, 10;

# Trovare dalla tabella city solo le citt`a
# la cui popolazione `e superiore a 2000000.
SELECT name, population
FROM city
WHERE population > 2000000;

# Trovare tutti i nomi di citt`a dalla 
# tabella city il cui nome inizia con il prefisso “Be”.
SELECT name
FROM city
WHERE name LIKE 'Be%';

# Trovare dalla tabella city solo le citt`
# la cui popolazione `e compresa tra 500000 e 1000000.
SELECT Name, Population
FROM city
WHERE Population BETWEEN 500000 AND 1000000;

# oppure
SELECT Name, Population
FROM city
WHERE Population >= 500000 AND Population <= 1000000;

# Visualizzare tutte le citt`a della tabella city ordinate 
# per nome in ordine crescente.
SELECT name FROM city
ORDER By name;

# oppure
SELECT name FROM city
ORDER By name ASC;

# Trovare la citt`a con la popolazione piu` bassa
# nella tabella city.
SELECT name, population
FROM city
WHERE population = (
	SELECT MIN(population)
	FROM city
);

# oppure
SELECT name, population
FROM city
ORDER BY population
LIMIT 1;

# oppure
SELECT MIN(population), name
FROM city
GROUP BY name, population
HAVING MIN(population)
ORDER BY Population
LIMIT 1;

# Trovare il paese con la popolazione piu` numerosa 
# nella tabella country.
SELECT population, name
FROM country
WHERE population = (
	SELECT MAX(Population)
	FROM country
);

# Elencare tutte le lingue parlate nella 
# regione dei Caraibi (“Caribbean”).
SELECT DISTINCT language
FROM countrylanguage JOIN country
ON country.code = countrylanguage.countrycode
WHERE country.region = 'Caribbean';

# Trovare la capitale della Spagna (ESP).

# quesa query estrae solamente il codice intero della capitale!
SELECT Capital
FROM country
WHERE Code = 'ESP';

# soluzione corretta:
SELECT city.name
FROM city JOIN country
ON city.id = country.capital
WHERE city.countryCode = 'ESP';

# Trovare il paese con la piu` alta aspettativa di vita.
SELECT country.name, LifeExpectancy
FROM country
WHERE LifeExpectancy = (
    SELECT MAX(LifeExpectancy)
	FROM country
);

# Trovare tutte le citt`a del continente europeo.
SELECT city.name
FROM city JOIN country 
ON city.countrycode = country.code
WHERE country.continent = 'Europe';

# Aggiornare il presidente degli Stati Uniti attualmente 
# presente sul database, con ‘Donald Trump’.

# per sapere il nome del presidente attualmente presente sul db
SELECT HeadOfState
FROM country
WHERE name = 'United States';

SHOW CREATE TABLE country;

UPDATE country
SET HeadOfState = 'Donald Trump'
WHERE country.name = 'United States';














