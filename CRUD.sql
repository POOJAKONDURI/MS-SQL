CREATE database db;

Select name FROM SYS.databases;

USE db;


---create table ---
CREATE table Employee(EMPID INT PRIMARY KEY,First_name varchar(10) ,Second_name varchar(10),salary float);

---insert values---
insert into Employee values(1,'Pooja','Konduri',60000);
insert into Employee values(2,'john','doe',10000);
insert into Employee values(3,'albert','konduri',80000);
insert into Employee values(4,'jilebi','rao',60000);
insert into Employee values(5,'gajala','murthy',90000);


---Read table---

SELECT * FROM Employee;

---Read  specific columns---
SELECT First_name,Second_name FROM Employee;

---Update values ---

UPDATE  Employee
SET salary = 55000
WHERE EMPID = 3;

Select * from Employee;

---delete values---

DELETE FROM Employee
where First_name = 'john';

Select * from Employee;

-----rename-----
EXEC sp_rename 'Employee.EMPID' ,'EmpID';
---truncate---
TRUNCATE table Employee;
---drop---
DROP table Employee;