

-- Create the orders table
CREATE TABLE orders3(
    order_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date DATE,
    product_id VARCHAR(10),
    quantity INT
);
-- Create the returns table
CREATE TABLE returns3(
    return_id VARCHAR(10),
    order_id VARCHAR(10)
    );
-- Insert sample records into the orders table
INSERT INTO orders3(order_id, customer_id, order_date, product_id, quantity)
VALUES
    ('1001', 'C001', '2023-01-15', 'P001', 4),
    ('1002', 'C001', '2023-02-20', 'P002', 3),
    ('1003', 'C002', '2023-03-10', 'P003', 8),
    ('1004', 'C003', '2023-04-05', 'P004', 2),
    ('1005', 'C004', '2023-05-20', 'P005', 3),
    ('1006', 'C002', '2023-06-15', 'P001', 6),
    ('1007', 'C003', '2023-07-20', 'P002', 1),
    ('1008', 'C004', '2023-08-10', 'P003', 2),
    ('1009', 'C005', '2023-09-05', 'P002', 3),
    ('1010', 'C001', '2023-10-20', 'P002', 1);
-- Insert sample records into the returns table
INSERT INTO returns3(return_id, order_id)
VALUES
    ('R001', '1001'),
    ('R002', '1002'),
    ('R003', '1005'),
    ('R004', '1008'),
    ('R005', '1007');
/*
Identify returning customers based on their order history. 
Categorize customers as "Returning" if they have placed more than one return, 
and as "New" otherwise. 
Considering you have two table orders has information about sale
and returns has information about returns 
*/
SELECT * FROM orders3;
SELECT * FROM returns3;
with subquery as(SELECT  customer_id ,count(return_id) as no_of_returns
FROM orders3 o 
left join returns3 r
on o.order_id=r.order_id
group by customer_id)
Select customer_id,
CASE 
    WHEN no_of_returns>1 THEN "Returning"
    ELSE "NEW"
END as customer_category
FROM subquery;


SELECT
    o.customer_id,
    COUNT(o.order_id) as total_orders,
    COUNT(return_id) as total_returns,
    CASE 
        WHEN COUNT(return_id) > 1 THEN 'Returning'
        ELSE 'New'
    END as customer_category
FROM orders as o
LEFT JOIN returns as r
ON o.order_id = r.order_id    
GROUP BY customer_id













