USE SQLCHALLENGE;
create table orders1(
  	category varchar(20),
	product varchar(20),
	user_id int , 
  	spend int,
  	transaction_date DATE
);

Insert into orders1 values
('appliance','refrigerator',165,246.00,'2021/12/26'),
('appliance','refrigerator',123,299.99,'2022/03/02'),
('appliance','washingmachine',123,219.80,'2022/03/02'),
('electronics','vacuum',178,152.00,'2022/04/05'),
('electronics','wirelessheadset',156,	249.90,'2022/07/08'),
('electronics','TV',145,189.00,'2022/07/15'),
('Television','TV',165,129.00,'2022/07/15'),
('Television','TV',163,129.00,'2022/07/15'),
('Television','TV',141,129.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','yoyo',165,129.00,'2022/07/15'),
('toys','yoyo',163,129.00,'2022/07/15'),
('toys','yoyo',141,129.00,'2022/07/15'),
('toys','yoyo',145,189.00,'2022/07/15'),
('electronics','vacuum',145,189.00,'2022/07/15');


SELECT * FROM orders1;
/*
Find the top 2 products in the top 2 categories based on spend amount?
*/

-- top 2 category based on spend 
-- top 2 product in above best 2 category
WITH ranking as (
SELECT * FROM (
SELECT SUM(spend) as spent,category,DENSE_RANK() OVER(ORDER BY SUM(SPEND) DESC) AS RANKING FROM ORDERS1
GROUP BY CATEGORY) AS SUBQUERY 
WHERE RANKING<=2 
)

select category,product,sum(spend) as amt,dense_rank() over(partition by orders1.category order by sum(spend) desc) as den
from orders1 
inner join ranking 
on ranking.category = orders1.category
group by orders1.category,orders1.product;


WITH ranked_category
AS
(
	SELECT
		category,
		total_spend_category
	FROM 
	(	SELECT 
			category,
			SUM(spend) as total_spend_category,
			DENSE_RANK() OVER( ORDER BY SUM(spend) DESC) drn
		FROM orders
		GROUP BY category
	) as subquery
	WHERE drn <= 2
)	

SELECT
	category,
	product,
	total_spend_by_product
FROM (	
		SELECT 
			o.category,
			o.product,
			SUM(o.spend) as total_spend_by_product,
			DENSE_RANK() OVER(PARTITION BY o.category ORDER BY SUM(o.spend) DESC ) as pdrn
		FROM orders1 as o
		JOIN ranked_category as rc
		ON rc.category = o.category	
		GROUP BY o.category, o.product
) subquery2
WHERE pdrn <= 2





