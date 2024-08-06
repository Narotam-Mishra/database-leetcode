
-- Problem link : https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the MyNumbers table
CREATE TABLE MyNumbers (
    num INT
);

-- Insert values into the MyNumbers table
INSERT INTO MyNumbers (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

SELECT * FROM MyNumbers;

-- main query
SELECT max(num) as num
FROM MyNumbers
WHERE num IN (
        SELECT num
        FROM MyNumbers
        GROUP BY num 
        HAVING COUNT(num) = 1
    );