/*
This script updates the `kunde` and `zutat` tables by adding new columns to enhance their data structure and provide additional information.

Details:
1. **Table: `kunde`**
   - Adds `datenschutzeinwilligung` (privacy consent):
     A boolean column to track whether the customer has provided consent for data protection purposes.
     Defaults to `false`.
   - Adds `letzteaktualisierung` (last update):
     A date column to record the last time the customer's information was updated.

Key Features:
- Default values ensure meaningful data for new records without requiring explicit input.
- Enhances table usability by supporting compliance tracking.
*/

ALTER TABLE kunde ADD COLUMN datenschutzeinwilligung BOOLEAN DEFAULT FALSE,
                  ADD COLUMN letzteaktualisierung DATE;

