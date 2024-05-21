DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(100),
    email VARCHAR(100)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE orders2(
    order_id INT ,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);
-- Inserting sample customers
INSERT INTO customers (customer_id, name, email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Sam B', 'sb@example.com'),
(5, 'John Smith', 'j@example.com')	
;
-- Inserting sample orders
INSERT INTO orders2(order_id, customer_id, order_date, amount) VALUES
(1, 1, '2024-03-05', 50.00),
(2, 2, '2024-03-10', 75.00),
(5, 4, '2024-04-02', 45.00),
(5, 2, '2024-04-02', 45.00)	,
(3, 4, '2024-04-15', 100.00),
(4, 1, '2024-04-01', 60.00),
(5, 5, '2024-04-02', 45.00);

/*
Given tables customers (columns: customer_id, 
name, email) and orders (columns: order_id, 
customer_id, order_date, amount), 

Write an SQL query to find customers who 
haven't made any purchases in the last month, 
assuming today's date is April 2, 2024. 
*/
SELECT  * from customers;
select * from orders2;

Select * from customers 
where customer_id not in (
SELECT customer_id from orders2
where extract(month from order_date)=03 and extract(year from order_date)=extract(year from current_date));



SELECT 
	*
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders2
							WHERE EXTRACT(MONTH from order_date) 
							= EXTRACT(MONTH FROM current_date)-1 	
							AND 
							EXTRACT(YEAR FROM order_date) = 
							EXTRACT(YEAR FROM current_date)
							);

















