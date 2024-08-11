
-- Problem link : https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num VARCHAR(255)
);

INSERT INTO Logs (num) VALUES
('1'),
('1'),
('1'),
('2'),
('1'),
('2'),
('2');

SELECT * FROM Logs;

-- main query
-- Approach - 1
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id = l2.id - 1 AND l2.id = l3.id - 1
AND l1.num = l2.num AND l2.num = l3.num;

-- Approach - 2
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1 AND l1.num = l2.num
JOIN Logs l3 ON l2.id = l3.id - 1 AND l2.num = l3.num;
