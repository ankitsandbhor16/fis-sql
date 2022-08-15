
--special assignment

create database IT
use IT

create table CLIENT(cid int primary key,
					cname varchar(40) not null,
					addres varchar(30),
					email varchar(30) unique,
					phone bigint,
					business varchar(20) not null)

insert into CLIENT values(1001,'ACME utilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing'),
							(1002,'Trackon consultants','Mumbai','consult@trackon.com',8734210090,'Consultant'),
							(1003,'Moneysaver distributors','Kolkata','save@moneysaver.com',7799886655,'Reseller'),
							(1004,'Lawful','Chennai','justice@lawful.com',9210342219,'Professional')


create table EMPLOYEE(eno int primary key,
						ename varchar(20) not null,
						job varchar(15),
						sal float check(sal>0),
						deptno int references DEPARTMENT(deptno))
						
insert into EMPLOYEE values(7001,'sandeep','analyst',25000,10),
						   (7002,'rajesh','designer',30000,10),
						   (7003,'madhav','developer',40000,20),
						   (7004,'monoj','developer',40000,20),
						   (7005,'abhay','designer',35000,10),
						   (7006,'uma','tester',30000,30),
						   (7007,'gita','tech. writer',30000,40),
						   (7008,'priya','tester',35000,30),
						   (7009,'nutan','developer',45000,20),
						   (7010,'smita','analyst',20000,10),
						   (7011,'anand','project mgr',65000,10)



create table DEPARTMENT(deptno int primary key,
						dname varchar(15) not null,
						loc varchar(20))

insert into DEPARTMENT values(10,'design','pune'),
							  (20,'development','pune'),
							  (30,'testing','mumbai'),
							  (40,'document','mumbai')


create table PROJECT(pid int primary key,
					 descr varchar(30) not null,
					 startdate date,
					 planned_end_date date,
					 actual_end_date date,
					 budget bigint check(budget>0),
					 cid int references CLIENT(cid),
					 constraint aed check(planned_end_date<actual_end_date))
					 

insert into PROJECT values(401,'inventory','2011-04-01','2011-10-01','2011-10-31',150000,1001),
						   (402,'accounting','2011-08-01','2012-01-01',NULL,500000,1002),
						   (403,'payroll','2011-10-01','2011-12-31',NULL,75000,1003),
						   (404,'contact mgmt','2011-11-01','2011-12-31',NULL,50000,1004)


create table EMPPROJECTTASK(pid int references PROJECT(pid),
							empno int references EMPLOYEE(eno),
							startdate date,
							enddate date,
							task varchar(25) not null,
							status varchar(15) not null
							primary key(pid,empno))

insert into EMPPROJECTTASK values(401,7001,'11-04-01','11-04-20','system analysis','completed'),
								 (401,7002,'11-04-21','11-05-30','system design','completed'),
								 (401,7003,'11-01-01','11-07-15','coding','completed'),
								 (401,7004,'11-07-18','11-09-01','coding','completed'),
								 (401,7006,'11-09-03','11-09-15','testing','completed'),
								 (401,7009,'11-09-18','11-10-05','code change','completed'),
								 (401,7008,'11-10-06','11-10-16','testing','completed'),
								 (401,7007,'11-10-06','11-10-22','documentation','completed'),
								 (401,7011,'11-10-22','11-10-31','sign off','completed'),
								 (402,7010,'11-08-01','11-08-10','system analysis','completed'),
								 (402,7002,'11-08-22','11-09-30','system design','completed'),
								 (402,7004,'11-10-01',NULL,'coding','in progress')
							 

	
	select * from CLIENT
	select * from EMPLOYEE
	select * from DEPARTMENT
	select * from PROJECT
	select * from EMPPROJECTTASK