1.
select course_id from section where semester='Fall' and year=2009
UNION
select course_id from section where semester='Spring' and year=2010;
  
2. 
select course_id from section where semester='Fall' and year=2009
INTERSECT
select course_id from section where semester='Spring' and year=2010;
  
3. 
select course_id from section where semester='Fall' and year=2009
MINUS
select course_id from section where semester='Spring' and year=2010;
  
4.
select course_id from course
where course_id not in (select course_id from takes);

5. 
select course_id from section 
where semester='Fall' and year=2009
and course_id in 
(select course_id from section where semester='Spring' and year=2010);

6.
select count(distinct id) as no_of_students from takes
where course_id in
(select course_id from teaches
where ID=10101);
  
7.
select course_id from section 
where semester='Fall' and year=2009
and course_id not in 
(select course_id from section 
where semester='Spring' and year=2010);

8.
select name from student where name in
(select name from instructor);

9. 
select name from instructor 
where salary>some(select salary from instructor 
where dept_name='Biology');

10. 
select name from instructor 
where salary>all(select salary 
from instructor where dept_name='Biology');
  
11.
select dept_name,avg(salary) as avg_salary
from instructor group by dept_name
having avg(salary) >= all (select avg(salary)
from instructor group by dept_name);
  
12. 
select dept_name from department
where budget < (select avg(salary) from instructor);
  
13. 
select course_id from section
where semester='Fall' and year=2009
and exists(select * from section
where semester='Spring' and year=2010);
  
14. 
select distinct ID from takes t 
where exists(select * from course c 
where dept_name='Biology' and t.course_id = c.course_id);

15. 
select course_id from section
where 1>= (select (count(course_id)) from section where year=2019);
  
16.
select distinct ID from takes t
where 2<=(select count(ID) from takes
where course_id in (select course_id from course c
where dept_name='Comp. Sci.' and t.course_id=c.course_id));
  
17.
select dept_name,avg_salary from
(select dept_name, avg(salary) avg_salary
from instructor group by dept_name)
where avg_salary>42000;
  