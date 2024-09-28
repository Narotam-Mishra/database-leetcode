

-- Creating the Posts table
CREATE TABLE Posts (
    ID INT PRIMARY KEY AUTO_INCREMENT,          -- Unique ID for each post, auto-incremented
    Content TEXT NOT NULL,          -- Text content of the post
    User_ID INT NOT NULL,           -- ID of the user who created the post
    Created_At TIMESTAMP NOT NULL   -- Timestamp when the post was created
);

-- Inserting dummy data with detailed logging for debugging
INSERT INTO Posts (Content, User_ID, Created_At) VALUES
('This is the first post', 101, '2023-09-14 12:00:00'),
('This is the second post', 102, '2023-09-14 12:05:00');

SELECT * FROM Posts;
