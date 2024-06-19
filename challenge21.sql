-- Day 21/50 Days SQL Challenge
use sqlchallenge;
CREATE TABLE products21(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity_sold INT
);
-- Inserting sample data for products
INSERT INTO products21(product_id, product_name, price, quantity_sold) VALUES
    (1, 'iPhone', 899.00, 600),
    (2, 'iMac', 1299.00, 150),
    (3, 'MacBook Pro', 1499.00, 500),
    (4, 'AirPods', 499.00, 800),
    (5, 'Accessories', 199.00, 300);
/*
-- Question 
You have a table called products with below columns
product_id, product_name, price, qty 
Calculate the percentage contribution of each product 
to total revenue?
Round the result into 2 decimal
*/
select * ,round((price * quantity_sold)/(select sum(price*quantity_sold) from products21),2) as contribution
from products21;


