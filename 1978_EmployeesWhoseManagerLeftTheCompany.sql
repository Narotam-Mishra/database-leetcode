
-- Problem link : https://leetcode.com/problems/employees-whose-manager-left-the-company/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Employees4 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    salary INT
);

INSERT INTO Employees4 (employee_id, name, manager_id, salary) VALUES
(3, 'Mila', 9, 60301),
(12, 'Antonella', NULL, 31000),
(13, 'Emery', NULL, 67084),
(1, 'Kalel', 11, 21241),
(9, 'Mikaela', NULL, 50937),
(11, 'Joziah', 6, 28485);

SELECT * FROM Employees4;

-- main query
SELECT employee_id
FROM Employees4
WHERE
    salary < 30000
    AND manager_id NOT IN(
        SELECT employee_id
        FROM Employees4
    )
ORDER BY employee_id;