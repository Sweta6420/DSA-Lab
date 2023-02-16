
SQL> create table emp(empno numeric(5),
  2  empname varchar(20) not null,
  3  gender varchar(1) not null,
  4  salary numeric(6) not null,
  5  address varchar(20) not null,
  6  dno numeric(5),
  7  primary key(empno),
  8  check(gender in ('M','F')));

Table created.

SQL> create table dept(deptno numeric(5),deptname varchar(20),location varchar(20),primary key(deptno), unique(deptname));

Table created.

SQL> alter table emp add constraint FK_deptno foreign key(dno) references dept(deptno);

Table altered.

SQL> describe emp
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(5)
 EMPNAME                                   NOT NULL VARCHAR2(20)
 GENDER                                    NOT NULL VARCHAR2(1)
 SALARY                                    NOT NULL NUMBER(6)
 ADDRESS                                   NOT NULL VARCHAR2(20)
 DNO                                                NUMBER(5)

SQL> describe dept
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTNO                                    NOT NULL NUMBER(5)
 DEPTNAME                                           VARCHAR2(20)
 LOCATION                                           VARCHAR2(20)

SQL> insert into dept values(1,'Admin','Block1');

1 row created.

SQL> insert into dept values(2,'Sales','Block2');

1 row created.

SQL> insert into dept values(3,'Marketing','Block3');

1 row created.

SQL> insert into dept values(4,'Customer Service','Block4');

1 row created.

SQL> select * from dept;

    DEPTNO DEPTNAME             LOCATION
---------- -------------------- --------------------
         1 Admin                Block1
         2 Sales                Block2
         3 Marketing            Block3
         4 Customer Service     Block4
		 
SQL> insert into emp values(1,'Rohan','M',12000,'121 Street',1);

1 row created.

SQL> insert into emp values(2,'Mohan','M',12500,'122 Road',2);

1 row created.

SQL> insert into emp values(3,'Sneha','F',15500,'122 Road',1);

1 row created.

SQL> insert into emp values(4,'Mohit','M',15200,'124 Street',4);

1 row created.

SQL> insert into emp values(5,'Lohit','M',1235,'114 Street',5);
insert into emp values(5,'Lohit','M',1235,'114 Street',5)
*
ERROR at line 1:
ORA-02291: integrity constraint (D30.FK_DEPTNO) violated - parent key not found
 
SQL> insert into emp values(5,'Lohit','M',NULL,'114 Street',5);
insert into emp values(5,'Lohit','M',NULL,'114 Street',5)
                                     *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("D30"."EMP"."SALARY")

SQL> insert into dept values(1,'Management','Block1');
insert into dept values(1,'Management','Block1')
*
ERROR at line 1:
ORA-00001: unique constraint (D30.SYS_C0014497) violated

SQL> select * from emp;

     EMPNO EMPNAME              G     SALARY ADDRESS                     DNO
---------- -------------------- - ---------- -------------------- ----------
         1 Rohan                M      12000 121 Street                    1
         2 Mohan                M      12500 122 Road                      2
         3 Sneha                F      15500 122 Road                      1
         4 Mohit                M      15200 124 Street                    4

SQL> alter table emp drop constraint FK_deptno;

Table altered.

SQL> alter table emp add constraint FK_deptno foreign key(dno) references dept(deptno) on delete cascade;

Table altered.

SQL> alter table emp ADD CONSTRAINT def_value check(salary>10000);

Table altered.

SQL> insert into emp values(5,'Rohit','M',1200,'125 Lane',4);
insert into emp values(5,'Rohit','M',1200,'125 Lane',4)
*
ERROR at line 1:
ORA-02290: check constraint (D30.DEF_VALUE) violated




University Database

9.
SQL> select name,dept_name from student;

