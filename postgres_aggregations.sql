
-- select count.
select count(distinct grade) from students;

-- limit + offset clause.
select * from students
limit 9 offset 1;

-- min clause.
select min(age) as minimum_age from students;

-- max clause.
select max(age) as maximum_age from students;

-- sum clause.
select sum(gpa) as total_gpa from students;

-- avg clause.
select avg(age) as average_age from students;

-- in clause.
select * from students
where grade in('A', 'B') order by name asc;

-- not in clause.
select * from students
where grade not in('A', 'B') order by name asc;

-- between clause.
select * from students
where age between 20 and 22 order by age asc;

select * from students
where enrolled_on between '2021-09-10' and '2023-01-01' order by enrolled_on asc;