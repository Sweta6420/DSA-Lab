1. 
select course_id, count(*) as stu_count from takes group by course_id;

2. 
select count(distinct id) stu_count,dept_name
from takes natural join course
group by dept_name having count(distinct id)>3;

3.
select count(*)  course_count,dept_name from course group by dept_name;

4. 
select avg(salary),dept_name from instructor
group by dept_name having avg(salary)>42000;

5. 
select course_id,sec_id,count(distinct id)
from takes natural join section
where semester='Spring' and year=2009
group by course_id,sec_id;

6. 
select course_id,prereq_id from prereq order by course_id;
 
7. 
select * from instructor order by salary desc;

8. 
select max(total_salary) from
(select sum(salary) as total_salary
from instructor group by dept_name);

9. 
select avg(salary),dept_name from instructor
group by dept_name having avg(salary)>42000;

10. 
select max(total_student) from
(select count(distinct id) as total_student
from takes group by sec_id,semester,year
having semester='Spring' and year=2009);

11. 
select distinct(i.name) from instructor i,teaches t, takes ta, student s
where i.id=t.id and i.dept_name=s.dept_name and ta.id=s.id
and t.course_id=ta.course_id and s.dept_name='Comp. Sci.';

12. 
select dept_name,avg(salary) from instructor
group by dept_name having avg(salary)>50000 and count(id)>5;

13. 
with max_budget(val) as (select max(budget) from department)
select dept_name,budget from department,max_budget where budget=val;

14.
with total_sal(val,dept_name) as
(select sum(salary),dept_name from instructor group by dept_name),
avg_total_sal(avg_val) as
(select avg(val) from total_sal)
select t.dept_name,t.val from total_sal t, avg_total_sal a
where t.val>a.avg_val;

15. 
with enrolments(course,sec,sem,year,val) as
(select course_id,sec_id,semester,year,count(id) from takes
where semester='Fall' and year=2009
group by course_id,sec_id,semester,year)
select e.course,e.sem,e.sec,e.year,e.val from enrolments e
where e.val = (select max(val) from enrolments);

16. 
with sum_tot_cred(dept,val) as (select dept_name,sum(tot_cred) 
from student group by dept_name),
tot_cred_fin(val) as (select sum(tot_cred) 
from student where dept_name='Finance'  group by dept_name)
select dept,s.val from sum_tot_cred s,tot_cred_fin t 
where s.val>t.val;

17. 
SQL> savepoint S2;
Savepoint created.

SQL> delete from instructor where dept_name='Finance';

2 rows deleted.

SQL> rollback;

Rollback complete.

18. 
delete from course where dept_name='Comp. Sci.';

19. 
update student set dept_name='IT' where dept_name='Comp. Sci.';
--not possible because of foreign key
insert into department values('IT','Packard',95000);
update student set dept_name='IT' where dept_name='Comp. Sci.';
--added it dept in department table and updated in student table

20. 
update instructor set salary=
case 
	when salary>100000 then salary*1.03
	else salary*1.05
end;

21.
insert into student (select id,name,dept_name,0 from instructor);
--unique constraint violated
insert into student (select id,name,dept_name,0 
from instructor where name<>'Singh');
--violating name not added

22.
delete from instructor where
salary< (select avg(salary) from instructor);
