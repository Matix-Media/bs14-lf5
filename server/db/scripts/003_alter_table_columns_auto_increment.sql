ALTER TABLE kunde
ALTER kundennr ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE lieferant
ALTER lieferantennr ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE zutat
ALTER zutatennr ADD GENERATED ALWAYS AS IDENTITY;

SELECT
    SETVAL (
        SELECT
            pg_get_serial_sequence ('kunde', 'kundennr'),
            (
                SELECT
                    max(kundennr)
                FROM
                    kunde
            ),
            true
    );

SELECT
    SETVAL (
        (
            SELECT
                pg_get_serial_sequence ('lieferant', 'lieferantennr')
        ),
        (
            SELECT
                max(lieferantennr)
            FROM
                lieferant
        ),
        true
    );

SELECT
    SETVAL (
        (
            SELECT
                pg_get_serial_sequence ('zutat', 'zutatennr')
        ),
        (
            SELECT
                max(zutatennr)
            FROM
                zutat
        ),
        true
    );