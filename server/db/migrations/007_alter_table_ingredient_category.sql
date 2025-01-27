/*
This migration modifies the table `zutat` to add a foreign key constraint on the column `kategorie`
which references the `kategorienr` column in the `ernaehrungskategorie` table.

Changes:
1. Ensures that the `kategorie` column in `zutat` correctly references `kategorienr` in `ernaehrungskategorie`.
2. Preserves existing data by ensuring that values in `kategorie` already match valid `kategorienr` values.
3. Adds the foreign key constraint ensuring referential integrity between `zutat` and `ernaehrungskategorie`.

Tables affected:
- zutat (kategorie)
*/

alter table zutat
alter column kategorie type int
using kategorie::integer,
add constraint fk_kategorienr foreign key (kategorie) references ernaehrungskategorie(kategorienr);