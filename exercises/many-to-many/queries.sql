-- ORDER by
-- It is important to know that it could be possible to order by multiple fields
-- and even set the order to the individual fields in particular.
select first_name, last_name, paid
from users
inner join orders on users.id = orders.user_id
ORDER by first_name ASC, last_name DESC

-- OFFSET & LIMIT
-- OFFSET - how many rows do you want to skip from the result.
-- LIMIT - how many rows to take from the result.

SELECT name FROM products 
ORDER BY price desc 
LIMIT 2 
OFFSET 1;


-- It is also posible to order by a calculeted value, like so. 
-- In this case the value used is "cost-effective" products 
-- And it is a UNION of the 4 most efective and the 4 less efective.
(
    SELECT name FROM products 
    ORDER BY price / weight desc 
    LIMIT 4
)
UNION
(
    SELECT name FROM products 
    ORDER BY price / weight ASC 
    LIMIT 4
);

