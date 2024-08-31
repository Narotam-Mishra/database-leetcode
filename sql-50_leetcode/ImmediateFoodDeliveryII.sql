
-- Problem link : https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 2, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-12'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 3, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13'),
(7, 4, '2019-08-09', '2019-08-09');

SELECT * FROM Delivery;

-- main query
-- approach : 1
SELECT ROUND(SUM(IF(order_date = customer_pref_delivery_date, 1, 0)) * 100/ COUNT(DISTINCT(customer_id)), 2) AS immediate_percentage
FROM Delivery
WHERE(customer_id, order_date) IN(SELECT customer_id, MIN(order_date) AS first_order_date
FROM Delivery
GROUP BY customer_id);

-- approach : 2
WITH FirstOrders AS (
    SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
),
FirstOrderDetails AS (
    SELECT 
        d.customer_id, 
        d.order_date, 
        d.customer_pref_delivery_date
    FROM 
        Delivery d
    JOIN 
        FirstOrders f 
    ON 
        d.customer_id = f.customer_id 
    AND 
        d.order_date = f.first_order_date
),
ImmediateOrders AS (
    SELECT 
        COUNT(*) AS immediate_count
    FROM 
        FirstOrderDetails
    WHERE 
        order_date = customer_pref_delivery_date
),
TotalFirstOrders AS (
    SELECT 
        COUNT(*) AS total_count
    FROM 
        FirstOrderDetails
)
SELECT 
    ROUND((i.immediate_count / t.total_count) * 100, 2) AS immediate_percentage
FROM 
    ImmediateOrders i, TotalFirstOrders t;

