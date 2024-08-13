
-- Problem link : https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    income INT
);

INSERT INTO Accounts (account_id, income) VALUES
(3, 108939),
(2, 12747),
(8, 87709),
(6, 91796);

SELECT * FROM Accounts;

-- main query
-- Approach - 1
SELECT "Low Salary" AS Category, COUNT(income) AS accounts_count
FROM Accounts
WHERE
    income < 20000
UNION
SELECT "Average Salary" AS Category, COUNT(income) AS accounts_count
FROM Accounts
WHERE
    income >= 20000
    AND income <= 50000
UNION
SELECT "High Salary" AS Category, COUNT(income) AS accounts_count
FROM Accounts
WHERE
    income > 50000;

-- Approach - 2
SELECT 
    'Low Salary' AS category,
    COUNT(*) AS accounts_count
FROM 
    Accounts
WHERE 
    income < 20000
UNION ALL
SELECT 
    'Average Salary' AS category,
    COUNT(*) AS accounts_count
FROM 
    Accounts
WHERE 
    income BETWEEN 20000 AND 50000
UNION ALL
SELECT 
    'High Salary' AS category,
    COUNT(*) AS accounts_count
FROM 
    Accounts
WHERE 
    income > 50000;
