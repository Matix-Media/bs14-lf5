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

create table rezept (
    rezeptnr integer primary key generated always as identity,
    name varchar(100) not null,
    beschreibung text,
    portionen integer,
    schwierigkeitsgrad varchar(20),
    zubereitungszeit integer,
    erstelltam timestamp default current_timestamp
);

create table rezeptzutat (
    rezeptnr integer,
    zutatennr integer,
    menge integer,
    einheit varchar(25),
    primary key (rezeptnr, zutatennr),
    foreign key (rezeptnr) references rezept(rezeptnr),
    foreign key (zutatennr) references zutat(zutatennr)
);

create table ernaehrungskategorie (
    kategorienr integer primary key generated always as identity,
    name varchar(50) not null,
    beschreibung text
);
