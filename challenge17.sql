Drop table customers17;
-- Creating the Customers table
CREATE TABLE Customers17(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
-- Creating the Purchases table
Drop table purchases17;
CREATE TABLE Purchases17(
    purchase_id INT PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers17(customer_id)
);

-- Inserting sample data into Customers table
INSERT INTO Customers17(customer_id, customer_name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie'),
    (4, 'David'),
    (5, 'Emma');

-- Inserting sample data into Purchases table
INSERT INTO Purchases17(purchase_id, customer_id, product_category) VALUES
    (101, 1, 'Electronics'),
    (102, 1, 'Books'),
    (103, 1, 'Clothing'),
    (104, 1, 'Electronics'),
    (105, 2, 'Clothing'),
    (106, 1, 'Beauty'),
    (107, 3, 'Electronics'),
    (108, 3, 'Books'),
    (109, 4, 'Books'),
    (110, 4, 'Clothing'),
    (111, 4, 'Beauty'),
    (112, 5, 'Electronics'),
    (113, 5, 'Books');
/*
Question:
Write an SQL query to find customers who have made 
purchases in all product categories.
Tables:
Customers: customer_id (INT), customer_name (VARCHAR)
Purchases: purchase_id (INT), customer_id (INT), 
Product_category (VARCHAR)
Your query should return the customer_id and 
customer_name of these customers.
*/
select distinct product_category from purchases17;
select c.customer_id,c.customer_name,count(distinct p.product_category) from customers17 c
inner join purchases17 p
on p.customer_id=c.customer_id
group by c.customer_id,c.customer_name
having count(distinct p.product_category)= (select count(distinct product_category) from purchases17) ;


