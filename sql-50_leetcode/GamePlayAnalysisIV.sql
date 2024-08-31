
-- Problem link : https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the Activity table
CREATE TABLE Activity1 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

-- Insert values into the Activity table
INSERT INTO Activity1 (player_id, device_id, event_date, games_played)
VALUES 
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

SELECT * FROM Activity1;

-- main query
-- Approach - 1
SELECT ROUND(
        COUNT(DISTINCT player_id) / (
            SELECT COUNT(DISTINCT player_id)
            FROM Activity1
        ), 2
    ) AS fraction
FROM Activity1
WHERE (
        player_id,
        DATE_SUB(event_date, INTERVAL 1 DAY)
    ) IN (
        SELECT player_id, MIN(event_date) as first_login
        FROM Activity1
        GROUP BY
            player_id
    )


-- Approach - 2
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity1
    GROUP BY player_id
),
NextDayLogin AS (
    SELECT a.player_id
    FROM Activity1 a
    JOIN FirstLogin fl
    ON a.player_id = fl.player_id
    WHERE a.event_date = DATE_ADD(fl.first_login_date, INTERVAL 1 DAY)
)
SELECT 
    ROUND(COUNT(DISTINCT ndl.player_id) / COUNT(DISTINCT fl.player_id), 2) AS fraction
FROM 
    FirstLogin fl
LEFT JOIN 
    NextDayLogin ndl ON fl.player_id = ndl.player_id;
