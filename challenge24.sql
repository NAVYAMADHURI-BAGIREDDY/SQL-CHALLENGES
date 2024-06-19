
CREATE TABLE orders24(
    id INT,
    cust_id INT,
    order_date DATE,
    order_details VARCHAR(50),
    total_order_cost INT
);
INSERT INTO orders24(id, cust_id, order_date, order_details, total_order_cost) VALUES
(1, 7, '2019-03-04', 'Coat', 100),
(2, 7, '2019-03-01', 'Shoes', 80),
(3, 3, '2019-03-07', 'Skirt', 30),
(4, 7, '2019-02-01', 'Coat', 25),
(5, 7, '2019-03-10', 'Shoes', 80),
(6, 1, '2019-02-01', 'Boats', 100),
(7, 2, '2019-01-11', 'Shirts', 60),
(8, 1, '2019-03-11', 'Slipper', 20),
(9, 15, '2019-03-01', 'Jeans', 80),
(10, 15, '2019-03-09', 'Shirts', 50),
(11, 5, '2019-02-01', 'Shoes', 80),
(12, 12, '2019-01-11', 'Shirts', 60),
(13, 1, '2019-03-11', 'Slipper', 20),
(14, 4, '2019-02-01', 'Shoes', 80),
(15, 4, '2019-01-11', 'Shirts', 60),
(16, 3, '2019-04-19', 'Shirts', 50),
(17, 7, '2019-04-19', 'Suit', 150),
(18, 15, '2019-04-19', 'Skirt', 30),
(19, 15, '2019-04-20', 'Dresses', 200),
(20, 12, '2019-01-11', 'Coat', 125),
(21, 7, '2019-04-01', 'Suit', 50),
(22, 3, '2019-04-02', 'Skirt', 30),
(23, 4, '2019-04-03', 'Dresses', 50),
(24, 2, '2019-04-04', 'Coat', 25),
(25, 7, '2019-04-19', 'Coat', 125);
/*
-- Calculate the total revenue from 
each customer in March 2019. 
Include only customers who 
were active in March 2019.
Output the revenue along with the 
customer id and sort the results based 
on the revenue in descending order.
*/
select *,extract(month from order_date)as month from orders24; 
SELECT 
    cust_id,
    SUM(total_order_cost) total_revenue
FROM orders24
WHERE order_date BETWEEN '2019-03-01' 
    AND '2019-03-31'
GROUP BY cust_id;


WITH ActiveInMarch AS (
    SELECT 
        cust_id
    FROM 
        orders24
    WHERE 
        order_date >= '2019-03-01' AND order_date < '2019-04-01'
    GROUP BY 
        cust_id
),
ActiveInApril AS (
    SELECT 
        cust_id
    FROM 
        orders24
    WHERE 
        order_date >= '2019-04-01' AND order_date < '2019-05-01'
    GROUP BY 
        cust_id
),
RevenueInMarch AS (
    SELECT 
        o.cust_id
        -- SUM(o.revenue) AS total_revenue
    FROM 
        orders24 o
    JOIN 
        ActiveInMarch am ON o.cust_id = am.cust_id
    LEFT JOIN 
        ActiveInApril aa ON o.cust_id = aa.cust_id
    WHERE 
        aa.cust_id IS NULL 
        AND o.order_date >= '2019-03-01' AND o.order_date < '2019-04-01'
    GROUP BY 
        o.cust_id
)


WITH ActiveInMarch AS (
    SELECT 
        customer_id
    FROM 
        orders24
    WHERE 
        order_date >= '2019-03-01' AND order_date < '2019-04-01'
    GROUP BY 
        customer_id
),
ActiveInApril AS (
    SELECT 
        customer_id
    FROM 
        orders24
    WHERE 
        order_date >= '2019-04-01' AND order_date < '2019-05-01'
    GROUP BY 
        customer_id
),
RevenueInMarch AS (
    SELECT 
        o.customer_id,
        SUM(o.revenue) AS total_revenue
    FROM 
        orders24 o
    JOIN 
        ActiveInMarch am ON o.customer_id = am.customer_id
    LEFT JOIN 
        ActiveInApril aa ON o.customer_id = aa.customer_id
    WHERE 
        aa.customer_id IS NULL -- Exclude customers active in April
        AND o.order_date >= '2019-03-01' AND o.order_date < '2019-04-01'
    GROUP BY 
        o.customer_id
)
SELECT 
    customer_id,
    total_revenue
FROM 
    RevenueInMarch
ORDER BY 
    total_revenue DESC;












