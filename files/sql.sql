
create table if not exists public.cities
(
    id   bigserial,
    name varchar(255)
);

create table if not exists public.forecast
(
    id          bigserial,
    "cityId"    bigint,
    "dateTime"  bigint,
    temperature integer,
    summary     text
);

INSERT INTO cities (id, name) VALUES (1, 'Moscow');
INSERT INTO forecast (id, "cityId", "dateTime", temperature, summary) VALUES (1, 1, 18, 22, 'Not warm - not cold');
