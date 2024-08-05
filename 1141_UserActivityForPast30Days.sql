
-- Problem link : https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50

CREATE TABLE Activity2 (
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type ENUM('open_session', 'end_session', 'scroll_down', 'send_message')
);

INSERT INTO Activity2 (user_id, session_id, activity_date, activity_type) VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

SELECT * FROM Activity2;

-- main query
-- Approach - 1
SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
FROM Activity2
WHERE
    activity_date >= '2019-06-28'
    AND activity_date <= '2019-07-27'
GROUP BY
    activity_date

-- Approach - 2
SELECT activity_date, COUNT(DISTINCT user_id) AS active_user_count
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;