/*
This script updates the `kunde` and `zutat` tables by adding new columns to enhance their data structure and provide additional information.

Details:
1. **Table: `kunde`**
   - Adds `datenschutzeinwilligung` (privacy consent):
     A boolean column to track whether the customer has provided consent for data protection purposes.
     Defaults to `false`.
   - Adds `letzteaktualisierung` (last update):
     A date column to record the last time the customer's information was updated.

2. **Table: `zutat`**
   - Adds `kategorie` (category):
     A `varchar(50)` column to classify ingredients into categories (e.g., "Spices", "Dairy").
   - Adds `bio` (organic):
     A boolean column to indicate if the ingredient is organic.
     Defaults to `true`.
   - Adds `vegan`:
     A boolean column to specify whether the ingredient is vegan-friendly.
     Defaults to `false`.

Key Features:
- Default values ensure meaningful data for new records without requiring explicit input.
- Enhances table usability by supporting categorization and compliance tracking.
*/

alter table kunde add column datenschutzeinwilligung boolean default false,
                  add column letzteaktualisierung date;

alter table zutat add column kategorie varchar(50),
                  add column bio boolean default true,
                  add column vegan boolean default false;
