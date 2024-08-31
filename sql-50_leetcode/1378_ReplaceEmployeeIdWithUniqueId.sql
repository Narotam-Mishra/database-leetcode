
-- Problem link : https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE EmployeeUNI (
    id INT,
    unique_id INT,
    PRIMARY KEY (id, unique_id)
);

-- Insert data into Employees table
INSERT INTO Employees1 (id, name) VALUES
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');

-- Insert data into EmployeeUNI table
INSERT INTO EmployeeUNI (id, unique_id) VALUES
(3, 1),
(11, 2),
(90, 3);

SELECT * FROM Employees1

SELECT * FROM EmployeeUNI;

-- main query
SELECT eu.unique_id AS unique_id, e.name AS name
FROM Employees1 e 
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;