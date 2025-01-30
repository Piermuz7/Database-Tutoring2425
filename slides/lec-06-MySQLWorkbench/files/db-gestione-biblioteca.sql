CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE Autori(
	id_autore INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    data_nascita DATE
);

CREATE TABLE Libri(
	id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(255) NOT NULL,
    id_autore INT,
    genere VARCHAR(50),
    anno_pubblicazione YEAR,
    FOREIGN KEY (id_autore) REFERENCES Autori(id_autore)
);

CREATE TABLE Utenti(
id_utente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cognome VARCHAR(100)
 NOT NULL,
 data_nascita DATE,
 email VARCHAR(255) UNIQUE
);


CREATE TABLE Prestiti(
	id_prestito INT AUTO_INCREMENT PRIMARY KEY,
    id_libro int,
    id_utente INT,
    data_prestito DATE NOT NULL,
    data_restituzione DATE,
    FOREIGN KEY (id_libro) REFERENCES Libri(id_libro),
    FOREIGN KEY (id_utente) REFERENCES Utenti(id_utente)
);

INSERT INTO Autori(nome, cognome, data_nascita)
VALUES
('Luigi', 'Rossi', '1960-05-12'),
('Maria', 'Bianchi', '1975-08-23'),
('Giovanni', 'Verdi', '1980-11-15'),
('Laura', 'Neri', '1990-02-05'),
('Marco', 'Gialli', '1955-12-30');

SELECT *
FROM Autori;

DELETE FROM Autori
WHERE id_autore = 5;

INSERT INTO Autori (nome, cognome, data_nascita)
VALUES ('Marco3', 'Gialli', '1955-12-30');


INSERT INTO Autori (id_autore, nome, cognome, data_nascita)
VALUES (12, 'Marco2', 'Gialli', '1955-12-30');

SHOW CREATE TABLE Autori;

DROP TABLE Prestiti;
DROP TABLE Utenti;
DROP TABLE Libri;
DROP TABLE Autori;

SHOW TABLES;

INSERT INTO Libri(titolo, id_autore, genere, anno_pubblicazione)
VALUES
('Il mistero della casa abbandonata', 1, 'Giallo', 1998),
('Viaggio nel tempo', 2, 'Fantascienza', 2005),
('L\'amore ai tempi del colera', 3, 'Romanzo', 2000),
('La città eterna', 4, 'Storico', 2010),
('Le avventure di Tom Sawyer', 5, 'Avventura', 1995);

SELECT *
FROM Libri;

INSERT INTO Utenti(nome, cognome, data_nascita, email)
VALUES
('Anna', 'Rossi', '1992-03-17', 'anna.rossi@example.com'),
('Luca', 'Bianchi', '1988-07-12', 'luca.binachi@example.com'),
('Chiara', 'Verdi', '1995-11-29', 'chiara.verdi@example.com'),
('Giorgio', 'Neri', '1983-05-08', 'giorgio.neri@example.com'),
('Sara', 'Gialli', '2000-01-20', 'sara.gialli@example.com');

SELECT *
FROM Utenti;

INSERT INTO Prestiti(id_libro, id_utente, data_prestito, data_restituzione)
VALUES
(1, 1, '2024-01-10', '2024-01-24'),
(2, 2, '2024-02-14', '2024-02-28'),
(3, 3, '2024-03-01', '2024-03-15'),
(4, 4, '2024-04-20', '2024-05-04'),
(5, 5, '2024-05-25', '2024-06-08');