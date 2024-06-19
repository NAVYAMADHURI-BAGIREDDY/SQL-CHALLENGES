
CREATE TABLE Delivery22(
    delivery_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);
-- Insert data into the Delivery table
INSERT INTO Delivery22(customer_id, order_date, customer_pref_delivery_date) VALUES
(1, '2019-08-01', '2019-08-02'),
(2, '2019-08-02', '2019-08-02'),
(1, '2019-08-11', '2019-08-12'),
(3, '2019-08-24', '2019-08-24'),
(3, '2019-08-21', '2019-08-22'),
(2, '2019-08-11', '2019-08-13'),
(4, '2019-08-09', '2019-08-09'),
(5, '2019-08-09', '2019-08-10'),
(4, '2019-08-10', '2019-08-12'),
(6, '2019-08-09', '2019-08-11'),
(7, '2019-08-12', '2019-08-13'),
(8, '2019-08-13', '2019-08-13'),
(9, '2019-08-11', '2019-08-12');    
/*
-- Question
You have dataset of a food delivery company
with columns order_id, customer_id, order_date, 
pref_delivery_date
If the customer's preferred delivery date is 
the same as the order date, then the order is 
called immediate; otherwise, it is called scheduled.
Write a solution to find the percentage of immediate
orders in the first orders of all customers, 
rounded to 2 decimal places.
*/
-- Step 1: Identify the first order for each customer
WITH FirstOrders AS (
    SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
    FROM 
        Delivery22
    GROUP BY 
        customer_id
),

-- Step 2: Classify the first orders as immediate or scheduled
ClassifiedOrders AS (
    SELECT 
        d.delivery_id,
        d.customer_id,
        d.order_date,
        d.customer_pref_delivery_date,
        CASE 
            WHEN d.order_date = d.customer_pref_delivery_date THEN 1
            ELSE 0
        END AS is_immediate
    FROM 
        Delivery22 d
    JOIN 
        FirstOrders f
    ON 
        d.customer_id = f.customer_id AND d.order_date = f.first_order_date
)

-- Step 3: Calculate the percentage of immediate first orders
SELECT 
    ROUND(AVG(is_immediate::decimal) * 100, 2) AS immediate_order_percentage
FROM 
    ClassifiedOrders;





