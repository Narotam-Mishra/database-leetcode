
-- Problem link : https://leetcode.com/problems/customers-who-never-order/description/

-- Create the Customers table
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Insert values into the Customers table
INSERT INTO Customers (id, name)
VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

-- Create the Orders table
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);

-- Insert values into the Orders table
INSERT INTO Orders (id, customerId)
VALUES
(1, 3),
(2, 1);

SELECT * FROM Customers;

SELECT * FROM Orders;

-- main query
SELECT c.name as Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;
