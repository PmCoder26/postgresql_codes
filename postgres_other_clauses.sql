
-- union clause: used to combine the result-set of two or more queries.
/* 
	The queries in the union must follow these rules:
		1. They must have the same number of columns.
		2. The columns must have the same data types.
		3. The columns must be in the same order.
*/
select product_id, product_name
from products
union
select category_id, category_name
from categories
order by product_id;

/* 
	With the UNION operator, if some rows in the two queries returns the exact same result, 
	only one row will be listed, because UNION selects only distinct values.
	Use UNION ALL to return duplicate values.
*/
select product_id, product_name
from products
union all
select product_id, product_name
from products;


CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (emp_name, department, salary) VALUES
('Alice',   'HR',        50000),
('Bob',     'HR',        55000),
('Charlie', 'IT',        60000),
('David',   'IT',        65000),
('Eva',     'Finance',   70000),
('Frank',   'Finance',   72000),
('Grace',   'IT',        58000),
('Helen',   'HR',        53000),
('Ivy',     'Finance',   71000);

select * from employees;

-- group by clause.
select department, avg(salary) as average_salary
from employees
group by department;

select department, count(e) as emp_count
from employees e
group by department;

/*
	The HAVING clause was added to SQL because the WHERE clause cannot be used with aggregate functions.
	Aggregate functions are often used with GROUP BY clauses, and by adding HAVING we can write condition like we do with WHERE clauses.
*/
select department, avg(salary) as average_salary
from employees
group by department 
having avg(salary) > 60000;

-- exists clause.
select e.emp_name, e.salary from employees e
where exists (
	select emp_name
	from employees
	where e.emp_name = emp_name and salary < 70000
);

-- not exists clause.
select e.emp_name, e.salary from employees e
where not exists (
	select emp_name
	from employees
	where e.emp_name = emp_name and salary < 70000
);


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO orders (customer_name, product, quantity, price) VALUES
('Alice',   'Laptop',   1, 55000),
('Bob',     'Mouse',    3, 1500),
('Charlie', 'Laptop',   2, 54000),
('David',   'Keyboard', 1, 3000),
('Eva',     'Monitor',  2, 12000),
('Frank',   'Mouse',    5, 1400),
('Grace',   'Monitor',  1, 12500),
('Helen',   'Laptop',   1, 60000),
('Ivy',     'Keyboard', 2, 2800);

select * from orders;

/*
	The ANY operator allows you to perform a comparison between a single column value and a range of other values.
	The ANY operator:
		- returns a Boolean value as a result.
		- returns TRUE if ANY of the sub query values meet the condition.
	ANY means that the condition will be true if the operation is true for any of the values in the range.
*/
-- Find customers who bought a product more expensive than ANY monitor:
 select order_id, customer_name, product, price
 from orders
 where price > any(
 	select price
 	from orders
 	where product = 'Monitor'
 );

/*
	The ALL operator:
		- returns a Boolean value as a result.
		- returns TRUE if ALL of the sub query values meet the condition.
		- is used with SELECT, WHERE and HAVING statements.
	ALL means that the condition will be true only if the operation is true for all values in the range.
*/
select order_id, customer_name, product, price
from orders
where price > all(
	select price
	from orders
	where product = 'Monitor'
);

/*
	The CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement).
	Once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.	
	If there is no ELSE part and no conditions are true, it returns NULL.
*/
select order_id, product,
case 
	when price < 40000 then 'Expensive'
	when price < 10000 then 'Cheaper'
	else 'Normal'
end as Price_Category
from orders;
