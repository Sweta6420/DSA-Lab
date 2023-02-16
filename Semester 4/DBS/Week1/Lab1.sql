
SQL*Plus: Release 12.1.0.2.0 Production on Wed Feb 1 14:18:56 2023

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: d30@cgorcl

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production

SQL> create table student(reg_no number(5), name varchar(20), age number(5), dob date, marks1 number(4,2), marks2 number(4,2), marks3 number(4,2));

Table created.

SQL> insert into student values (101,'AAA',16,'03-jul-88',80,90,88);

1 row created.

SQL> insert into student values (102,'AAB',16,'04-jul-87',81,91,88);

1 row created.

SQL> describe student
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REG_NO                                             NUMBER(5)
 NAME                                               VARCHAR2(20)
 AGE                                                NUMBER(5)
 DOB                                                DATE
 MARKS1                                             NUMBER(4,2)
 MARKS2                                             NUMBER(4,2)
 MARKS3                                             NUMBER(4,2)

SQL> select * from student;

    REG_NO NAME                        AGE DOB           MARKS1     MARKS2
---------- -------------------- ---------- --------- ---------- ----------
    MARKS3
----------
       101 AAA                          16 03-JUL-88         80         90
        88

       102 AAB                          16 04-JUL-87         81         91
        88


SQL> select * from student
  2  ;

    REG_NO NAME                        AGE DOB           MARKS1     MARKS2
---------- -------------------- ---------- --------- ---------- ----------
    MARKS3
----------
       101 AAA                          16 03-JUL-88         80         90
        88

       102 AAB                          16 04-JUL-87         81         91
        88

SQL> alter table student drop column marks3;

Table altered.

SQL> select * from student;

    REG_NO NAME                        AGE DOB           MARKS1     MARKS2
---------- -------------------- ---------- --------- ---------- ----------
       101 AAA                          16 03-JUL-88         80         90
       102 AAB                          16 04-JUL-87         81         91

SQL> alter table student add(cgpa varchar(4));

Table altered.

SQL> describe student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REG_NO                                             NUMBER(5)
 NAME                                               VARCHAR2(20)
 AGE                                                NUMBER(5)
 DOB                                                DATE
 MARKS1                                             NUMBER(4,2)
 MARKS2                                             NUMBER(4,2)
 CGPA                                               VARCHAR2(4)

SQL> alter table student modify(cgpa numeric(2,2));

Table altered.

SQL> describe student
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REG_NO                                             NUMBER(5)
 NAME                                               VARCHAR2(20)
 AGE                                                NUMBER(5)
 DOB                                                DATE
 MARKS1                                             NUMBER(4,2)
 MARKS2                                             NUMBER(4,2)
 CGPA                                               NUMBER(2,2)

SQL> select * from student;

    REG_NO NAME                        AGE DOB           MARKS1     MARKS2
---------- -------------------- ---------- --------- ---------- ----------
      CGPA
----------
       101 AAA                          16 03-JUL-88         80         90


       102 AAB                          16 04-JUL-87         81         91

SQL> alter table student modify(cgpa numeric(3,1));

Table altered.

SQL> update student set cgpa=9.6  where name='AAA';

1 row updated.

SQL> select * from student;

    REG_NO NAME                        AGE DOB           MARKS1     MARKS2
---------- -------------------- ---------- --------- ---------- ----------
      CGPA
----------
       101 AAA                          16 03-JUL-88         80         90
       9.6

       102 AAB                          16 04-JUL-87         81         91

SQL> rename student to students;

Table renamed.

SQL> select * from students;

    REG_NO NAME                        AGE DOB           MARKS1     MARKS2
---------- -------------------- ---------- --------- ---------- ----------
      CGPA
----------
       101 AAA                          16 03-JUL-88         80         90
       9.6

       102 AAB                          16 04-JUL-87         81         91

SQL> create table employee(emp_no numeric(3),emp_name varchar(20),emp_address varchar(20));

Table created.

SQL> describe employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_NO                                             NUMBER(3)
 EMP_NAME                                           VARCHAR2(20)
 EMP_ADDRESS                                        VARCHAR2(20)

