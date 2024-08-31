
-- Problem link : https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Triangle (
    x INT,
    y INT,
    z INT,
    PRIMARY KEY (x, y, z)
);

INSERT INTO Triangle (x, y, z) VALUES (13, 15, 30)
INSERT INTO Triangle (x, y, z) VALUES (10, 20, 15);

SELECT * FROM Triangle;


-- main query
SELECT *,
    IF(x+y>z AND x+z>y AND y+z>x, "Yes", "No") as triangle
FROM Triangle;
