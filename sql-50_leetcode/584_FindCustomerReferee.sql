
-- Problem link - https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Customer (
    id INT,
    name VARCHAR(50),
    referee_id INT
);

INSERT INTO Customer (id, name, referee_id) VALUES
(1, 'Will', NULL),
(2, 'Jane', NULL),
(3, 'Alex', 2),
(4, 'Bill', NULL),
(5, 'Zack', 1),
(6, 'Mark', 2);

SELECT * FROM Customer;


-- main query
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;