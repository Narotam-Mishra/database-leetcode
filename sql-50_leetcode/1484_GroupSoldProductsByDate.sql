
-- Problem link : https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(255)
);

INSERT INTO Activities (sell_date, product)
VALUES 
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');

SELECT * FROM Activities;

-- main query
-- Approach - 1
SELECT
    sell_date,
    COUNT(DISTINCT (product)) as num_sold,
    GROUP_CONCAT(
        DISTINCT product
        ORDER BY product SEPARATOR ','
    ) as products
FROM Activities
GROUP BY
    sell_date
ORDER BY sell_date, product;

-- Approach - 2
SELECT a.sell_date,
       COUNT(DISTINCT a.product) AS num_sold,
       GROUP_CONCAT(DISTINCT b.product ORDER BY b.product SEPARATOR ',') AS products
FROM Activities a
JOIN Activities b
ON a.sell_date = b.sell_date
GROUP BY a.sell_date
ORDER BY a.sell_date;
