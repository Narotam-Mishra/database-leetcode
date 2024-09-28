
-- Problem link : https://leetcode.com/problems/employees-earning-more-than-their-managers/description/?envType=problem-list-v2&envId=database

drop table Employee;

-- Step 1: Create the Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    managerId INT
);

-- Step 2: Insert the given data into the Employee table
INSERT INTO Employee (id, name, salary, managerId)
VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);

SELECT * FROM Employee;

SELECT name from Employee;

-- main query
SELECT e.name as Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;