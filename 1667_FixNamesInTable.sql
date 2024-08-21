
-- Problem link : https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO Users (user_id, name)
VALUES 
(1, 'aLice'),
(2, 'bOB');

SELECT * FROM Users;

-- Apprroach - 1
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id;


-- Approach - 2
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, LENGTH(name) - 1))) as name
FROM Users
ORDER BY user_id;