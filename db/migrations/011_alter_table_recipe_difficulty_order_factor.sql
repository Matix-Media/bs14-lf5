/*
This migration script performs several modifications to the database schema:

1. Changes schwierigkeitsgrad in rezept table from VARCHAR to INTEGER
   - First adds a new column
   - Then migrates the data
   - Finally drops the old column and renames the new one

2. Adds a reference to ordered recipe in bestellung table
   - Adds rezeptnr column with foreign key constraint

3. Modifies rezeptzutat table
   - Renames menge to faktor
   - Changes the type to DECIMAL(10,2)
   - Drops the einheit column as it's no longer needed

Note: The difficulty levels are mapped as follows:
1 = Einfach
2 = Mittel
3 = Schwer
*/

-- Step 1: Add new integer column for difficulty
ALTER TABLE rezept 
ADD COLUMN schwierigkeitsgrad_new INTEGER;

-- Migrate the data
UPDATE rezept 
SET schwierigkeitsgrad_new = CASE 
    WHEN schwierigkeitsgrad = 'Einfach' THEN 1
    WHEN schwierigkeitsgrad = 'Mittel' THEN 2
    WHEN schwierigkeitsgrad = 'Schwer' THEN 3
    ELSE 1  -- Default to 'Einfach' if unknown value
END;

-- Drop old column and rename new one
ALTER TABLE rezept 
DROP COLUMN schwierigkeitsgrad,
ADD CONSTRAINT schwierigkeitsgrad_check CHECK (schwierigkeitsgrad_new BETWEEN 1 AND 3);

ALTER TABLE rezept 
RENAME COLUMN schwierigkeitsgrad_new TO schwierigkeitsgrad;

-- Step 2: Add recipe reference to bestellung
ALTER TABLE bestellung
ADD COLUMN rezeptnr INTEGER,
ADD CONSTRAINT fk_bestellung_rezept 
    FOREIGN KEY (rezeptnr) 
    REFERENCES rezept(rezeptnr);

-- Step 3: Modify rezeptzutat table
-- First rename menge to faktor
ALTER TABLE rezeptzutat 
RENAME COLUMN menge TO faktor;

-- Change type to DECIMAL(10,2)
ALTER TABLE rezeptzutat 
ALTER COLUMN faktor TYPE DECIMAL(10,2);

-- Drop einheit column
ALTER TABLE rezeptzutat 
DROP COLUMN einheit;

-- Add check constraint to ensure factor is positive
ALTER TABLE rezeptzutat
ADD CONSTRAINT positive_factor CHECK (faktor > 0);

CREATE TABLE bestellungrezept(
        bestellnr integer not null,
        rezeptnr integer not null,
        primary key (bestellnr, rezeptnr),
        foreign key (bestellnr) references bestellung(bestellnr),
        foreign key (rezeptnr) references rezept(rezeptnr)
)
