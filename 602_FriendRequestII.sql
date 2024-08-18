
-- Problem link : https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the RequestAccepted table
CREATE TABLE RequestAccepted (
    requester_id INT,
    accepter_id INT,
    accept_date DATE,
    PRIMARY KEY (requester_id, accepter_id)
);

-- Insert values into the RequestAccepted table
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');

SELECT * FROM RequestAccepted

-- main query
-- Approach - 1
SELECT id, COUNT(*) as num
FROM (
        SELECT requester_id AS id
        FROM RequestAccepted
        UNION ALL
        SELECT accepter_id
        FROM RequestAccepted
    ) as friend_count
GROUP BY id
ORDER BY num DESC
LIMIT 1;

-- Approach - 2
WITH CombinedFriends AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT id, COUNT(*) AS num
FROM CombinedFriends
GROUP BY id
ORDER BY num DESC
LIMIT 1;
