
-- Problem link : https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Employee4 (
    employee_id INT,
    department_id INT,
    primary_flag ENUM('Y', 'N'),
    PRIMARY KEY (employee_id, department_id)
);

INSERT INTO Employee4 (employee_id, department_id, primary_flag) VALUES
(1, 1, 'N'),
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');

SELECT * FROM Employee4;

-- main query
SELECT DISTINCT employee_id, department_id
FROM Employee4
WHERE employee_id IN(
    SELECT employee_id
    FROM Employee4
    GROUP BY employee_id
    HAVING COUNT(*) = 1
) OR primary_flag = 'Y'
ORDER BY employee_id

