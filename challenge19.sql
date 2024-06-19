use sqlchallenge;
-- Creating the employees table
CREATE TABLE employees19(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
-- Inserting sample data for employees
INSERT INTO employees19(employee_name, department, salary) 
VALUES
    ('John Doe', 'HR', 50000.00),
    ('Jane Smith', 'HR', 55000.00),
    ('Michael Johnson', 'HR', 60000.00),
    ('Emily Davis', 'IT', 60000.00),
    ('David Brown', 'IT', 65000.00),
    ('Sarah Wilson', 'Finance', 70000.00),
    ('Robert Taylor', 'Finance', 75000.00),
    ('Jennifer Martinez', 'Finance', 80000.00);

/*
-- Q.
You have a table with below COLUMNS
emp_id employee_name, department, salary
Find the details of employees whose salary is greater
than the average salary across the entire company.
*/
select * from employees19
where salary >
(select avg(salary) as avg from employees19);



