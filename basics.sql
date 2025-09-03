-- creating a table.
create table Student(
	id int primary key not null,
	name varchar(255),
	rollno int unique not null,
	class varchar,
	div char,
	age int not null
);


-- insert operation.
insert into Student(id, name, rollno, class, div, age)
values
(1, 'Parimal Matte', 101, 'BE', 'A', 21),
(2, 'Rohit Gandhal', 102, 'BE', 'A', 20),
(3, 'Hemant Choudhary', 103, 'BE', 'A',  19),
(4, 'Mohit Sonkusare', 12, 'TE', 'C', 20);

-- selection operation.
select * from Student;

-- selecting specific columns.
select rollno, name, class from Student;

-- adding columns in the table.
alter table Student
add column gender varchar(6) not null default('male');

-- removing columns from the table.
alter table Student
drop column gender;

-- updating the data.
update Student
set class = 'SE' where class = 'TE';

-- deleting the rows. To delete all rows: delete from Student.
delete from Student
where class = 'SE';

-- dropping the table.
drop table Student;

