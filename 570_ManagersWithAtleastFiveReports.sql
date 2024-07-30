
-- Problem link : https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT,
    FOREIGN KEY (managerId) REFERENCES Employee(id)
);

INSERT INTO Employee (id, name, department, managerId)
VALUES
    (101, 'John', 'A', NULL),
    (102, 'Dan', 'A', 101),
    (103, 'James', 'A', 101),
    (104, 'Amy', 'A', 101),
    (105, 'Anne', 'A', 101),
    (106, 'Ron', 'B', 101);

SELECT * FROM Employee;


-- main query
SELECT e1.name
FROM Employee e1
INNER JOIN Employee e2
ON e1.id = e2.managerId
GROUP BY e2.managerId
HAVING COUNT(e2.managerId) >= 5;

SELECT name
FROM Employee
WHERE
    id in (
        SELECT DISTINCT (managerId)
        FROM Employee
        GROUP BY
            managerId
        HAVING
            COUNT(managerId) >= 5
    );