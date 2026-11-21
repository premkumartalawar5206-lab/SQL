create database organization1;

use organization1;
CREATE TABLE Employees (
	emp_id		INT PRIMARY KEY,
    emp_code	VARCHAR(10) NOT NULL UNIQUE,
    first_name	VARCHAR(50) NOT NULL,
	last_name	VARCHAR(50) NOT NULL,
	email		VARCHAR(100) UNIQUE,
    age			INT CHECK (age>=18),
    salary		DECIMAL(10,2) DEFAULT 30000.00,
    department	VARCHAR(30) NOT NULL DEFAULT 'General',
    gender		CHAR(1) CHECK (gender IN ('M','F','O'))
    );

select*from Employees;

INSERT INTO employees VALUES 
	(01,'EP01','Prem','Talawar','prem@gmail.com',21,'25000.00','DA','M'),
	(02,'EP02','Akash','Musalmari','ak@gmail.com',22,'25000.00','DA','M'),
    (03,'EP03','Ishwari','Musalmari','ish@gmail.com',22,'25000.00','DA','F'),
    (04,'EP04','Ravi','Talawar','Ravi@gmail.com',23,'25000.00','DS','M'),
    (05,'EP05','Swati','Mankavi','swati@gmail.com',21,'25000.00','DA','F');

select*from Employees;

create database organization2;
use organization2;
CREATE TABLE Employees1 (
	emp_id		INT PRIMARY KEY,
    emp_code	VARCHAR(10) NOT NULL UNIQUE,
    first_name	VARCHAR(50) NOT NULL,
	last_name	VARCHAR(50) NOT NULL,
	email		VARCHAR(100) UNIQUE,
    age			INT CHECK (age>=18),
    salary		DECIMAL(10,2) DEFAULT 30000.00,
    department	VARCHAR(30) NOT NULL DEFAULT 'General',
    gender		CHAR(1) CHECK (gender IN ('M','F','O'))
    );
    
INSERT INTO Employees1 VALUES 
	(01,'EP01','Prem','Talawar','prem@gmail.com',21,DEFAULT,'DA','M'),
	(02,'EP02','Akash','Musalmari','ak@gmail.com',22,'25000.00','DA','M'),
    (03,'EP03','Ishwari','Musalmari','ish@gmail.com',22,'25000.00','DA','F'),
    (04,'EP04','Ravi','Talawar','Ravi@gmail.com',23,'25000.00',DEFAULT,'M'),
    (05,'EP05','Swati','Mankavi','swati@gmail.com',21,'25000.00','DA','F');
    
select*from Employees1;
    
select*from orders;

select orderid,orderdate,profit from orders;

select*from orders where region='south';

-- try to select all records where all records are related to consumer
select*from orders where segement='consumer';

-- try to select all records where all records are category furniture
select*from orders where category='furniture';

-- try to select all records related to subcategory chairs  
select*from orders where subcategory='chairs';

select*from orders where quantity>4;

-- try to get all records where profit is greater than 5000
select*from orders where sales>5000;

-- try to select all those records where quantity is equal to 3
select*from orders where quantity=3;

-- try to get all records where discount is more than 50%
select*from orders where discount>0.5;

-- try to get all records where their are loss
select*from orders where profit=0;

-- try to get all records where their is no profit or no loss

-- and/or/not 

select*from orders where region='south' and segement='consumer';
select*from orders where region='south' or segement='consumer';

-- try to all records related to region south and profit more than 3000
select*from orders where region='south' and profit>3000;

-- try to select region south,east
select*from orders where region='south' or region='east';

-- try to get all records relted to city los angeles and quantity more than 3
select*from orders where city='los angeles' and quantity>3;

select*from orders where region like 's%';

-- try to find all subcategory that starts with 'A'

select*from orders where subcategory like 'a%';

-- A% -- starts with
-- %A -- ends with
-- E%T
-- %or% -- somewhere in the middle in a sentance or is there
-- A__ __t

-- try to get all rows with technolgy using no
select*from orders where category like '%no%';

-- try to get all city that ends with k
select*from orders where city like '%k';

-- try to get all city that strats with a and ends with a
select*from orders where city like 'a%a';

-- try to get all city with 7 char
select*from orders where city like '_______';

-- try to get all city that starts with t and ends with y
select*from orders where city like 't%y';

-- try to get all state that ends with a
select*from orders where state like '%a';

-- agg functions

select avg(profit) as avg_profit from orders;

-- try to find avg quantity
select round(avg(quantity)) as avg_quantity from orders;

-- try to find avg discount
select avg(discount) as avg_discount from orders;

-- try to find avg profit generated from south
select round(avg(profit)) as avg_profit from orders where region='south';

-- try to find avg quantity sold in east
select round(avg(quantity)) as avg_quantity from orders where region='east';

-- sum
select round(sum(sales)) as sum_of_sales from orders;

-- try to find sum of sales in technology
select round(sum(sales)) as sum_of_sales from orders where category='technology';

-- try to find sum of quantity sold in shipmode standard class
select round(sum(quantity)) as sum_of_quantity from orders where shipmode='standard class';

select min(sales)from orders;
select max(sales)from orders;
select count(*)from orders;

