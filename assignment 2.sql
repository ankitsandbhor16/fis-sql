
---assignment 2
select * from EMP
select *from DEPT
--1
select distinct e1.ename as manager from EMP e1 join EMP e2 on e1.empno=e2.mgrid
--2
select ename,sal from EMP where sal>1000
--3
select ename,sal from EMP where ename!='james'
--4
select * from EMP where ename like 's%'
--5
select * from EMP where ename like '%a%'
--6
select * from EMP where ename like '__l%'
--7
select ename,sal/30 as 'daily sal' from EMP where ename='jones'
--8
select sum(sal) as 'total monthly sal of all emp' from EMP
--9
select avg(sal*12) as 'avg annual sal' from EMP
--10
select ename,job,sal,deptno from EMP where job!='salesman' or deptno!=30
--11
select distinct(deptno) from EMP
--12
select ename,sal from EMP where sal>1500 and deptno in(10,30)
--13
select ename,job,sal from EMP where job in('manager', 'analyst')and sal not in(1000,3000,5000)
--14
select ename,sal,comm from EMP where comm >any(select sal=sal+((sal*10)/100) from EMP)
--15
select ename from EMP where ename like '%l%l%' and deptno=30 or mgrid=7782
--16
select ename,count(ename) as total_emp from EMP where datediff(year,hiredate,getdate())>10 and datediff(year,hiredate,getdate())<20 group by ename
--17
select d.dname,e.ename from EMP e,DEPT d where d.deptno=e.deptno order by dname,ename desc
--18
select datediff(year,hiredate,getdate()) as experience from EMP where ename='miller'