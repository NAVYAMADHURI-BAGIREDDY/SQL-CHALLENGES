use sqlchallenge;
CREATE TABLE customers14(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100)
);
CREATE TABLE orders14(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers14(customer_id, customer_name, customer_email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Bob Brown', 'bob@example.com');
INSERT INTO orders14(order_id, customer_id, order_date, order_amount) VALUES
(1, 1, '2024-01-03', 50.00),
(2, 2, '2024-01-05', 75.00),
(3, 1, '2024-01-10', 25.00),
(4, 3, '2024-01-15', 60.00),
(5, 2, '2024-01-20', 50.00),
(6, 1, '2024-02-01', 100.00),
(7, 2, '2024-02-05', 25.00),
(8, 3, '2024-02-10', 90.00),
(9, 1, '2024-02-15', 50.00),
(10, 2, '2024-02-20', 75.00);
/*
You are given two tables: orders and customers. 
The orders table contains information about orders placed by customers, including the order_id, customer_id, order_date, and order_amount. 
The customers table contains information about customers, 
including the customer_id, customer_name, and customer_email.
-- Find the top 2 customers who have spent the most money across all their orders. 
Return their names, emails, and total amounts spent.
*/
with ranking as (select customer_id,sum(order_amount)as amount_spent from orders14
group by customer_id)
select * from ranking c
inner join customers14 o on 
c.customer_id = o.customer_id 
limit 2;