NAME                 DEPT_NAME
-------------------- --------------------
Zhang                Comp. Sci.
Shankar              Comp. Sci.
Brandt               History
Chavez               Finance
Peltier              Physics
Levy                 Physics
Williams             Comp. Sci.
Sanchez              Music
Snow                 Physics
Brown                Comp. Sci.
Aoi                  Elec. Eng.

NAME                 DEPT_NAME
-------------------- --------------------
Bourikas             Elec. Eng.
Tanaka               Biology

13 rows selected.


10.
select * from instructor where dept_name = 'Comp. Sci.';

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
10101 Srinivasan           Comp. Sci.                65000
45565 Katz                 Comp. Sci.                75000
83821 Brandt               Comp. Sci.                92000

11.
select title from course where dept_name = 'Comp. Sci.' and credits=3;

TITLE
--------------------------------------------------
Robotics
Image Processing
Database System Concepts

12.
select c.course_id,title from takes t,course c where id=12345 and c.course_id=t.course_id;

COURSE_I TITLE
-------- --------------------------------------------------
CS-101   Intro. to Computer Science
CS-190   Game Design
CS-315   Robotics
CS-347   Database System Concepts

13. 
select * from instructor where salary between 40000 and 90000;

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
10101 Srinivasan           Comp. Sci.                65000
12121 Wu                   Finance                   90000
15151 Mozart               Music                     40000
32343 El Said              History                   60000
33456 Gold                 Physics                   87000
45565 Katz                 Comp. Sci.                75000
58583 Califieri            History                   62000
76543 Singh                Finance                   80000
76766 Crick                Biology                   72000
98345 Kim                  Elec. Eng.                80000

14.
select id from instructor where id not in (select id from teaches);

ID
-----
76543
58583
33456

15.
select name,title,se.year
from student s,takes t, section se, course c
where room_number=3128
and s.id=t.id
and c.course_id=t.course_id
and t.sec_id=se.sec_id
and t.semester=se.semester
and t.year=se.year;
  
16. 
select name,c.course_id, title as c_name
from student s, course c, takes t
where year=2009
and t.course_id=c.course_id
and t.id=s.id;
  
17.
select i1.name from instructor i1, instructor i2 where i1.salary>i2.salary
  2  and i2.dept_name='Biology';
  
18.
select name from instructor where dept_name like '%ch%';
  
19.
select name, length(name) from student;

20.
select dept_name, substr(dept_name,3,3) from department;

21.
select upper(name) name from instructor;

22.
select nvl(grade,0) from takes;

23.
select salary, round(salary/3,-2) rounded_salary from instructor;


Employee

update emp set dob='14-MAR-1994' where empno=101;

1 row updated.

update emp set dob='15-APR-1995' where empno=102;

1 row updated.

update emp set dob='13-JUN-1994' where empno=3;

1 row updated.

update emp set dob='13-JUN-1995' where empno=4;

1 row updated.

24.
select to_char(to_date(dob,'DD-MON-YY'),'DD-MON-YYYY') from emp; 
select to_date(dob,'DD-MON-YY') from employee; 
select to_char(to_date(dob,'DD-MON-YY'),'DD-MM-YYYY') from emp; 

25. 
select empname, to_char(dob,'YEAR') from emp;
select empname, to_char(dob,'Year') from emp;
select empname, to_char(dob,'year') from emp;

26. 
select empname, to_char(dob,'DAY') from emp;
select empname, to_char(dob,'Day') from emp;

27.
select empname, to_char(dob,'MONTH') from emp;
select empname, to_char(dob,'Month') from emp;

28. 
select last_day(dob), dayname(dob) from emp where emp_name='Rohan';

29. 
select round(months_between(trunc(current_date),to_date(dob,'DD-MON-YY'))/12,0) as age from emp;

30. 
select next_day(add_months(dob,720),'Saturday') from emp;

31. 
select dob from emp where to_char(dob,'YYYY')=2002;

32.
select dob from emp where to_char(dob,'YYYY') between 2000 and 2003;

33. 
select empname from emp where extract(year from dob)+60=2038;