-- try to get max quantity
select max(quantity)from orders;

-- try to get avg sales in south
select avg(sales)from orders where region='south';

-- try to get sum of sales in technology
select sum(sales)from orders where category='technology';

-- try to get min qunatity
select min(quantity)from orders;

-- try to get count of consumer
select count(*)from orders where segement='consumer' ;

-- try to get count of standard class
select count(*)from orders where shipmode='standard class' ;

-- select avg quantity in central
select round(avg(quantity))from orders where region='central';

-- group by 

select round(sum(sales)),region from orders group by region;


select sum(sales),segement from orders group by segement;

-- try to get avg quantity in all regions
select round(avg(quantity)),region from orders group by region;

-- try to get sum of sales in all subcategories and arrange it in desc order
select sum(sales),subcategory from orders group by subcategory order by sum(sales) desc limit 1;

-- try to get min sales in all shipmode
select min(sales),shipmode from orders group by shipmode;

-- try to get max sales in all segement
select max(sales),segement from orders group by segement;

-- try to get avg profit in the category which has heighest avg profit
select round(avg(profit)),category from orders group by category order by avg(profit) desc limit 1;

-- try to get records where profit is greater than 200
select*from orders where profit>200;
-- try get count of west region
select count(*) from orders where region='west';

-- group by
select *from orders;
select sum(sales),region from orders group by region having sum(sales)>600000;

-- select those regions whose quantity is more than 2000
select sum(quantity),region from orders group by region having sum(quantity)>2000;

-- select those segement whose count is more than 5000 
select count(segement),segement from orders group by segement having count(segement)>5000;

-- select those subcategory whose avg sales is more than 10000
Select round(avg(sales)), subcategory from orders group by subcategory having avg(sales)>1000;

-- select those shipmode whose avg quantity is more tha 7
Select round(avg(quantity)), shipmode from orders group by shipmode having avg(quantity)>3;

-- select those regions with total quantity more than 5000
Select sum(quantity), region from orders group by region having sum(quantity)>7000;

-- select those regions which appered more than 4000
Select count(region), region from orders group by region having count(region)>3000;

-- subquery must be enclosed within parenthesis.
-- oredr by cannot be used in a subquery.
-- between operator cannot be used
-- a subquery can have only single column in subquery

select*from orders where sales=(select min(sales) from orders);

select min(sales) from orders;
select * from orders where sales=0.444;

-- try to get all records with max quantity
select*from orders where quantity=(select max(quantity) from orders);

-- try to get all records where sales is more than avg sales
select*from orders where sales>(select avg(sales) from orders);

-- try to get all records with max discount
 select * from orders where discount=(select max(discount)from orders);
 
-- try to get all records where quantity is more than avg quantity
select * from orders where quantity>(select round(avg(quantity)) from orders);

-- try to get all records with quantity as 3 
select * from orders where quantity=3;

-- foreign key

create database Orz1;

use Orz1;
create table customer(
	cust_id int primary key,
    cust_name varchar(50),
    city varchar(50)
    );
select *from customer;

create table orders(
	order_id int primary key,
    order_date date,
    amount decimal(10,2),
    cust_id int,
    foreign key (cust_id)
    references customer (cust_id)
    );
    
insert into customer values 
	(101,'John','Belagavi'),
    (102,'Mary','Hubli');

select *from customer;

insert into orders values
	(1,'2026-11-18',5000,101),
    (2,'2026-11-18',4000,102);

select *from orders;

-- Joints       
    -- intersection common element present in table
    -- union all the values present in table
    -- left join all the table present in left table
	-- right join all the table present in right tabl

create database joins;
use joins;
    
create table employee
    (empid varchar(10) unique, 
    empname varchar(20),
    salary int,
    deptid varchar(10) primary key);
    
insert into employee values
    ('E1','John',450000,'D1'),
	('E2','Mary',73000,'D2'),
	('E3','Steve',86000,'D3'),
	('E4','Helen',60000,'D4'), 
	('E5','Joe',35000,'D7');

select * from employee;

-- create department table
create table department
    (depid varchar(10) primary key,
    deptname varchar(10),
    dept_head varchar(50));
    
insert into department values
    ('D1','HR',"joyal"),
	('D2','Admin',"jayant"),
	('D3','Sales',"radha"),
	('D4','IT',"roshan"),
	('D5','HR',"samule");

select * from department;
select * from employee;

-- inner join
select e.empid,empname,e.salary,e.deptid,d.deptname
    from employee as e
    inner join department as d
    on e.deptid=d.depid;
    
-- left join
select e.empid,empname,e.salary,e.deptid,d.deptname
    from employee as e
    left join department as d
    on e.deptid=d.depid;

 -- right join
select e.empid,empname,e.salary,e.deptid,d.deptname
    from employee as e
    right join department as d
    on e.deptid=d.depid;
    
  -- union
    select e.empid,empname,e.salary,e.deptid,d.deptname
    from employee as e
    left join department as d
    on e.deptid=d.depid
    union
    select e.empid,empname,e.salary,e.deptid,d.deptname
    from employee as e
    right join department as d
    on e.deptid=d.depid;

    
















