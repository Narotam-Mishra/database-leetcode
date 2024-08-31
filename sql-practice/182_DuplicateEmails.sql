
-- Problem link : https://leetcode.com/problems/duplicate-emails/description/

CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

INSERT INTO Person (id, email)
VALUES 
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

DROP Table Person;

SELECT * FROM Person;

-- main query
SELECT email as Email
FROM Person
GROUP BY email 
HAVING COUNT(email) > 1;