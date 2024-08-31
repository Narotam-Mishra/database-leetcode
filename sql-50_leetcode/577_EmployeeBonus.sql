
-- Problem link : https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Employee2 (
    empId INT PRIMARY KEY,
    name VARCHAR(255),
    supervisor INT,
    salary INT,
    FOREIGN KEY (supervisor) REFERENCES Employee2(empId)
);

INSERT INTO Employee2 (empId, name, supervisor, salary) VALUES
(3, 'Brad', NULL, 4000),
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(4, 'Thomas', 3, 4000);

CREATE TABLE Bonus (
    empId INT PRIMARY KEY,
    bonus INT,
    FOREIGN KEY (empId) REFERENCES Employee2(empId)
);

INSERT INTO Bonus (empId, bonus) VALUES
(2, 500),
(4, 2000);

SELECT * FROM Employee2;

SELECT * FROM Bonus;


-- main query
SELECT e1.name, b1.bonus
FROM Employee2 e1
LEFT JOIN Bonus b1
ON e1.empId = b1.empId
WHERE b1.bonus < 1000 OR b1.bonus IS  NULL;