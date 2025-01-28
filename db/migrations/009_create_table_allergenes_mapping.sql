CREATE TABLE allergen (
    allergennr INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    beschreibung TEXT
);

CREATE TABLE zutatallergen (
    zutatennr INTEGER,
    allergennr INTEGER,
    PRIMARY KEY (zutatennr, allergennr),
    FOREIGN KEY (zutatennr) REFERENCES zutat(zutatennr),
    FOREIGN KEY (allergennr) REFERENCES allergen(allergennr)
);

INSERT INTO allergen (name)
VALUES
  ('Laktose'),
  ('Weizen'),
  ('Gluten'),
  ('Stärke'),
  ('Karotte'),
  ('Milcheiweiß'),
  ('Erdnuss'),
  ('Ei'),
  ('Tomate');
