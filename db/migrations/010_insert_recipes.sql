/*
This script inserts data into the `rezept` table, providing initial records for various recipes with detailed attributes.

Details:
- **Columns**:
  - `name`: The name of the recipe.
  - `beschreibung`: A brief description of the dish.
  - `portionen`: Number of servings the recipe yields.
  - `schwierigkeitsgrad`: The difficulty level of preparation.
  - `zubereitungszeit`: The total preparation and cooking time in minutes.

- **Inserted Recipes**:
  1. `Lachslasagne`: Spinach and salmon lasagna with Bechamel sauce.
  2. `Thaicurry mit Hähnchen`: Thai curry with chicken, vegetables, and rice.
  3. `Kartoffelsuppe`: Creamy potato soup with optional sausages.
  4. `Milchreis mit Apfelmus`: Sweet rice pudding served with applesauce.
  5. `Sommerlicher Couscous-Salat`: Light couscous salad with fresh vegetables and herbs.

Purpose:
- Initializes the `rezept` table with diverse recipes to support further relational data, such as ingredients and nutritional categories.
- Facilitates testing and development of recipe-related queries in the database.
*/

INSERT INTO rezept (name, beschreibung, portionen, schwierigkeitsgrad, zubereitungszeit)
VALUES
    ('Lachslasagne',
     'Spinat-Lachs-Lasagne mit Bechamel-Soße und Parmesan, geschichtet mit Lasagneplatten.',
     4,
     'Mittel',
     45),

    ('Thaicurry mit Hähnchen',
     'Hähnchenstreifen und Gemüse in Kokosmilch mit grüner Currypaste, serviert mit Reis.',
     4,
     'Einfach',
     30),

    ('Kartoffelsuppe',
     'Cremige Suppe aus Kartoffeln, Karotten und Lauch, mit Wiener Würstchen.',
     4,
     'Einfach',
     20),

    ('Milchreis mit Apfelmus',
     'Süßer Milchreis mit Vanillezucker, serviert mit Apfelmus.',
     4,
     'Einfach',
     30),

    ('Sommerlicher Couscous-Salat',
     'Leichter Couscous-Salat mit frischem Gemüse und Kräutern.',
     4,
     'Einfach',
     15);
