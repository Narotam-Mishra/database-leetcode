
-- Problem link : https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Product table
CREATE TABLE Product2 (
    product_key INT PRIMARY KEY
);

-- Insert values into the Product table
INSERT INTO Product2 (product_key) VALUES
(5),
(6);

-- Create the Customer table
CREATE TABLE Customer2 (
    customer_id INT NOT NULL,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES Product2(product_key)
);

-- Insert values into the Customer table
INSERT INTO Customer2 (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);

SELECT * FROM Product2;

SELECT * FROM Customer2;

-- main query
-- Approach - 1
SELECT customer_id
FROM Customer2
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(product_key)
    FROM Product2
)


-- Approach - 2
SELECT customer_id
FROM Customer2 c
LEFT JOIN Product2 p
ON c.product_key = p.product_key
GROUP BY customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM Product2);