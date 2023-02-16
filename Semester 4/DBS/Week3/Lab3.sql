1.
SQL> select course_id from section where semester='Fall' and year=2009
  2  UNION
  3  select course_id from section where semester='Spring' and year=2010;
  
2. 
SQL> select course_id from section where semester='Fall' and year=2009
  2  INTERSECT
  3  select course_id from section where semester='Spring' and year=2010;
  
3. 
SQL> select course_id from section where semester='Fall' and year=2009
  2  MINUS
  3  select course_id from section where semester='Spring' and year=2010;
  
4.
SQL> select course_id from course
  2  where course_id not in (select course_id from takes);

5. 
SQL> select course_id from section 
  2  where semester='Fall' and year=2009
  3  and course_id in 
  4  (select course_id from section where semester='Spring' and year=2010);

6.
SQL> select count(distinct id) as no_of_students from takes
  2  where course_id in
  3  (select course_id from teaches
  4  where ID=10101);
  
7.
SQL> select course_id from section 
  2  where semester='Fall' and year=2009
  3  and course_id not in 
  4  (select course_id from section 
  5  where semester='Spring' and year=2010);

8.
SQL> select name from student where name in
  2  (select name from instructor);

9. 
SQL> select name from instructor 
  2  where salary>some(select salary from instructor 
  3  where dept_name='Biology');
  
10. 
SQL> select name from instructor 
  2  where salary>all(select salary 
  3  from instructor where dept_name='Biology');
  
11.
SQL> select dept_name,avg(salary) as avg_salary
  2  from instructor group by dept_name
  3  having avg(salary) >= all (select avg(salary)
  4  from instructor group by dept_name);
  
12. 
SQL> select dept_name from department
  2  where budget < (select avg(salary) from instructor);
  
13. 
SQL> select course_id from section
  2  where semester='Fall' and year=2009
  3  and exists(select * from section
  4  where semester='Spring' and year=2010);
  
14. 
SQL> select distinct ID from takes t 
  2  where exists(select * from course c 
  3  where dept_name='Biology' and t.course_id = c.course_id);

15. 
SQL> select course_id from section
  2  where 1>= (select (count(course_id)) from section where year=2019);
  
16.
SQL> select distinct ID from takes t
  2  where 2<=(select count(ID) from takes
  3  where course_id in (select course_id from course c
  4  where dept_name='Comp. Sci.' and t.course_id=c.course_id));
  
17.
SQL> select dept_name,avg_salary from
  2  (select dept_name, avg(salary) avg_salary
  3  from instructor group by dept_name)
  4  where avg_salary>42000;
  