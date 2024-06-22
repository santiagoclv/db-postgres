
-- Fetch the data
SELECT url, url, id FROM photos;

-- Calculated Fields - (This is not a real example, because there are better ways to calculate average)

SELECT username, (SELECT SUM(age) FROM users) / (select COUNT(id) from users) AS age_average
FROM users;

-- Functions over fields

SELECT UPPER(CONCAT(id, ', ', username)) as fullname FROM users;

-- Filters using where
-- First is executed: FROM
-- Second is executed: WHERE (BETWEEN x AND y, IN(), NOT IN(), =, AND, OR)
-- Third is executed: SELECT

SELECT username FROM users WHERE id < 800;

--- Update data

UPDATE users SET username = 'Roberto' WHERE id = 2;

--- Delete data

DELETE FROM users WHERE id = 2;


-- Join - Fetch comments for every photo
-- On table name collision, it is required to give aliases to the tables.

select c.contents, p.url
from "comments" c 
join photos p on c.photo_id = p.id;

-- Group By - Count the amount of comments that every photo has
-- the left join is important, if not, only the photos with comments will be have a count value.
SELECT p.url , count(p.id)
FROM photos p
LEFT JOIN comments c on c.photo_id = p.id
group by p.id;