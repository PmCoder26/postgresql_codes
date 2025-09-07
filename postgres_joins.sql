
create table if not exists categories (
	category_id int primary key not null,
	category_name varchar(255) not null unique
);

create table if not exists products (
	product_id int primary key not null,
	product_name varchar(255) not null,
	category_id int,
	foreign key (category_id) references categories(category_id)
);

insert into categories(category_id, category_name) values
(1, 'Beverages'),
(2, 'Condiments'),
(3, 'Confections'),
(4, 'Dairy Products');

select * from categories;

insert into products(product_id, product_name, category_id) values
(33, 'Geitost', 4),
(34, 'Sasquatch Ale', 1),
(35, 'Steeleye Stout', 1);

select * from products;


-- inner join: selects records that have matching values in both tables.
select * from products p
left join categories c on p.category_id = c.category_id;

-- left join: selects ALL records from the "left" table, and the matching records from the "right" table. 
-- 				The result is 0 records from the right side if there is no match.
select * from products p
left join categories c on p.category_id = c.category_id;

-- right join: selects ALL records from the "right" table, and the matching records from the "left" table. 
-- 				  The result is 0 records from the left side if there is no match.
select * from products p
right join categories c on p.category_id = c.category_id;

-- full join: selects ALL records from both tables, even if there is not a match. For rows with a match the
--					values from both tables are available, if there is not a match the empty fields will get the value NULL.
select * from categories c
full join products p on p.category_id = c.category_id;

-- cross join: matches ALL records from the "left" table with EACH record from the "right" table.
-- 				    That means that all records from the "right" table will be returned for each record in the "left" table.
select * from categories c
cross join products p;