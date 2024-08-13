
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
