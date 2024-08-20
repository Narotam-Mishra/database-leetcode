
-- Problem link : https://leetcode.com/problems/department-top-three-salaries/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Department table
CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create the Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

-- Insert values into the Department table
INSERT INTO Department (id, name)
VALUES
    (1, 'IT'),
    (2, 'Sales');

-- Insert values into the Employee table
INSERT INTO Employee (id, name, salary, departmentId)
VALUES
    (1, 'Joe', 85000, 1),
    (2, 'Henry', 80000, 2),
    (3, 'Sam', 60000, 2),
    (4, 'Max', 90000, 1),
    (5, 'Janet', 69000, 1),
    (6, 'Randy', 85000, 1),
    (7, 'Will', 70000, 1);

DROP Table Department;
DROP Table Employee;

SELECT * FROM Department;
SELECT * FROM Employee

-- main query
SELECT
    d.name AS Department,
    e1.name AS Employee,
    e1.salary AS Salary
FROM Employee e1
    INNER JOIN Department d ON e1.departmentId = d.id
WHERE
    3 > (
        SELECT COUNT(DISTINCT (e2.salary))
        FROM Employee e2
        WHERE
            e2.Salary > e1.Salary
            AND e1.DepartmentId = e2.DepartmentId
    )