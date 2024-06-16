-- create data base
CREATE DATABASE maps
    WITH
    ENCODING = 'UTF8';

-- create a table, with and ID autogenerated that is also the Primary Key
CREATE TABLE cities (
    id SERIAL primary KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);

-- create table that contains photos of the cities, related to cities on many-to-one
CREATE TABLE photos (
    id SERIAL PRIMARY key,
    url VARCHAR(200),
    city_id INTEGER REFERENCES cities(id) ON DELETE CASCADE
);

-- Add data to the table

INSERT INTO cities(name, country, population, area)
VALUES
('Tokio', 'Japan', 500, 2),
('Paris', 'Francia', 200, 2),
('Montevideo', 'Uruguay', 50, 1);

INSERT INTO photos(url, city_id)
VALUES 
('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tokyo_Tower_20190406.jpg/400px-Tokyo_Tower_20190406.jpg',1),
('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Shinjuku_central_park_southwest.jpg/800px-Shinjuku_central_park_southwest.jpg', 1), 
('https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Temple_Complex_at_Asakusa_Kannon_%2811920461243%29.jpg/1920px-Temple_Complex_at_Asakusa_Kannon_%2811920461243%29.jpg', 1);

-- Fetch the data

SELECT name, name, country FROM cities;

-- Calculated Fields

SELECT name, population / area AS density  FROM cities;

-- Functions over fields

SELECT UPPER(CONCAT(name, ', ', country)) as Location FROM cities;

-- Filters using where
-- First is executed: FROM
-- Second is executed: WHERE (BETWEEN x AND y, IN(), NOT IN(), =, AND, OR)
-- Third is executed: SELECT

SELECT name FROM cities WHERE population < 800;

--- Update data

UPDATE cities SET population = 9000 WHERE name = 'Tokio';

--- Delete data

DELETE FROM cities WHERE name = 'Tokio';


-- Join - Fetch the photos where name is tokio

SELECT p.url
FROM cities c
JOIN photos p on p.city_id = c.id 
where c.name = 'Tokio';

-- Group By - Count the amount of photos that every city has
-- the left join is important, if not, only the cities with photos will be have a count value.
SELECT c.name, count(p.id)
FROM cities c
LEFT JOIN photos p on p.city_id = c.id
group by c.id;