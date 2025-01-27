/*

This migration modifies the primary key columns of three tables (kunde, lieferant, zutat) 
to use PostgreSQL's IDENTITY feature for auto-incrementing values. This ensures that new 
records will automatically receive the next available ID.

Changes:
1. Converts manual ID columns to auto-incrementing ones
2. Preserves existing ID values from initial data
3. Sets sequence values to continue from current maximum IDs

Tables affected:
- kunde (customer)
- lieferant (supplier)
- zutat (ingredient)

Note: This migration is required to support automatic ID generation for new records
while maintaining compatibility with existing data.
*/

ALTER TABLE kunde
    ALTER kundennr ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE lieferant
    ALTER lieferantennr ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE zutat
    ALTER zutatennr ADD GENERATED ALWAYS AS IDENTITY;

SELECT SETVAL(
               (SELECT pg_get_serial_sequence('kunde', 'kundennr')),
               (SELECT max(kundennr) FROM kunde),
               true
       );

SELECT SETVAL(
               (SELECT pg_get_serial_sequence('lieferant', 'lieferantennr')),
               (SELECT max(lieferantennr) FROM lieferant),
               true
       );

SELECT SETVAL(
               (SELECT pg_get_serial_sequence('zutat', 'zutatennr')),
               (SELECT max(zutatennr) FROM zutat),
               true
       );