/*
This script creates a table (`allergen`) to store allergen information and a mapping table (`zutatallergen`) 
to establish a Many-to-Many relationship between ingredients (`zutat`) and allergens.

Details:
1. **Table: `allergen`**
   - Each row represents a specific allergen with a unique identifier (`allergennr`) and a name (`name`).
   - An optional description (`beschreibung`) can be provided for each allergen.

2. **Table: `zutatallergen`**
   - This table maps each ingredient (`zutatennr`) to its corresponding allergen (`allergennr`).
   - The table uses two columns: `zutatennr` (referencing `zutat`) and `allergennr` (referencing `allergen`).
   - Both columns are foreign keys that reference the primary keys of the `zutat` and `allergen` tables.

3. **Purpose:**
   - Establishes a Many-to-Many relationship between ingredients and allergens, allowing each ingredient to have multiple allergens and each allergen to be associated with multiple ingredients.
   - Facilitates efficient querying of ingredients based on their allergens, ensuring that allergen information is easily accessible for food safety and dietary purposes.
*/

CREATE TABLE allergen (
    allergennr INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    beschreibung TEXT
);

CREATE TABLE zutatallergen (
    zutatennr INTEGER,
    allergennr INTEGER,
    PRIMARY KEY (zutatennr, allergennr),
    FOREIGN KEY (zutatennr) REFERENCES zutat(zutatennr),
    FOREIGN KEY (allergennr) REFERENCES allergen(allergennr)
);

INSERT INTO allergen (name)
VALUES
  ('Laktose'),
  ('Weizen'),
  ('Gluten'),
  ('Stärke'),
  ('Karotte'),
  ('Milcheiweiß'),
  ('Erdnuss'),
  ('Ei'),
  ('Tomate');