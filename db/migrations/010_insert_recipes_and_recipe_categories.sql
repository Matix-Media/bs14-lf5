/*
This script populates the `rezept` and `rezeptkategorie` tables with initial data.

### Details:
1. **`INSERT INTO rezept`**:
   Adds five recipes with attributes: name, description, servings, difficulty, and preparation time.

2. **`INSERT INTO rezeptkategorie`**:
   Links recipes to nutritional categories:
   - `Lachslasagne`: Bio, Protein-Reich
   - `Thaicurry mit Hähnchen`: Protein-Reich
   - `Kartoffelsuppe`: Vegetarisch, Glutenfrei
   - `Milchreis mit Apfelmus`: Vegetarisch, Glutenfrei
   - `Sommerlicher Couscous-Salat`: Vegan, Vegetarisch

### Purpose:
- Initializes recipe data with relevant nutritional categories for filtering and querying.
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

INSERT INTO rezeptkategorie (rezeptnr, kategorienr) VALUES
                                                        (1, 5),
                                                        (1, 6),
                                                        (2, 6),
                                                        (3, 2),
                                                        (3, 3),
                                                        (4, 2),
                                                        (4,3),
                                                        (5,1),
                                                        (5,2);
