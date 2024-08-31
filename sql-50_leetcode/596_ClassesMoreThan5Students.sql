
-- Problem link : https://leetcode.com/problems/classes-more-than-5-students/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Courses table
CREATE TABLE Courses (
    student VARCHAR(255),
    class VARCHAR(255),
    PRIMARY KEY (student, class)
);

-- Insert values into the Courses table
INSERT INTO Courses (student, class) VALUES
('A', 'Math'),
('B', 'English'),
('C', 'Math'),
('D', 'Biology'),
('E', 'Math'),
('F', 'Computer'),
('G', 'Math'),
('H', 'Math'),
('I', 'Math');


SELECT * FROM Courses;

-- main query
-- Approach - 1
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5;

-- Approach - 2
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
