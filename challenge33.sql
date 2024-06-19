CREATE TABLE fb_active_users33(
    user_id INT,
    name VARCHAR(50),
    status VARCHAR(10),
    country VARCHAR(50)
);
-- Insert records into fb_active_users
INSERT INTO fb_active_users33(user_id, name, status, country) VALUES
(33, 'Amanda Leon', 'open', 'Australia'),
(27, 'Jessica Farrell', 'open', 'Luxembourg'),
(18, 'Wanda Ramirez', 'open', 'USA'),
(50, 'Samuel Miller', 'closed', 'Brazil'),
(16, 'Jacob York', 'open', 'Australia'),
(25, 'Natasha Bradford', 'closed', 'USA'),
(34, 'Donald Ross', 'closed', 'China'),
(52, 'Michelle Jimenez', 'open', 'USA'),
(11, 'Theresa John', 'open', 'China'),
(37, 'Michael Turner', 'closed', 'Australia'),
(32, 'Catherine Hurst', 'closed', 'Mali'),
(61, 'Tina Turner', 'open', 'Luxembourg'),
(4, 'Ashley Sparks', 'open', 'China'),
(82, 'Jacob York', 'closed', 'USA'),
(87, 'David Taylor', 'closed', 'USA'),
(78, 'Zachary Anderson', 'open', 'China'),
(5, 'Tiger Leon', 'closed', 'China'),
(56, 'Theresa Weaver', 'closed', 'Brazil'),
(21, 'Tonya Johnson', 'closed', 'Mali'),
(89, 'Kyle Curry', 'closed', 'Mali'),
(7, 'Donald Jim', 'open', 'USA'),
(22, 'Michael Bone', 'open', 'Canada'),
(31, 'Sara Michaels', 'open', 'Denmark');
/*
-- Meta Data Analyst Question 
You have meta table with columns
user_id, name, status, country
Output share of US users that are active. 
Active users are the ones with an 
"open" status in the table.
Return total users and active users
and active users share for US
*/
select * from fb_active_users33;
select  
  (select count(*) as us_active_users from fb_active_users33
  where status = 'open' and country= 'USA'
   group by country) / count(*)  as us_active_users
from fb_active_users33
where status = 'open';


SELECT 
    COUNT(user_id) as total_users,
    SUM(
    CASE 
        WHEN status = 'open' THEN 1 
        ELSE 0
    END
    ) as active_users,
        SUM(
    CASE 
        WHEN status = 'open' THEN 1 
        ELSE 0
    END
    )/COUNT(user_id) * 100
    as share_of_active_users_US
    
FROM fb_active_users33
WHERE country = 'USA';







