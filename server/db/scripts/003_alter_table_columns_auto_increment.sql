ALTER TABLE kunde
ALTER kundennr ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE lieferant
ALTER lieferantennr ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE zutat
ALTER zutatennr ADD GENERATED ALWAYS AS IDENTITY;