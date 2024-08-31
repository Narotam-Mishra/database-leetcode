
-- Problem link - https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Tweets table
CREATE TABLE Tweets (
    tweet_id INT,
    content VARCHAR(255)
);

-- Insert data into the Tweets table
INSERT INTO Tweets (tweet_id, content) VALUES
(1, 'Vote for Biden'),
(2, 'Let us make America great again!');

SELECT * FROM Tweets;

-- main query
-- Approach - 1
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;


-- Approach - 2
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;