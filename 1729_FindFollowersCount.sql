
-- Problem link : https://leetcode.com/problems/find-followers-count/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Followers table
CREATE TABLE Followers (
    user_id INT,
    follower_id INT,
    PRIMARY KEY (user_id, follower_id)
);

-- Insert values into the Followers table
INSERT INTO Followers (user_id, follower_id) VALUES
(0, 1),
(1, 0),
(2, 0),
(2, 1);

SELECT * FROM Followers;

-- main query
SELECT user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP BY
    user_id
ORDER BY user_id ASC;


SELECT user_id, COUNT(DISTINCT follower_id) as followers_count
from Followers
GROUP BY user_id