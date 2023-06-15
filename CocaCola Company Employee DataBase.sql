--Creating a Database
Create Database CocaCola

--Deleting a Database
Drop database CocaCola

--Activating the Database
Use CocaCola

--Create Table
Create Table Customer_details(id int,name varchar(10),mobile_number varchar(10))

--Seeing the Table
Select * from Customer_details

--Inserting values to the table
insert into Customer_details values (1,'Ram','8951567425')
insert into Customer_details values (2,'Sita','8951567426')
insert into Customer_details values (3,'Shyam','8951567427')
insert into Customer_details Values (4,'Sivom','8951567421')
insert into Customer_details Values (5,'Shaurya','8951567423')
insert into Customer_details Values (6,'Hema','8951567423')
insert into Customer_details Values (107,'Hema Madhuri Paladugu','895157618')

Select * from Customer_details

Create Table Customer_info(id int,product varchar(10))

insert into Customer_info Values (1,'Diet Coke')
insert into Customer_info Values (2,'Coke')
insert into Customer_info Values (3,'Pepsi"')
insert into Customer_info Values (7,'7up')
insert into Customer_info Values (8,'Sprite')

Select * from Customer_info

--Select * from Parent table inner join Child Table on Parent table.key=child table .key

Select * from Customer_details inner join Customer_info on Customer_details.id=Customer_info.id
Select * from Customer_details left join Customer_info on Customer_details.id=Customer_info.id
Select * from Customer_details right join Customer_info on Customer_details.id=Customer_info.id
Select * from Customer_details full outer join Customer_info on Customer_details.id=Customer_info.id

-- Truncating the Table
Truncate table Customer_details

--Dropping the Table
Drop Table Customer_details

--Fetching Certain Column
Select name,id from Customer_details

--Giving Condition to the Table to fetch the required data
Select * from Customer_details where id =2

--Deleting the Data
Delete from Customer_details where id = 6 or id =5

--Giving multiple Condition to the table
Select * from Customer_details where id>2 and name ='Shaurya'

Select * from Customer_details where id>2 or name = 'Ram'

Select * from Customer_details where not name ='Shaurya'

--Updating the data in the table
 Update Customer_details set id = 101 Where name ='Ram'
 Update Customer_details set id = 102 Where name ='Sita'
 Update Customer_details set id = 103 Where name ='Shyam'
 Update Customer_details set id = 104 Where name ='Sivom'
 Update Customer_details set id = 105 Where name ='Shaurya'
 Update Customer_details set id = 106 Where name ='Hema'

--Altering the table
Alter Table Customer_details alter Column name varchar(30)
EXEC sp_rename 'Customer_details.name','Candidate_name','COLUMN'
EXEC sp_rename 'Customer_details.Candidate_name','name','COLUMN'

--Aggregate Function and Alias

Create Table Customer_deta(id int,Sales float)
Select * from Customer_deta
insert into Customer_deta values (1,23.29)
insert into Customer_deta values (2,22.19)
insert into Customer_deta values (3,24.79)
insert into Customer_deta values (4,25.89)
insert into Customer_deta values (5,22.69)
insert into Customer_deta Values (7,Null)

Select Sum(Sales) as 'Sum of Sales' from Customer_deta
Select Min(Sales) as 'Min of Sales' from Customer_deta
Select Max(Sales) as 'Max of Sales' from Customer_deta
Select AVG(Sales) as 'Average of Sales' from Customer_deta
Select Count(id) as 'Count of Id' from Customer_deta

--Like Operator
Select * from Customer_details where name like '%m'
Select * from Customer_details where name like 'R%'
Select * from Customer_details where name like 'S%a'
Select * from Customer_details where name like 'S__a'

--In Operator
Select * from Customer_details where name in ('Ram','Shaurya')
Select * from Customer_details where id in (102,103)

--Between Operator
Select * from Customer_deta where Sales between 23 and 25

--Union
Select * from Customer_deta

Create Table Customer_data(id int,Sales float)
Select * from Customer_data
insert into Customer_data values (8,27.28)
insert into Customer_data values (9,29.13)
insert into Customer_data values (12,26.71)

Create Table Customer_data1(id int,Sales float)
Select * from Customer_data1
insert into Customer_data1 values (10,27.28)
insert into Customer_data1 values (11,29.13)
insert into Customer_data1 values (6,26.71)

