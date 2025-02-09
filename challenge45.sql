CREATE TABLE Orders45(
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_Date DATE,
    Amount DECIMAL(10, 2)
);
DROP TABLE IF EXISTS Customers45;
-- Create Customers table
CREATE TABLE Customers45(
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Join_Date DATE
);

-- Insert records into Orders table
INSERT INTO Orders45(Order_id, Customer_id, Order_Date, Amount)
VALUES
    (1, 1, '2024-05-01', 100),
    (2, 2, '2024-05-02', 150),
    (3, 3, '2023-12-15', 200),
    (4, 1, '2024-05-03', 120),
    (5, 2, '2024-01-20', 180),
    (6, 4, '2024-03-10', 90);

-- Insert records into Customers table
INSERT INTO Customers45(Customer_id, Customer_Name, Join_Date)
VALUES
    (1, 'Alice', '2024-01-15'),
    (2, 'Bob', '2024-02-20'),
    (3, 'Charlie', '2023-12-01'),
    (4, 'David', '2024-03-01');



/*
-- Amazon Data Analyst interview 
questions for exp 1-3 year!
You have two tables: Orders and Customers.

 - Orders Table Columns: 
Order_id, Customer_id, Order_Date, Amount

- Customers Table Columns: 
Customer_id, Customer_Name, Join_Date
 
Write an SQL query to calculate the total 
order amount for each customer who joined 
in the current year. 

The output should contain Customer_Name and 
the total amount.
*/
select * from Orders45;
select c.customer_id,c.customer_name,
sum(amount) as total 
from Customers45 c 
inner join orders45 o 
on c.customer_id = o.customer_id
where extract(year from order_date) = 2024
group by c.customer_name,c.customer_id;















