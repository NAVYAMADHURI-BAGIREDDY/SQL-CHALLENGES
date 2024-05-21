CREATE TABLE ORDERS(
order_id int PRIMARY KEY,
orderDate DATE,
TotalAmount Decimal(10,2)
);

CREATE TABLE RETURNS(
return_id int primary key,
order_id int ,
foreign key(order_id) REFERENCES ORDERS(order_id)
);

INSERT INTO Orders(order_id, orderDate, TotalAmount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 200.75),
(3, '2023-02-28', 300.25),
(4, '2023-03-10', 180.00),
(5, '2023-04-05', 250.80);

INSERT INTO Returns (Return_ID, Order_ID) VALUES
(101, 2),
(102, 4),
(103, 5),
(104, 1),
(105, 3);

/*  Given the Orders table with columns OrderID, 
OrderDate, and TotalAmount, and the 
Returns table with columns ReturnID and OrderID, 
write an SQL query to calculate the total 
numbers of returned orders for each month
*/
select date_format(o.orderDate,'%Y-%M') as MONTH ,count(r.return_id)
from orders as o
inner join returns as r
on o.order_id= r.order_id
group by month;

select concat(extract(MONTH From orders.orderDate),'-',extract(year from orders.orderDate)) as month,count(returns.return_id)
from orders 
inner join returns 
on orders.order_id=returns.order_id
group by month;










