create table rezept (
    rezeptnr integer primary key generated always as identity,
    name varchar(100) not null,
    beschreibung text,
    portionen integer,
    schwierigkeitsgrad varchar(20),
    zubereitungszeit integer,
    erstelltam timestamp default current_timestamp
);

create table rezeptzutat (
    rezeptnr integer,
    zutatennr integer,
    menge integer,
    einheit varchar(25),
    primary key (rezeptnr, zutatennr),
    foreign key (rezeptnr) references rezept(rezeptnr),
    foreign key (zutatennr) references zutat(zutatennr)
);

create table ernaehrungskategorie (
    kategorienr integer primary key generated always as identity,
    name varchar(50) not null,
    beschreibung text
);
