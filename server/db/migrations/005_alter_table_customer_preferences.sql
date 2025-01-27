alter table kunde add column datenschutzeinwilligung boolean default false,
                  add column letzteaktualisierung date;

alter table zutat add column kategorie varchar(50),
                  add column bio boolean default true,
                  add column vegan boolean default false;
