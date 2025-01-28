/*
This script creates a mapping table (`zutatkategorie`) to establish a Many-to-Many relationship 
between the `zutat` table (representing ingredients) and the `ernaehrungskategorie` table (representing nutritional categories).

Details:
1. **Table: `zutatkategorie`**
   - Each row represents a relationship between a specific ingredient (`zutatennr`) and a nutritional category (`kategorienr`).
   - The table uses two columns: `zutatennr` and `kategorienr`, which link the `zutat` and `ernaehrungskategorie` tables respectively.
   - Both columns are foreign keys that reference the primary keys of the `zutat` and `ernaehrungskategorie` tables.

2. **Purpose:**
   - Establishes a Many-to-Many relationship between ingredients and categories, allowing each ingredient to belong to multiple categories and vice versa.
   - Facilitates efficient querying of ingredients based on their nutritional categories.
*/

CREATE TABLE zutatkategorie (
    zutatennr INT NOT NULL,
    kategorienr INT NOT NULL,
    PRIMARY KEY (zutatennr, kategorienr),
    FOREIGN KEY (zutatennr) REFERENCES zutat(zutatennr) ON DELETE CASCADE,
    FOREIGN KEY (kategorienr) REFERENCES ernaehrungskategorie(kategorienr) ON DELETE CASCADE
);

/*
This script inserts predefined relationships between ingredients in the `zutat` table
and their corresponding nutritional categories in the `ernaehrungskategorie` table.
These relationships are necessary for categorizing ingredients based on their dietary preferences and needs.

Details:
1. **Table: `zutatkategorie`**
   - Each row links an ingredient (`zutatennr`) with a nutritional category (`kategorienr`).
   - The IDs of ingredients and categories should match the existing records in the `zutat` and `ernaehrungskategorie` tables.

2. **Inserted Relationships:**
   - Ingredients like `Zucchini`, `Zwiebel`, `Tomate`, etc., are categorized under appropriate nutritional categories such as `Vegan`, `Vegetarisch`, etc.
*/

-- 1. Zucchini (zutatennr: 1001) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1001, 1);
-- 2. Zwiebel (zutatennr: 1002) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1002, 1);
-- 3. Tomate (zutatennr: 1003) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1003, 1);
-- 4. Schalotte (zutatennr: 1004) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1004, 1);
-- 5. Karotte (zutatennr: 1005) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1005, 1);
-- 6. Kartoffel (zutatennr: 1006) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1006, 1);
-- 7. Rucola (zutatennr: 1007) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1007, 1);
-- 8. Lauch (zutatennr: 1008) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1008, 1);
-- 9. Knoblauch (zutatennr: 1009) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1009, 1);
-- 10. Basilikum (zutatennr: 1010) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1010, 1);
-- 11. Süßkartoffel (zutatennr: 1011) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1011, 1);
-- 12. Schnittlauch (zutatennr: 1012) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (1012, 1);

-- 13. Apfel (zutatennr: 2001) belongs to category "Vegetarisch" (kategorienr: 2)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (2001, 2);

-- 14. Vollmilch (zutatennr: 3001) belongs to category "Vegetarisch" (kategorienr: 2)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (3001, 2);
-- 15. Mozzarella (zutatennr: 3002) belongs to category "Vegetarisch" (kategorienr: 2)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (3002, 2);
-- 16. Butter (zutatennr: 3003) belongs to category "Vegetarisch" (kategorienr: 2)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (3003, 2);
-- 17. Ei (zutatennr: 4001) belongs to category "Vegetarisch" (kategorienr: 2)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (4001, 2);

-- 18. Wiener Würstchen (zutatennr: 5001) belongs to category "Protein-Reich" (kategorienr: 5)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (5001, 5);

-- 19. Tofu-Würstchen (zutatennr: 9001) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (9001, 1);

-- 20. Couscous (zutatennr: 6408) belongs to category "Glutenfrei" (kategorienr: 3)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (6408, 3);

-- 21. Gemüsebrühe (zutatennr: 7043) belongs to category "Vegan" (kategorienr: 1)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (7043, 1);

-- 22. Kichererbsen (zutatennr: 6300) belongs to category "Vegan" (kategorienr: 1) and "Glutenfrei" (kategorienr: 3)
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (6300, 1);
INSERT INTO zutatkategorie (zutatennr, kategorienr) VALUES (6300, 3);