Select * from Customer_deta
Union
Select * from Customer_data
Union
Select * from Customer_data1

--Sorting
Select * from Customer_details order by name asc
Select * from Customer_details order by name desc

---Importing excel Data
select * from [dbo].[Orders$]
select * from [dbo].[Region_Cost$]
select * from [dbo].[Returns$]
select * from [dbo].[Users$]
select * from [dbo].['Orders Weekly$']

/*Home work */

/*Join table orders, region_cost,users,returmns (find out key b/w the tables,Inner,left,right & full outer)*/

Select * from [dbo].[Orders$] inner join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region inner join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] inner join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region
Select * from [dbo].[Orders$] left join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region left join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] left join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region
Select * from [dbo].[Orders$] right join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region right join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] right join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region
Select * from [dbo].[Orders$] full outer join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region full outer join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] full outer join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region

/* condition for join statements */
Select * from [dbo].[Orders$] inner join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region inner join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] inner join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region where Cost = 2000000

/* Order By for Join statements */
Select * from [dbo].[Orders$] inner join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region inner join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] inner join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region where Cost = 2000000 ORDER BY sales desc

Select * from [dbo].[Orders$] inner join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region inner join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] inner join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region where Cost = 2000000 and Profit>0 order by sales desc

Select * from [dbo].[Orders$] inner join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region inner join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]=[dbo].[Returns$].[Order ID] inner join [dbo].[Users$] on [dbo].[Orders$].Region = [dbo].[Users$].Region where Cost = 2000000 and Profit>0 and [Order Priority]='high'order by sales desc

/*Do union between orders & orders weekly */
Select * from [dbo].[Orders$]
Union
Select * from [dbo].['Orders Weekly$']

/*James was asked by his manager to get all the customer names in orders table staring with A and ends with E and sort the table using sales column */
Select * from [dbo].[Orders$] where [Customer Name] like 'A%e' order by [Sales] asc
Select * from [dbo].[Orders$] where [Customer Name] like 'A%e' order by [Sales] desc

--CTE(COMMON TABLE EXPRESSION) 
WITH Output_1 as (select * from [dbo].[Orders$] 
union
select * from [dbo].['Orders Weekly$'] ) select * from Output_1 where [Order Priority]='Medium' order by Sales Desc   
       
--Creating a view table(A view can not be altered)
Create view V1 as (select * from [dbo].[Orders$] 
union
select * from [dbo].['Orders Weekly$'] )

select * from V1 where [Order Priority]='Medium' order by Sales Desc

--Group by (Group by can not function without any aggregation function)
select region, sum (sales) as 'sum of sales'  from Orders$ group by Region order by Region Asc

--Having clause (Having caluse can not function without Group by or any aggregate function)(where cannot function with groupby)(sum(sales) is a aggeration functiom here)
select region, sum (sales) as 'sum of sales'  from Orders$ group by Region  having region='South' order by Region Asc 

--create table
Create table Customer_details1 (ID int, NAME varchar(40),Age int)

select * from Customer_details1

--Inserting values
Insert into Customer_details1 values(1,'Hema',25)
Insert into Customer_details1 values(2,'Madhuri',235)
Insert into Customer_details1 values(3,'Latha',45)
Insert into Customer_details1 values(4,'Ramya',25)
Insert into Customer_details1 values(3,'Sekhar',32)
Insert into Customer_details1 values(6,'Ramya',41)
Insert into Customer_details1 values(7,'Nani',66)

--Inserting a column
alter table Customer_details1 add Salary Int 

--Updating the values in Salary column
Update Customer_details1 set Salary = 100000 Where NAME ='Hema'

--Droping the column Salary
alter table Customer_details1 drop column Salary

--Rank
select *,Rank() OVER (order by age desc) as Rank from Customer_details1

--Dense Rank
Select *,DENSE_RANK() over (order by age desc) as Dense_Rank from Customer_details1

--Row Number
Select *,ROW_NUMBER() over (order by age desc) as Row_Number from Customer_details1

--Finding out the second highest aged person
with output as (
Select *,DENSE_RANK() over (order by age desc) as Dense_Rank from Customer_details1 ) select * from output where Dense_Rank=2

--Finding the 10th row data
with output as (
Select *,ROW_NUMBER() over (order by age desc) as ROW_NUMBER from Customer_details1 ) select * from output where ROW_NUMBER=10

