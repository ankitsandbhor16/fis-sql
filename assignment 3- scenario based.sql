--scenario based assignment

use FISDB

create table BOOKS(bid int primary key,
				   title varchar(30),
				   author varchar(20),
				   isbn bigint unique,
				   published_date datetime)

insert into BOOKS values(1,'my first sql book','mary parker',981483029127,'2012-02-22 12:08:17') ,
						(2,'my second sql book','john mayer',857300923713,'1972-07-03 09:22:45') ,
						(3,'my third sql book','cary flint',523120967812,'2015-10-18 14:05:44') 

drop table reviews
select * from BOOKS
select * from REVIEWS

create table REVIEWS(id int primary key,
					 bbid int references BOOKS(bid),
					 reviewer_name varchar(30),
					 content varchar(20),
					 rating int,
					 published_date datetime)

insert into REVIEWS values(1,1,'john smith','my first review',4,'2017-12-10 05:50:11'),
						 (2,2,'john smith','my second review',5,'2017-10-13 15:05:12'),
						 (3,2,'alice walker','another review',1,'2017-10-22 23:47:10')

---1--------------------------------------------------------------
select * from BOOKS where author like '%er'
---2-------------------------------------------------------------
select b.title, b.author, r.reviewer_name from BOOKS b,REVIEWS r where bbid=bid
---3----------------------------------------------------------------
select reviewer_name from REVIEWS group by reviewer_name having count(reviewer_name)>1


create table CUSTOMER(id int primary key,
					  name varchar(30),
					  age int ,
					  addres varchar(30),
					  sal float)

insert into CUSTOMER values(1,'ramesh',32,'ahmedabad',2000),
							(2,'khilan',25,'delhi',1500),
							(3,'kaushik',23,'kota',2000),
							(4,'chaitali',25,'mumbai',6500),
							(5,'hardik',27,'bhopal',8500),
							(6,'komal',22,'mp',4500),
							(7,'muffy',24,'indore',10000)

create table ORDERR(oid int ,
					datee date,
					cid int references CUSTOMER(id),
					amount float)

insert into ORDERR values(102,'2009-10-08',3,3000),
						 (100,'2009-10-08',3,1500),
						 (101,'2009-11-20',2,1560),
						 (103,'2008-05-20',4,2060)

select * from CUSTOMER
select * from ORDERR

---4---------------------------------------------------------
select name from CUSTOMER where addres like '%o%'
---5----------------------------------------------------------
select datee,count(cid) as 'total no. of customer' from ORDERR  group by cid,datee

create table EMPLO(id int primary key,
					  name varchar(30),
					  age int ,
					  addres varchar(30),
					  sal float)

insert into EMPLO values(1,'Ramesh',32,'ahmedabad',2000),
							(2,'Khilan',25,'delhi',1500),
							(3,'Kaushik',23,'kota',2000),
							(4,'Chaitali',25,'mumbai',6500),
							(5,'Hardik',27,'bhopal',8500),
							(6,'Komal',22,'mp',NULL),
							(7,'Muffy',24,'indore',NULL)

select * from EMPLO


---6--------------------------------------------------------------
select lower(name) as lowercase_name from EMPLO where sal is null


create table STUDENTDETAIL(rno int primary key,
						   namee varchar(20),
						   age int,
						   qualification varchar(20),
						   mob varchar(10),
						   email varchar(20),
						   loc varchar(10),
						   gender char)

insert into STUDENTDETAIL values(2,'sai',22,'B.E','9952836777','sai@gmail.com','chennai','M'),
								(3,'kumar',20,'BSC','7890125648','kumar@gmail.com','madurai','M'),
								(4,'selvi',22,'B.TECH','8904567342','selvi@gmail.com','selam','F'),
								(5,'nisha',25,'M.E','7834672310','nisha@gmail.com','theni','F'),
								(6,'saisaran',21,'B.A','7890345678','saisaran@gmail.com','madurai','F'),
								(7,'tom',23,'BCA','8901234675','tom@gmail.com','pune','M')

select * from STUDENTDETAIL

--7------------------------------------------------------------------
select gender,count(gender) as 'no of person' from STUDENTDETAIL group by gender


create table COURSEDETAIL (cid varchar(5) primary key,
						   cname varchar(20),
						   startdate date,
						   enddate date,
						   fee float)

insert into COURSEDETAIL values('DN003','dotnet','2018-02-01','2018-02-28',15000),
							   ('DV004','datavalidation','2018-03-01','2018-04-15',15000),
							   ('JA002','advancedjava','2018-01-02','2018-01-20',10000),
							   ('JC001','corejava','2018-01-02','2018-01-12',3000)

select * From COURSEDETAIL

create table COURSEREGISTRATION(rno int references STUDENTDETAIL(rno),
								ccid varchar(5) references COURSEDETAIL(cid),
								batch VARchar(2))

insert into COURSEREGISTRATION values(2,'DN003','FN'),
									 (3,'DV004','AN'),
									 (4,'JA002','FN'),
									 (2,'JA002','AN'),
									 (5,'JC001','FN')
								
select * from COURSEREGISTRATION

---8--------------------------------------------------------------------------------
select c1.cname , count(c2.ccid)  as 'total registration' from COURSEDETAIL c1 left join COURSEREGISTRATION c2 on c1.cid=c2.ccid 
where startdate between '2018-01-02' and '2018-02-28' group by c1.cname 

create table CUSTT( cusid int primary key,
					first_name varchar(20),
					last_name varchar(20))

insert into CUSTT values(1,'george','washington'),
						(2,'john','adams'),
						(3,'thomas','jefferson'),
						(4,'james','madison'),
						(5,'james','monroe')

create table ORDE (ordid int primary key,
				  or_date date,
				  amount varchar(10),
				  cccid int references CUSTT(cusid))
				  drop table ord
				

insert into ORDE values(1,'1776-07-04','$234.56',1),
						(2,'1760-03-14','$78.50',3),
						(3,'1784-05-23','$124.00',2),
						(4,'1790-09-03','$65.50',3),
						(5,'1795-07-21','$25.50',4),
						(6,'1787-11-27','$14.40',5)

select * from ORDE

---9---------------------------------------------------------------------------
select  c1.first_name,c1.last_name from CUSTT c1 join ORDE c2 on c1.cusid=c2.cccid 
group by c1.first_name, c1.last_name having count(c2.cccid)=2

---10-------------------------------------------------------------------------------
select reverse(namee) as reversename, upper(loc) as location from STUDENTDETAIL

---11---------------------------------------------------------------------------
create view new_view 
as o3.productname,o2.orderquantity,o1.ordernumber from orderr o1 join orderitem o2 join product o3 on o1.id=o2.id=o3.id 


---12-----------------------------------------------------------------------------
select t1.cname from STUDENTDETAIL t2 join COURSEREGISTRATION t3 on t2.rno=t3.rno join COURSEDETAIL t1 on t1.cid=t3.ccid where t2.namee='nisha'