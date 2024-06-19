CREATE TABLE bank_transactions34(
    transaction_id SERIAL PRIMARY KEY,
    bank_id INT,
    customer_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_type VARCHAR(10),
    transaction_date DATE
);
-- Insert sample records into bank_transactions
INSERT INTO bank_transactions34(bank_id, customer_id, transaction_amount, transaction_type, transaction_date) VALUES
(1, 101, 500.00, 'credit', '2024-01-01'),
(1, 101, 200.00, 'debit', '2024-01-02'),
(1, 101, 300.00, 'credit', '2024-01-05'),
(1, 101, 150.00, 'debit', '2024-01-08'),
(1, 102, 1000.00, 'credit', '2024-01-01'),
(1, 102, 400.00, 'debit', '2024-01-03'),
(1, 102, 600.00, 'credit', '2024-01-05'),
(1, 102, 200.00, 'debit', '2024-01-09');

/*
You are given a bank transaction data 
with columns bank_id, customer_id, 
amount_type(credit debit), 
transaction_amount and transaction_date
-- Write a query to find starting and ending 
trans amount for each customer
Return cx_id, their first_transaction_amt, 
last_transaction and these transaction_date
*/
with transactions 
as 
(select *,
       dense_rank() over(partition by customer_id order by transaction_date asc) as rnk
  from bank_transactions34
),
first_transaction as 
(select customer_id,transaction_amount,transaction_date
from transactions
where rnk = (select min(rnk) from transactions) ) ,
last_transaction as 
(select customer_id,transaction_amount,transaction_date
from transactions
where rnk = (select min(rnk) from transactions)) 
select first_transaction.customer_id,
first_transaction.transaction_amount as first_transaction_amount,
first_transaction.transaction_date as first_date,
last_transaction.transaction_amount as last_amount,
last_transaction.transaction_date as last_date 
from first_transaction
join last_transaction
on first_transaction.customer_id = last_transaction.customer_id;


  










