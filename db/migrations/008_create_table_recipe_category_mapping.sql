/*
The `rezeptkategorie` table defines a many-to-many relationship between recipes (`rezept`) and nutritional categories (`ernaehrungskategorie`).

Details:
- **Columns**:
  - `rezeptnr`: References the `rezept` table.
  - `kategorienr`: References the `ernaehrungskategorie` table.
- **Keys**:
  - Primary key: (`rezeptnr`, `kategorienr`).
  - Foreign keys ensure valid references to `rezept` and `ernaehrungskategorie`.

Purpose:
- Allows recipes to belong to multiple nutritional categories while ensuring data integrity.
*/


CREATE TABLE rezeptkategorie(
    rezeptnr INTEGER,
    kategorienr INTEGER,
    PRIMARY KEY (rezeptnr, kategorienr),
    FOREIGN KEY (rezeptnr) REFERENCES rezept(rezeptnr),
    FOREIGN KEY (kategorienr) REFERENCES ernaehrungskategorie(kategorienr)
);
