
-- Problem link : https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Product table
CREATE TABLE Product3 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

-- Insert values into the Product table
INSERT INTO Product3 (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

-- Create the Sales table
CREATE TABLE Sales3 (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert values into the Sales table
INSERT INTO Sales3 (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

SELECT * FROM Product3

SELECT * FROM Sales3

-- main query
-- Approach - 1
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales3
WHERE (product_id, year) IN (
        SELECT product_id, MIN(year) AS f_year
        FROM Sales3
        GROUP BY product_id
    )


-- Approach - 2
SELECT s.product_id, s.year as first_year, s.quantity, s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) first_sale ON s.product_id = first_sale.product_id AND s.year = first_sale.first_year;

