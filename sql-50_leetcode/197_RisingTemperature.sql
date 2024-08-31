
-- Problem link : https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

/*
The SQL query uses a self-join to compare rows within the same table, Weather, to find specific conditions. In this case, the goal is to find records where the temperature increased from one day to the next.
*/

CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE NOT NULL,
    temperature INT
);


INSERT INTO Weather (id, recordDate, temperature)
VALUES 
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

SELECT * FROM Weather;

-- main query
SELECT w1.id
FROM Weather w1
INNER JOIN Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1
AND w1.temperature > w2.temperature;


SELECT w1.id
FROM Weather w1
INNER JOIN Weather w2 ON w2.recordDate = SUBDATE(w1.recordDate, 1)
WHERE w1.temperature > w2.temperature;