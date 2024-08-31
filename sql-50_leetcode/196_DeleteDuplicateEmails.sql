
-- Problem link : https://leetcode.com/problems/delete-duplicate-emails/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

INSERT INTO Person (id, email)
VALUES 
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

SELECT * FROM Person;

-- main query
-- Approach - 1
DELETE p1
FROM Person p1 INNER JOIN Person p2
WHERE p1.email = p2.email AND
p1.id > p2.id;



-- Approach - 2
DELETE p1
FROM Person p1
LEFT JOIN (
    SELECT MIN(id) AS id
    FROM Person
    GROUP BY email
) p2 ON p1.id = p2.id
WHERE p2.id IS NULL;
