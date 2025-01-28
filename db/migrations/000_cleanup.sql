/*
Drop all created tables so that the database can be reconstructed from scratch.
The order is important, as the tables are referenced by foreign keys and we do not want to disable foreign key checks.
*/

DROP TABLE rezeptzutat;
DROP TABLE rezeptkategorie;
DROP TABLE bestellungzutat;
DROP TABLE rezept;
DROP TABLE zutat;
DROP TABLE lieferant;
DROP TABLE ernaehrungskategorie;
DROP TABLE bestellung;
DROP TABLE kunde;