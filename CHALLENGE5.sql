DROP TABLE IF EXISTS PRODUCT;
CREATE TABLE Product(
product_id int primary key,
product_name VARCHAR(100),
category varchar(100),
price DECIMAL(10,2)
);

INSERT INTO Product(product_id,product_name, category, price) VALUES
(1,'Product A', 'Category 1', 10.00),
(2,'Product B', 'Category 2', 15.00),
(3,'Product C', 'Category 1', 20.00),
(4,'Product D', 'Category 3', 25.00);

CREATE TABLE SALES(
sale_id SERIAL PRIMARY KEY,
product_id int,
sale_date DATE,
quantity INT,
Foreign key (product_id) References product(product_id)
);

INSERT INTO Sales (product_id, sale_date, quantity) VALUES
(1, '2023-09-15', 5),
(2, '2023-10-20', 3),
(1, '2024-01-05', 2),
(3, '2024-02-10', 4),
(4, '2023-12-03', 1);


/*
Question

Write a SQL query to find all products that
haven't been sold in the last six months. 

Return the product_id, product_name, category, 
and price of these products.

*/
select * from product p
inner join sales s 
on p.product_id=s.product_id
where TIMESTAMPDIFF(month,'2024-05-15',sale_date) < 4;



