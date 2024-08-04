
-- Problem link : https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Teacher table
CREATE TABLE Teacher (
    teacher_id INT,
    subject_id INT,
    dept_id INT,
    PRIMARY KEY (subject_id, dept_id)
);

-- Insert values into the Teacher table
INSERT INTO Teacher (teacher_id, subject_id, dept_id)
VALUES 
    (1, 2, 3),
    (1, 2, 4),
    (1, 3, 3),
    (2, 1, 1),
    (2, 2, 1),
    (2, 3, 1),
    (2, 4, 1);


SELECT * FROM Teacher;


-- main query
-- Approach - 1
SELECT DISTINCT (teacher_id),
    COUNT(DISTINCT (subject_id)) as cnt
FROM Teacher
GROUP BY
    teacher_id;

-- Approach - 2
SELECT teacher_id, COUNT(DISTINCT subject_id) as cnt
FROM Teacher
GROUP BY
    teacher_id;