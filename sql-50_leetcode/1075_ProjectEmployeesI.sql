
-- Problem link : https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Employee3 table
CREATE TABLE Employee3 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    experience_years INT NOT NULL
);

-- Insert values into the Employee3 table
INSERT INTO Employee3 (employee_id, name, experience_years)
VALUES
    (1, 'Khaled', 3),
    (2, 'Ali', 2),
    (3, 'John', 1),
    (4, 'Doe', 2);

-- Create the Project table
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee3(employee_id)
);

-- Insert values into the Project table
INSERT INTO Project (project_id, employee_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);

SELECT * FROM Employee3;

SELECT * FROM Project;


-- main query
SELECT p.project_id, ROUND(AVG(e.experience_years),2) as average_years
FROM Project p
LEFT JOIN Employee3 e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;
