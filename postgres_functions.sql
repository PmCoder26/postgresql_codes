-- functions.

-- zero parameter function.
create or replace function totalSalary()
returns int as $$
declare
	total int;
begin
	select sum(salary) into total from employees;
	return total;
end;
$$ language plpgsql;

select totalSalary();


-- parametric function.
create or replace function sumNums(a int, b int)
returns int as $$
declare
	sum int;
begin
	return a + b;
end;
$$ language plpgsql;

select sumNums(10, 20);