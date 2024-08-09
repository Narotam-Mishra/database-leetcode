
-- Problem link : https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Employees3 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    reports_to INT,
    age INT,
    FOREIGN KEY (reports_to) REFERENCES Employees3(employee_id)
);

INSERT INTO Employees3 (employee_id, name, reports_to, age) VALUES
(1, 'Alice', NULL, 45),
(2, 'Bob', 1, 38),
(3, 'Charlie', 1, 33),
(4, 'David', 2, 29),
(5, 'Eva', 3, 25),
(6, 'Frank', 2, 40);

SELECT * FROM Employee3;


-- main query
SELECT
    e1.employee_id,
    e1.name,
    COUNT(e2.employee_id) as reports_count,
    ROUND(AVG(e2.age)) as average_age
FROM Employees3 e1
    INNER JOIN Employees3 e2 ON e1.employee_id = e2.reports_to
GROUP BY
    e1.employee_id,
    e1.name
ORDER BY employee_id