--Row Number Partition Output
Select *,ROW_NUMBER() over (partition by name order by age desc) as Row_Number from Customer_details1

--Deleting duplicates 
With output as (
Select * , ROW_NUMBER() Over (partition by name Order by Age Desc) As ROW_NUMBER From Customer_details1) delete from output where ROW_NUMBER>1

---Date time Function
select CURRENT_TIMESTAMP/* get system date & time*/
select day('2023-05-21')
select month('2023-05-21')
select year('2023-05-21')
select GETDATE()/* Actual Date */
select GETUTCDATE() /*universal time zone*/
select ISDATE('2023-05-21')
select sysdatetime()/* More decimal values*/

---System secondary Function
select SESSION_USER  /* returns dbo database object in office return username */
select SYSTEM_USER /* return server name */
select USER_NAME()
select coalesce(null,'sekhar',null,'Hema','ashwini')
select coalesce(null,null,null,'sekhar',null,'Hema','ashwini') /* Coalesce:select first non null value in a field */
select CONVERT(int, 26.85)
select CONVERT(float, 26.85)

--Numeric Function
select CEILING(26.85)
select CEILING(26.15)
select FLOOR(26.85) 
select FLOOR(26.05)
select round(26.85,1) 
select Round(26.85,0)
select power(2,3)
select SQRT(16)
SELECT SIN(45)
SELECT TAN(100)
SELECT COS(45)
SELECT ACOS(0.5)
SELECT ASIN(1)
SELECT ATAN(0.45)
SELECT ABS(-18)
SELECT ABS(17)
SELECT LOG (2)
SELECT LOG10(10)
SELECT RAND()
SELECT RAND(100)
SELECT SIGN(-9)
SELECT SIGN(9)

--string function
select DATALENGTH('ashwini')
select LEFT('ashwini',3)
select RIGHT('ashwini',4)
select UPPER('ashwini')
select LOWER('ASHWINI')
select REVERSE('ashwini')
select SUBSTRING('ashwini',4,3)
select LTRIM('  soham')
select RTRIM('soham  ')
select CONCAT('ashwini',':','kamble')

--constrain 
create table employee (id int primary key identity ,name varchar(10), gender_id int)
select * from employee
insert into employee values ('ram',1)
insert into employee values ('radha',2)
insert into employee values ('sita',2)
insert into employee values ('krishna',1)
insert into employee values ('leena',2)

--IIf statements
Select name ,gender_id,IIF(gender_id=1,'male','female') as gender from employee

--Case statements
Select name,gender_id,case when gender_id=2 then 'female' else 'male' end as gender from employee

--Version
select @@VERSION

--SPID
select @@SPID

--Language Name
Select @@LANGID
select @@LANGUAGE

--Max Connections
select @@MAX_CONNECTIONS
select @@CONNECTIONS

--Max Precision
select @@MAX_PRECISION

--Transactional statements
declare @mark int = 50 /* mark is variable of type integer*/
if @mark>=50 
begin 
print 'Congraulations!';
print 'You have pass the examination';
end
else
begin
print 'you failed the examination';
print 'Better luck next time!';
end

--Else-If statement
declare @total_marks int = 700
if @total_marks>=900
begin
print 'congraulation! You are eligible for free scholarship';
end
else if @total_marks>=800
begin
print 'congraulation! You are eligible for 50% scholarship';
end
else if @total_marks>=750
begin
print 'congraulation! You are eligible for 10% scholarship';
end
else
begin
print 'Sorry! You are not eligible for scholarship';
end


--Goto Statement
declare @total_marks int
set @total_marks=49
if @total_marks>=50
goto Pass
if @total_marks<50
goto Fail
Pass: 
print 'congraulation! you have passed'
return
Fail:
Print 'Betterluck nexttime'
return 
go

--creating calculated fields & advanced constrains
Create table employee_11(Customer_ID int not null primary key identity ,Customer_1name varchar(20) not null, 
Customer_2name varchar(20) not null, Age int)

select * from Employee_11

Insert into employee_11 values ('Arun','Kumar',46)
Insert into employee_11 values (Null,'Kumar',46)
Insert into employee_11 values ('Arun',Null,46)
Insert into employee_11 values ('Ashwini','Kamble',Null)
Insert into employee_11 values ('shankar','Jadhav',36)
Insert into employee_11 values ('Akshita','Parab',26)
Insert into employee_11 values ('Prerana','Mali',16)
Insert into employee_11 values ('Akansha','Tiwari',66)
Insert into employee_11 values ('Arpita','Kanal',46)

