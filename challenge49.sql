use sqlchallenge;
CREATE TABLE orders50(
    order_id SERIAL PRIMARY KEY,
    order_date DATE
);

-- Insert sample records for orders
INSERT INTO orders50(order_date)
VALUES
    ('2024-05-01'),
    ('2024-05-01'),
    ('2024-05-01'),
    ('2024-05-02'),
    ('2024-05-02'),
    ('2024-05-02'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06');

-- Display the records to verify


/*
-- Question:
You are given a orders table with
columns order_id, order_date

Identify the busiest day for orders along 
with the total number of orders placed on that day. 
*/


select * from orders50;

select count(*) as total_orders,order_date as busiest_day
from orders50
group by order_date
order by 1;


