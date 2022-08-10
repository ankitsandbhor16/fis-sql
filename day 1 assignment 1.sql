create database FISDB

create table EMP(empno int primary key,
				ename varchar(30),
				job varchar(20),
				mgrid int,
				hiredate varchar(30),
				sal float,
				comm int,
				deptno int references DEPT(deptno))

insert into EMP(empno,ename,job,mgrid,hiredate,sal,comm) values(7369,'smith','clerk',7902,'17-dec-80',800,20)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,comm,deptno) values(7499,'allen','salesman',7698,'20-feb-81',1600,300,30)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,comm,deptno) values(7521,'ward','salesman',7698,'22-feb-81',1250,500,30)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7566,'jones','manager',7839,'02-apr-81',2975,20)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,comm,deptno) values(7654,'martin','salesman',7698,'28-sep-81',1250,1400,30)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7698,'blake','manager',7839,'01-may-81',2850,30)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7782,'clark','manager',7839,'09-jun-81',2450,10)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7788,'scott','analyst',7566,'19-apr-87',3000,20)
insert into EMP(empno,ename,job,hiredate,sal,deptno) values(7839,'king','president','17-nov-81',5000,10)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,comm,deptno) values(7844,'turner','salesman',7698,'08-sep-81',1500,0,30)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7876,'adams','clerk',7788,'23-may-87',1100,20)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7900,'james','clerk',7698,'03-dec-81',950,30)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7902,'ford','analyst',7566,'03-dec-81',3000,20)
insert into EMP(empno,ename,job,mgrid,hiredate,sal,deptno) values(7934,'miller','clerk',7782,'23-jan-82',1300,10)

create table DEPT(deptno int primary key,dname varchar(30),loc varchar(20))
insert into DEPT values(10,'accounting','new tork'),(20,'research','dallas'),(30,'sales','chicago'),(40,'operations','boston')

drop table EMP
select * from DEPT
select * from EMP

1---
select * from EMP where ename like 'a%'
2----
select * from EMP where job!='manager'
3---
select empno,ename,sal from EMP where sal between 1200 and 1400
4----
select sal as 'before sal', sal+sal*0.1 as 'afetr sal' from EMP where deptno=20
5---
select count(*) as 'clerk count'from EMP where job='clerk'
6----
select job, count(*) as 'count' ,avg(sal) as 'avg sal' From EMP group by job
7---
select * from EMP where sal=(select max(sal) from EMP)or  sal=(select min(sal) from EMP) 
8--- 
select * from DEPT where deptno not in (select deptno from EMP)
9---
select ename ,sal from EMP where job='analyst' and sal>1200 and deptno=20 order by ename
10---*
select DEPT.deptno,DEPT.dname,sum(sal) as total_sal from EMP,DEPT where EMP.deptno=DEPT.deptno group by DEPT.deptno,DEPT.dname
11---
select ename ,sal from EMP where ename in('miller','smith')
12---
select ename from EMP where ename like '[am]%'
13---
select ename, sal*12 as 'yeraly sal' from EMP where ename='smith'
14---
select ename, sal from EMP where sal not between 1500 and 2850