Update employee_11 set Age=46 where Customer_ID=4
Update employee_11 set Customer_ID=2 where Customer_1name='Ashwini'

--concatination
Select * , CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11

--Move full name column to first 
With output as (
Select * , CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11) 
Select Customer_ID,[Full Name],Age from output

--store procedure(acts like a button)
Create procedure P1 as With output as (
Select * , CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11) 
Select Customer_ID,[Full Name],Age from output

/* check in after refresh server  DB-->cocacola-->programmability-->stored procedure) */

Exec P1

Drop Procedure P1

Select *,(Age*1000) as 'Salary',CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11

With table_1 as ( Select *,(Age*1000) as 'Salary',CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11)
Select Customer_ID,[Full Name],Age,Salary from table_1

Create procedure  P2 as with table_1 as (
Select *,(Age*1000) as 'Salary',CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11)
Select Customer_ID,[Full Name],Age,Salary from table_1 

EXEC P2

Drop procedure P2

--Triggers (only works with backend team)
 create table Employee_Test(emp_id int identity,emp_name varchar(20), emp_salary decimal(10,2))

 select * from Employee_Test

insert into Employee_Test values ('Hema',700000)
insert into Employee_Test values ('Madhu',800900)
insert into Employee_Test values ('Parthu',950000.96)
insert into Employee_Test values ('Sekhar',8865432.15)
insert into Employee_Test values ('Reddy',8654321.143)
insert into Employee_Test values ('Chaithu',6544321.143)
insert into Employee_Test values ('Divya Sree',6544321.143)
insert into Employee_Test values ('Chinnu',34544321.143)

create table Employee_Test_Audit (emp_id int,emp_name varchar(20),emp_salary decimal(10,2),audit_actions varchar(30),audit_timestmp datetime)

select * from Employee_Test_Audit
/* target_after_insertion is a trigger name  & @emp_id is a temporary variable & i. stands for insertion 
Triggers are performed in 3 states (insert,update &  delete record */
create trigger Target_after_insertion on Employee_Test 
for insert as 
declare @emp_id int;
declare @emp_name varchar(30);
declare @emp_salary decimal(10,2);
declare @audit_actions varchar(30);
select @emp_id=i.emp_id from inserted i;
select @emp_name=i.emp_name from inserted i;
select @emp_salary=i.emp_salary from inserted i;
select @audit_actions = 'Action has been performed & the record has been inserted';
Insert into Employee_Test_Audit (emp_id,emp_name,emp_salary,audit_actions,audit_timestmp)
values(@emp_id,@emp_name,@emp_salary,@audit_actions,GETDATE());
print 'Trigger has been fired and the records are updated in the second table'
go

drop trigger Target_after_insertion

---Lead & Lag
create Table Emp (emp_name varchar(30), emp_salary decimal(10,2))
select * from Emp
insert into emp values('hema',20000)
insert into emp values('Ram',43000)
insert into emp values('Sita',220000)
insert into emp values('Laya',50000)

select *,lag(emp_salary) over (order by emp_salary) as 'previous_lag' from Emp
select *,lead(emp_salary) over (order by emp_salary) as 'previous_lead' from Emp

--Create Database
create database Airline
use Airline

select * from [dbo].[Airline1$]
select * from [dbo].[Airline2$]

--Creating calculative field
select * ,('Airline1') as Airline_Name from [dbo].[Airline1$]
union
select * ,('Airline2') as Airline_Name from [dbo].[Airline2$]

--Create View of the Table
create view V2 as 
(select * ,('Airline1') as Airline_Name from [dbo].[Airline1$]
union
select * ,('Airline2') as Airline_Name from [dbo].[Airline2$])

select * from v2


create table hema(id int,tatus varchar(20))
select * from hema
insert into hema values(1,'closed')
insert into hema values(1,'closed')
insert into hema values(1,'inprogress')
insert into hema values(2,'closed')
insert into hema values(2,'closed')
insert into hema values(3,'closed')
insert into hema values(3,'closed')
insert into hema values(3,'closed')

select * from hema where tatus in ('closed') And id Not in (select id from hema where tatus in ('Inprogress')) 