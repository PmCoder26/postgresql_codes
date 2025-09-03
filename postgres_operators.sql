
CREATE  TABLE  IF  NOT  EXISTS  students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    grade VARCHAR(2) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrolled_on DATE NOT NULL,
    gpa NUMERIC(3,2),        -- grade point average
    active BOOLEAN NOT NULL  -- is the student currently active
);

INSERT INTO students (name, age, grade, email, enrolled_on, gpa, active) VALUES
('Tony',   21, 'A', 'tony@example.com', '2022-09-01', 3.85, TRUE),
('Ravi',   22, 'B', 'ravi@example.com', '2021-08-15', 3.10, TRUE),
('Sara',   20, 'A', 'sara@example.com', '2023-01-10', 3.90, TRUE),
('Anita',  23, 'C', 'anita@example.com','2020-07-20', 2.75, FALSE),
('Kiran',  21, 'B', 'kiran@example.com','2022-09-01', 3.25, TRUE),
('Manoj',  24, 'D', 'manoj@example.com','2019-06-05', 2.10, FALSE),
('Leena',  19, 'A', 'leena@example.com','2023-02-11', 3.95, TRUE),
('David',  22, 'B', 'david@example.com','2021-09-12', 2.95, TRUE),
('Priya',  20, 'C', 'priya@example.com','2022-01-25', 3.00, TRUE),
('Arjun',  25, 'A', 'arjun@example.com','2018-05-30', 3.70, FALSE);

SELECT  * FROM students;


-- using '=' oprator.
SELECT name, gpa FROM students
WHERE age = 22;

-- using '<' operator.
select  name, grade from students
where gpa < 3.5;

-- using '>' operator.
select name, grade from students
where age > 21 order by grade asc;

-- similarly with '<=' and '>=' operators.

-- using '!=' operator.
select name from students
where grade != 'B';

-- using 'LIKE' operator. it is case sensitive.
select * from students
where name like 'A%';		-- pattern: name = A****

select * from students
where name like '%a';		-- pattern: name = ****a

select * from students
where name like '%r%';	-- pattern: name = **r**
