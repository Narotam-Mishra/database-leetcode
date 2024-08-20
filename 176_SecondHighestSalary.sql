
-- Problem link : https://leetcode.com/problems/second-highest-salary/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);

-- Insert values into the Employee table
INSERT INTO Employee (id, salary)
VALUES
(1, 100),
(2, 200),
(3, 300);

DROP Table Employee;

SELECT * FROM Employee;

-- main query
-- Approach - 1
SELECT MAX(salary) as SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- Approach - 2
SELECT MAX(e1.salary) as SecondHighestSalary
FROM Employee e1 INNER JOIN Employee e2
ON e1.salary < e2.salary
