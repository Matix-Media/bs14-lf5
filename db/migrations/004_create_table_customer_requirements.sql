/*
This script defines three new tables—`rezept`, `rezeptzutat`, and `ernaehrungskategorie`—to support a structured representation of recipes, their ingredients, and nutritional categories.

Details:
1. **Table: `rezept`**
   - Represents individual recipes.
   - Uses an auto-incrementing primary key (`rezeptnr`) via PostgreSQL's `IDENTITY` feature.
   - Stores details such as recipe name, description, portions, difficulty, preparation time, and creation timestamp.

2. **Table: `rezeptzutat`**
   - Defines the relationship between recipes and ingredients.
   - Uses a composite primary key (`rezeptnr`, `zutatennr`) to uniquely identify ingredient quantities for each recipe.
   - Enforces foreign key constraints linking `rezept` (`rezeptnr`) and `zutat` (`zutatennr`).

3. **Table: `ernaehrungskategorie`**
   - Represents nutritional categories for recipes or ingredients.
   - Uses an auto-incrementing primary key (`kategorienr`).
   - Includes category names and descriptions.

Key Features:
- Auto-incrementing primary keys ensure smooth insertion of new records.
- Foreign key constraints enforce data integrity between related tables.
*/
CREATE TABLE rezept (
    rezeptnr INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    beschreibung TEXT,
    portionen INTEGER,
    schwierigkeitsgrad VARCHAR(20),
    zubereitungszeit INTEGER,
    erstelltam TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rezeptzutat (
    rezeptnr INTEGER,
    zutatennr INTEGER,
    menge INTEGER,
    einheit VARCHAR(25),
    PRIMARY KEY (rezeptnr, zutatennr),
    FOREIGN KEY (rezeptnr) REFERENCES rezept(rezeptnr),
    FOREIGN KEY (zutatennr) REFERENCES zutat(zutatennr)
);

CREATE TABLE ernaehrungskategorie (
    kategorienr INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    beschreibung TEXT
);