SQL> insert into employee values (101,'Rohit','Manipal');

1 row created.

SQL> insert into employee values (102,'Rahul','Manipal');

1 row created.

SQL> insert into employee values (103,'Sneha','Delhi');

1 row created.

SQL> insert into employee values (104,'Ansh','Ahmedabad');

1 row created.

SQL> insert into employee values (105,'Rohan','Mumbai');

1 row created.

SQL> select emp_name name from employee;

NAME
--------------------
Rohit
Rahul
Sneha
Ansh
Rohan

SQL> select * from employee where emp_address='Manipal';

    EMP_NO EMP_NAME             EMP_ADDRESS
---------- -------------------- --------------------
       101 Rohit                Manipal
       102 Rahul                Manipal

SQL> alter table employee add (salary numeric(7,2));

Table altered.

SQL> describe employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_NO                                             NUMBER(3)
 EMP_NAME                                           VARCHAR2(20)
 EMP_ADDRESS                                        VARCHAR2(20)
 SALARY                                             NUMBER(7,2)

SQL> update employee set salary=30000;

5 rows updated.

SQL> select * from employee;

    EMP_NO EMP_NAME             EMP_ADDRESS              SALARY
---------- -------------------- -------------------- ----------
       101 Rohit                Manipal                   30000
       102 Rahul                Manipal                   30000
       103 Sneha                Delhi                     30000
       104 Ansh                 Ahmedabad                 30000
       105 Rohan                Mumbai                    30000

SQL> delete from employee where emp_address='Mangalore';

0 rows deleted.

SQL> rename employee to employee1;

Table renamed.

SQL>  alter table employee1 add (marks2 numeric(4,2));

Table altered.

SQL> select * from employee1;

    EMP_NO EMP_NAME             EMP_ADDRESS              SALARY     MARKS2
---------- -------------------- -------------------- ---------- ----------
       101 Rohit                Manipal                   30000
       102 Rahul                Manipal                   30000
       103 Sneha                Delhi                     30000
       104 Ansh                 Ahmedabad                 30000
       105 Rohan                Mumbai                    30000

SQL> drop table students;

Table dropped.

SQL> select * from employee1;

    EMP_NO EMP_NAME             EMP_ADDRESS              SALARY     MARKS2
---------- -------------------- -------------------- ---------- ----------
       101 Rohit                Manipal                   30000
       102 Rahul                Manipal                   30000
       103 Sneha                Delhi                     30000
       104 Ansh                 Ahmedabad                 30000
       105 Rohan                Mumbai                    30000

SQL> alter table employee1 modify(salary varchar(20));
alter table employee1 modify(salary varchar(20))
                             *
ERROR at line 1:
ORA-01439: column to be modified must be empty to change datatype

SQL> create table branch(branch_name varchar(20), branch_city varchar(20), assets varchar(20));

Table created.

SQL> alter table branch modify(assets number(10));

Table altered.

SQL> select * from branch;

no rows selected

SQL> insert into branch ('MIT','Manipal',10);
insert into branch ('MIT','Manipal',10)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> insert into branch values('MIT','Manipal',10);

1 row created.

SQL> insert into branch values('Airport','Mangalore',11);

1 row created.

SQL> insert into branch values('Panaji','Panaji',11);

1 row created.

SQL> create table customer(customer_id number(3), customer_name varchar(20), customer_street varchar(20), customer_city varchar(20));

Table created.

SQL> describe customer;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMER_ID                                        NUMBER(3)
 CUSTOMER_NAME                                      VARCHAR2(20)
 CUSTOMER_STREET                                    VARCHAR2(20)
 CUSTOMER_CITY                                      VARCHAR2(20)

SQL> insert into customer values(1,'Rohan','MIT','Manipal');

1 row created.

SQL> insert into customer values(1,'Rohit','KMC','Manipal');

1 row created.

SQL> insert into customer values(3,'Rakshit','Temple street','Udupi');

1 row created.

