
-- Problem link : https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating FLOAT(3,2)
);

INSERT INTO Cinema (id, movie, description, rating) VALUES
(1, 'War', 'great 3D', 8.90),
(2, 'Science', 'fiction', 8.50),
(3, 'irish', 'boring', 6.20),
(4, 'Ice song', 'Fantacy', 8.60),
(5, 'House card', 'Interesting', 9.10);

SELECT * FROM Cinema;

-- main query
SELECT *
FROM Cinema
WHERE id%2 = 1 AND description != 'boring'
ORDER BY rating DESC;

