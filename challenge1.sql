CREATE DATABASE SQLCHALLENGE;
USE SQLCHALLENGE;

-- creating table 
CREATE TABLE Employees(
employee_id  SERIAL PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(100),
salary DECIMAL(10,2) 
);

-- inserting values into table
INSERT INTO Employees(name,department,salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

-- retrieving second highest salary 
select * from Employees 
order by salary desc
LIMIT 1 OFFSET 1;    
-- LIMIT INDICATES NO OF ROWS TO BE PRINTED AND OFFSET INDICATES NO OF ROWS TO BE SKIPPED FROM THE TOP.

-- USING DENSE RANK (we can select multple rows if the 2 people have same second highest salary)
select * from 
(select *,DENSE_RANK() over(order by salary desc) as rnk 
FROM Employees ) as sub
where rnk=2;