SQL> update customer set customer_id=2 where customer_name='Rohit';

1 row updated.

SQL> select * from customer;

CUSTOMER_ID CUSTOMER_NAME        CUSTOMER_STREET      CUSTOMER_CITY
----------- -------------------- -------------------- --------------------
          1 Rohan                MIT                  Manipal
          2 Rohit                KMC                  Manipal
          3 Rakshit              Temple street        Udupi
		  
SQL> create table loan(loan_number number(2), amount number(8,2));

Table created.

SQL> describe loan;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 LOAN_NUMBER                                        NUMBER(2)
 AMOUNT                                             NUMBER(8,2)

SQL> insert into loan values(1,10000);

1 row created.

SQL> insert into loan values(2,2050);

1 row created.

SQL> insert into loan values(3,12345.12);

1 row created.

SQL> insert into loan values(4,95000);

1 row created.

SQL> select * from loan;

LOAN_NUMBER     AMOUNT
----------- ----------
          1      10000
          2       2050
          3   12345.12
          4      95000

SQL> create table account(account_number number(7), balance number(10,2));

Table created.

SQL> insert into account values(1,129);

1 row created.

SQL> insert into account values(2,230);

1 row created.

SQL> insert into account values(3,100000);

1 row created.

SQL> insert into account values(4,5000);

1 row created.

SQL> insert into account values(5,100);

1 row created.

SQL> select * from account;

ACCOUNT_NUMBER    BALANCE
-------------- ----------
             1        129
             2        230
             3     100000
             4       5000
             5        100


SQL> create table dependent_name(employee_id number(5),dname varchar(20));

Table created.

SQL> alter table employee1 modify (marks2 float);

Table altered.

SQL> describe employee1;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_NO                                             NUMBER(3)
 EMP_NAME                                           VARCHAR2(20)
 EMP_ADDRESS                                        VARCHAR2(20)
 SALARY                                             NUMBER(7,2)
 MARKS2                                             FLOAT(126)

SQL> describe dependent_name;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                                        NUMBER(5)
 DNAME                                              VARCHAR2(20)
 
SQL> insert into dependent_name values(1,'Rohit');

1 row created.

SQL> insert into dependent_name values(2,'Rohan');

1 row created.

SQL> insert into dependent_name values(3,'Rakshit');

1 row created.

SQL> insert into dependent_name values(4,'Rahul');

1 row created.

SQL> create table account_branch(account_number number(5), branch_name varchar(20));

Table created.

SQL> insert into account_branch  values(1,'Manipal');

1 row created.

SQL> insert into account_branch  values(2,'Mangalore');

1 row created.

SQL> insert into account_branch  values(3,'Panaji');

1 row created.

SQL> insert into account_branch  values(4,'Mumbai');

1 row created.

SQL> create table loan_branch(loan_number numeric(3), branch_name varchar(20));

Table created.
	
SQL> insert into loan_branch values(1,'Manipal');

1 row created.

SQL> insert into loan_branch values(2,'Manipal');

1 row created.

SQL> insert into loan_branch values(3,'Mangalore');

1 row created.

SQL> insert into loan_branch values(4,'Mumbai');

1 row created.

SQL> insert into loan_branch values(5,'Mangalore');

1 row created.

SQL> create table borrower(customer_id number(5), loan_number number(5));

Table created.

SQL> insert into borrower values(1,1);

1 row created.

SQL> insert into borrower values(2,2);

1 row created.

SQL> insert into borrower values(3,3);

1 row created.

SQL> insert into borrower values(4,4);

1 row created.

SQL> create table depositor(customer_id number(5), account_number number(5));

Table created.

SQL> describe depositor;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMER_ID                                        NUMBER(5)
 ACCOUNT_NUMBER                                     NUMBER(5)

SQL> insert into depositor values(1,1);

1 row created.

SQL> insert into depositor values(2,2);

1 row created.

SQL> insert into depositor values(3,3);

1 row created.

SQL> insert into depositor values(4,4);

1 row created.

SQL> insert into depositor values(5,5);

1 row created.