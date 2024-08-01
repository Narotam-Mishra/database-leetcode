
-- Problem link : https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Queries (
    query_name VARCHAR(255),
    result VARCHAR(255),
    position INT,
    rating INT
);

INSERT INTO Queries (query_name, result, position, rating) VALUES
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);

SELECT * FROM Queries;


-- main query
-- Approach - 1
SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(IF(rating < 3, 1, 0)) * 100, 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY
    query_name;


-- Approach - 2
SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(
        (SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
    ) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY
    query_name;