
-- Problem link : https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50

-- Create Movies table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255)
);

-- Create Users table
CREATE TABLE Users1 (
    user_id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create MovieRating table
CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    PRIMARY KEY (movie_id, user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users1(user_id)
);

-- Insert values into Movies table
INSERT INTO Movies (movie_id, title) VALUES
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');

-- Insert values into Users table
INSERT INTO Users1 (user_id, name) VALUES
(1, 'Daniel'),
(2, 'Monica'),
(3, 'Maria'),
(4, 'James');

-- Insert values into MovieRating table
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(1, 4, 1, '2020-01-01'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(2, 3, 2, '2020-03-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');


SELECT * FROM MovieRating;


-- main query
-- Approach - 1
(
    SELECT name AS results
    FROM Users1
        INNER JOIN MovieRating USING (user_id)
    GROUP BY
        user_id
    ORDER BY COUNT(rating) DESC, name
    LIMIT 1
)
UNION ALL
(
    SELECT title AS results
    FROM Movies
        INNER JOIN MovieRating USING (movie_id)
    WHERE
        MONTH(created_at) = '02'
        AND YEAR(created_at) = '2020'
    GROUP BY
        title
    ORDER BY AVG(rating) DESC, title
    LIMIT 1
)

-- Approach - 2
(SELECT u.name as results
FROM Users1 u
    JOIN MovieRating mr ON u.user_id = mr.user_id
GROUP BY
    u.name
ORDER BY COUNT(mr.movie_id) DESC, u.name ASC
LIMIT 1)
UNION ALL
(SELECT m.title as results
FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
WHERE
    mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY
    m.title
ORDER BY AVG(mr.rating) DESC, m.title ASC
LIMIT 1);