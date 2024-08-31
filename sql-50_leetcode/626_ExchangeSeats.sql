
-- Problem link : https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Seat table
CREATE TABLE Seat (
    id INT PRIMARY KEY,
    student VARCHAR(255)
);

-- Insert values into the Seat table
INSERT INTO Seat (id, student)
VALUES 
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');

SELECT * FROM Seat;

-- main query
SELECT
    CASE
        WHEN
            id = (SELECT MAX(id) FROM Seat) AND MOD(id, 2) = 1
            THEN id
        WHEN
            MOD(id, 2) = 1
            THEN id + 1
        ELSE
           id - 1
    END AS id, student
FROM Seat
ORDER BY id