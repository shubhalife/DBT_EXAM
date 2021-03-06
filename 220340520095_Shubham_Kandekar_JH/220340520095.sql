create database DBT_EXAM;
use DBT_EXAM;

-- ==============================================================================================

-- 1.	Create table DEPT with the following structure:-

	create table DEPT
    (DEPTNO	int(2),
     DNAME	varchar(15),
	 LOC varchar(10));
     
     desc DEPT;
     
     insert into DEPT values
     (10,'ACCOUNTING','NEW YORK'),
     (20,'RESEARCH','DALLAS'),
     (30,'SALES','CHICAGO'),
     (40,'OPERATIONS','BOSTON');
     
     select * from DEPT;
     
-- ========================================================================================
-- 2.	Create table EMP with the following structure:-

	 create table EMP
     (EMPNO	int(4),
	  ENAME	varchar(10),
	  JOB varchar(9),
	  HIREDATE date,
	  SAL float(7,2),
	  COMM	float(7,2),
	  DEPTNO int(2));
      
      desc EMP;
      
      insert into EMP values
      (7839,'KING','MANAGER','1991-11-17',5000,NULL,10),
      (7698,'BLAKE','CLERK','1981-05-01',2850,NULL,30),
      (7782,'CLARK','MANAGER','1981-06-09',2450,NULL,10),
      (7566,'JONES','CLERK','1981-04-02',2975,NULL,20),
      (7654,'MARTIN','SALESMAN','1981-09-28',1250,1400,30),
      (7499,'ALLEN','SALESMAN','1981-02-20',1600,300,30);
      
      select * from EMP;
-- =====================================================================================================

-- Write SELECT statements to achieve the following:-
-- 3.	Display all the employees where SAL between 2500 and 5000 (inclusive of both).
		select * from EMP where SAL between 2500 and 5000;

-- 4.	Display all the ENAMEs in descending order of ENAME.
		select ENAME from EMP order by ENAME desc;
        
-- 5.	Display all the JOBs in lowercase.
		select distinct lower(JOB) from EMP ;
        
-- 6.	Display the ENAMEs and the lengths of the ENAMEs.
		select ENAME, length(ENAME) as lengths from EMP;
        
-- 7.	Display the DEPTNO and the count of employees who belong to that DEPTNO .
		select DEPTNO,count(DEPTNO) as `count of employees` FROM EMP group by DEPTNO order by 1;

-- 8.	Display the DNAMEs and the ENAMEs who belong to that DNAME.
		select DNAME, ENAME from EMP,DEPT where EMP.DEPTNO =DEPT.DEPTNO order by 1;

-- 9.	Display the position at which the string ???AR??? occurs in the ename.
		select ENAME,instr(ENAME,'AR') as `position` from EMP;
		
-- 10.	Display the HRA for each employee given that HRA is 20% of SAL.
		Select ENAME, 0.2*sal as HRA from EMP;

-- ==================================================================================================

/*1.	Write a stored procedure by the name of PROC1 that accepts two varchar strings as parameters.
 Your procedure should then determine if the first varchar string exists
 inside the varchar string. For example, if string1 = ???DAC??? and string2 = ???CDAC, 
 then string1 exists inside string2.
  The stored procedure should insert the appropriate message 
  into a suitable TEMPP output table.
  Calling program for the stored procedure need not be written.

*/

create table TEMPP
(string1 varchar(20),
string2 varchar(20),
message varchar(50)); -- string1 not present in string2



delimiter //
create procedure PROC1(a varchar(20), b varchar(20))
begin
if instr(b,a) = 0 then
	insert into TEMPP values(a,b,'string1 not present in string2');
else
	insert into TEMPP values(a,b,'string1 present in string2');
end if;
end; //
delimiter ;

call PROC1('DAC','CDAC');
call PROC1('mum','CDAC');

select * from TEMPP;

delete from TEMPP;
-- =======================================================================================================
/*
section 2

2.	Create a stored function by the name of FUNC1 to take three parameters, 
the sides of a triangle. 
The function should return a Boolean value:- 
TRUE if the triangle is valid, FALSE otherwise. 
A triangle is valid if the length of each side is 
less than the sum of the lengths of the other two sides.
 Check if the dimensions entered can form a valid triangle.
 Calling program for the stored function need not be written.
*/

delimiter //
create function FUNC1(a int,b int, c int)
returns boolean
deterministic
begin
if a= 0 OR b=0  OR c=0 then
	return false ;
else
	if a < (b+c) and b < (a+c) and c < (a+b) then
		return true;
	else 
		return false;
	end if;
end if;
end; //
delimiter ;

drop function FUNC1;
select FUNC1(0,0,3);
select FUNC1(6,4,3);
		
	  
