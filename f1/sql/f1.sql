\pset pager off

-- Crear el esquema solo una vez
CREATE SCHEMA IF NOT EXISTS ddbb;

BEGIN;

\echo 'creando la tabla circuits'
CREATE TABLE IF NOT EXISTS ddbb.circuits(
    circuitId       TEXT,
    circuitRef      TEXT,
    name            TEXT,
    location        TEXT,
    country         TEXT,
    lat             TEXT,
    lng             TEXT,
    alt             TEXT,
    url             TEXT
);

\echo 'creando la tabla constructors'
CREATE TABLE IF NOT EXISTS ddbb.constructors(
    constructorId   TEXT,
    constructorRef  TEXT,
    name            TEXT,
    nationality     TEXT,
    url             TEXT
);

\echo 'creando la tabla drivers'
CREATE TABLE IF NOT EXISTS ddbb.drivers(
    driverId        TEXT,
    driverRef       TEXT,
    number          TEXT,
    code            TEXT,
    forename        TEXT,
    surname         TEXT,
    dob             TEXT,
    nationality     TEXT,
    url             TEXT
);

\echo 'creando la tabla lap_times'
CREATE TABLE IF NOT EXISTS ddbb.lap_times(
    raceId          TEXT,
    driverId        TEXT,
    lap             TEXT,
    position        TEXT,
    time            TEXT,
    milliseconds    TEXT
);

\echo 'creando la tabla pit_stops'
CREATE TABLE IF NOT EXISTS ddbb.pit_stops(
    raceId          TEXT,
    driverId        TEXT,
    stop            TEXT,
    lap             TEXT,
    time            TEXT,
    duration        TEXT,
    milliseconds    TEXT
);

\echo 'creando la tabla qualifying'
CREATE TABLE IF NOT EXISTS ddbb.qualifying(
    qualifyId       TEXT,
    raceId          TEXT,
    driverId        TEXT,
    constructorId   TEXT,
    number          TEXT,
    position        TEXT,
    q1              TEXT,
    q2              TEXT,
    q3              TEXT
);

\echo 'creando la tabla races'
CREATE TABLE IF NOT EXISTS ddbb.races(
    raceId          TEXT,
    year            TEXT,
    round           TEXT,
    circuitId       TEXT,
    name            TEXT,
    date            TEXT,
    time            TEXT,
    url             TEXT,
    fp1_date        TEXT,
    fp1_time        TEXT,
    fp2_date        TEXT,
    fp2_time        TEXT,
    fp3_date        TEXT,
    fp3_time        TEXT,
    quali_date      TEXT,
    quali_time      TEXT,
    sprint_date     TEXT,
    sprint_time     TEXT
);

\echo 'creando la tabla results'
CREATE TABLE IF NOT EXISTS ddbb.results(
    resultados_id           TEXT,
    gpid                    TEXT,
    pilotoid                TEXT,
    escuderiaid             TEXT,
    número                  TEXT,
    pos_parrilla            TEXT,
    posición                TEXT,
    posicióntexto           TEXT,
    posiciónorden           TEXT,
    puntos                  TEXT,
    vueltas                 TEXT,
    tiempo                  TEXT,
    tiempomilsgs            TEXT,
    vueltarápida            TEXT,
    puesto_campeonato       TEXT,
    vueltarápida_tiempo     TEXT,
    vueltarápida_velocidad  TEXT,
    estadoid                TEXT
);

\echo 'creando la tabla seasons'
CREATE TABLE IF NOT EXISTS ddbb.seasons(
    year    TEXT,
    url     TEXT
);

\echo 'creando la tabla status'
CREATE TABLE IF NOT EXISTS ddbb.status(
    statusId    TEXT,
    status      TEXT
);

\echo 'Cargando datos'
\COPY ddbb.circuits    FROM f1/datos/circuits.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.constructors FROM f1/datos/constructors.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.drivers     FROM f1/datos/drivers.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.lap_times   FROM f1/datos/lap_times.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.pit_stops   FROM f1/datos/pit_stops.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.qualifying  FROM f1/datos/qualifying.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.races       FROM f1/datos/races.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.results     FROM f1/datos/results.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.seasons     FROM f1/datos/seasons.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');
\COPY ddbb.status      FROM f1/datos/status.csv WITH (FORMAT csv, HEADER, DELIMITER E',', NULL 'NULL', ENCODING 'UTF-8');

\echo "Mostrar cuantas circuits hay" 
SELECT count(*) as Número_de_circuits FROM ddbb.circuits;

\echo "Mostrar las circuits en país específico" 
SELECT * FROM ddbb.circuits WHERE country='Spain';

\echo "Mostrar cuantas constructors hay" 
SELECT count(*) as Número_de_constructors FROM ddbb.constructors;

\echo "Mostrar las constructors en país específico" 
SELECT * FROM ddbb.constructors WHERE nationality='Spanish';

\echo "Mostrar cuantas drivers hay" 
SELECT count(*) as Número_de_drivers FROM ddbb.drivers;

\echo "Mostrar las drivers en país específico" 
SELECT * FROM ddbb.drivers WHERE nationality='Spanish';

\echo "Mostrar cuantas lap_times hay" 
SELECT count(*) as Número_de_lap_times FROM ddbb.lap_times;

\echo "Mostrar las lap_times de un driver específico" 
SELECT * FROM ddbb.lap_times WHERE driverId='1';

\echo "Mostrar cuantas pit_stops hay" 
SELECT count(*) as Número_de_pit_stops FROM ddbb.pit_stops;

\echo "Mostrar las pit_stops de un driver específico" 
SELECT * FROM ddbb.pit_stops WHERE driverId='1';

\echo "Mostrar cuantas qualifying hay" 
SELECT count(*) as Número_de_qualifying FROM ddbb.qualifying;

\echo "Mostrar las qualifying de un driver específico" 
SELECT * FROM ddbb.qualifying WHERE driverId='1';

\echo "Mostrar cuantas races hay" 
SELECT count(*) as Número_de_races FROM ddbb.races;

\echo "Mostrar las races de un año específico" 
SELECT * FROM ddbb.races WHERE year='2009';

\echo "Mostrar cuantas results hay" 
SELECT count(*) as Número_de_results FROM ddbb.results;

\echo "Mostrar las results de un piloto específico" 
SELECT * FROM ddbb.results WHERE pilotoid='1';

\echo "Mostrar cuantas seasons hay" 
SELECT count(*) as Número_de_seasons FROM ddbb.seasons;

\echo "Mostrar las seasons de un año específico" 
SELECT * FROM ddbb.seasons WHERE year='2009';

\echo "Mostrar cuantas status hay" 
SELECT count(*) as Número_de_status FROM ddbb.status;

\echo "Mostrar las status 'Finished'" 
SELECT * FROM ddbb.status WHERE status='Finished';

ROLLBACK;  -- importante! permite correr el script múltiples veces
