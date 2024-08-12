
-- Problem link : https://leetcode.com/problems/product-price-at-a-given-date/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Products2 (
    product_id INT,
    new_price INT,
    change_date DATE,
    PRIMARY KEY (product_id, change_date)
);

INSERT INTO Products2 (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');

SELECT * FROM Products2;

-- main query
-- Approach - 1
SELECT product_id, new_price AS price
FROM Products2
WHERE (product_id, change_date) IN(
    SELECT product_id, MAX(change_date)
    FROM Products2
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
UNION
SELECT product_id, 10 as price
FROM Products2
WHERE product_id NOT IN(
    SELECT product_id
    FROM Products2
    WHERE change_date <= '2019-08-16'
)

-- Approach - 2
SELECT p.product_id, 
       COALESCE(latest.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products2
) AS p
LEFT JOIN (
    SELECT product_id, new_price
    FROM Products2
    WHERE (product_id, change_date) IN (
        SELECT product_id, MAX(change_date)
        FROM Products2
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    )
) AS latest
ON p.product_id = latest.product_id;
