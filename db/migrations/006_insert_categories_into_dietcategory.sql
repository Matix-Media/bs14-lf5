/*
This script inserts predefined nutritional categories into the `ernaehrungskategorie` table, providing a foundation for classifying recipes or ingredients based on dietary preferences and needs.

Details:
1. **Table: `ernaehrungskategorie`**
   - Each row represents a nutritional category with a name (`NAME`) and description (`BESCHREIBUNG`).

2. **Inserted Categories:**
   - `Vegan`: Products suitable for a vegan diet.
   - `Vegetarisch`: Products suitable for a vegetarian diet.
   - `Glutenfrei`: Products free from gluten.
   - `Low-Carb`: Products low in carbohydrates.
   - `Protein-Reich`: Products rich in protein.

Purpose:
- Provides initial data to support categorization and filtering in applications that use the `ernaehrungskategorie` table.
- Facilitates quick implementation of dietary filters for users.
*/

INSERT INTO ERNAEHRUNGSKATEGORIE (NAME, BESCHREIBUNG) VALUES
                                                          ('Vegan', 'Vegane Produkte'),
                                                          ('Vegetarisch', 'Vegetarische Produkte'),
                                                          ('Glutenfrei', 'Glutenfreie Produkte'),
                                                          ('Low-Carb', 'Low-Carb'),
                                                          ('Bio', 'Bio'),
                                                          ('Protein-Reich', 'Proteinreiche Produkte');
