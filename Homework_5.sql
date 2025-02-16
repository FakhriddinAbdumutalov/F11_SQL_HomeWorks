
 
---------------------------------------------- Homework 5 par 1----------------------------------------------


--Puzzle 1. You are tasked with providing an audit of two shopping carts.
--Write an SQL statement to transform the following tables into the expected output

CREATE TABLE #Cart1
(
    Item  VARCHAR(100) PRIMARY KEY
);

CREATE TABLE #Cart2
(
    Item  VARCHAR(100) PRIMARY KEY
);

INSERT INTO #Cart1 (Item) 
VALUES ('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');

INSERT INTO #Cart2 (Item) 
VALUES ('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');

select c1.Item as 'Item Cart 1',
       case when c2.Item = c1.Item then c1.Item
       else null
	   end as 'Item Cart 2'
from #Cart1 as c1
left join #Cart2 as c2 on c2.Item = c1.Item
union 
select case when c1.Item = c2.Item then c2.Item
       else null
	   end as 'Item Cart 1',
	   c2.Item as 'Item Cart 2'
from #Cart2 as c2
left join #Cart1 as c1 on c1.Item = c2.Item
order by c1.Item desc;

--Puzzle 2. There are Employees and Nums table. You have to generate five copies of each employee.
--Please check sample input and expected output

declare @max int = 100, @min int = 1

create table Nums(value int)
while @min <= @max
begin
	insert into Nums
	values(@min)

	set @min = @min + 1
end
create table Employees(id int, fname varchar(25), lname varchar(25))

insert into Employees values 
(1, 'John', 'Doe'),(2, 'Mark' ,'Frazier'),(3,'Jeff', 'Charles')

select e.id, e.fname, e.lname, n.value from Employees as e
join Nums as n on n.value between 1 and 5 
order by id;

--Puzzle 3. We have a table of pilots and the planes they can fly and a table of planes in the hangar.
--We want the names of the pilots who can fly every plane in the hangar.
--Please check out the sample input and expected output for details

CREATE TABLE PilotSkills ( pilot CHAR(15) NOT NULL, plane CHAR(15) NOT NULL, PRIMARY KEY
(pilot, plane));
 INSERT INTO PilotSkills
VALUES ('Celko', 'Piper Cub'),('Higgins', 'B-52 Bomber'),('Higgins', 'F-14 Fighter'),('Higgins', 'Piper Cub'),
('Jones', 'B-52 Bomber'),('Jones', 'F-14 Fighter'),('Smith', 'B-1 Bomber'),('Smith', 'B-52 Bomber'),
('Smith', 'F-14 Fighter'),('Wilson', 'B-1 Bomber'),('Wilson', 'B-52 Bomber'),('Wilson', 'F-14 Fighter'),
('Wilson', 'F-17 Fighter');

CREATE TABLE HangarPlanes (
    plane CHAR(15) PRIMARY KEY
);
INSERT INTO HangarPlanes (plane) VALUES 
('B-1 Bomber'), 
('F-14 Fighter');

SELECT ps.pilot
FROM PilotSkills ps
JOIN HangarPlanes hp ON ps.plane = hp.plane
GROUP BY ps.pilot
HAVING COUNT(DISTINCT ps.plane) = (SELECT COUNT(*) FROM HangarPlanes);




---------------------------------------------- Homework 5 par 1----------------------------------------------



use W3Resource



--1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city.
--Return Salesman, cust_name and city.
 
select s.name, c.cust_name, c.city from Inventory.Salesman s, Inventory.Customer c
where s.city = c.city; 

--2. From the following tables write a SQL query to find those orders 
--where the order amount exists between 500 and 2000.
--Return ord_no, purch_amt, cust_name, city.

select o.ord_no, o.purch_amt, c.cust_name, c.city from Inventory.Orders o, Inventory.Customer c
where o.customer_id = c.customer_id and o.purch_amt between 500 and 2000;

--3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents.
--Return Customer Name, city, Salesman, commission 

/*select c.cust_name, c.city, s.name, s.commission from Inventory.Customer c, Inventory.Salesman s
where s.salesman_id = c.salesman_id*/

select c.cust_name, c.city, s.name, s.commission from Inventory.Customer c
join Inventory.Salesman s on s.salesman_id = c.salesman_id;

--5. From the following tables write a SQL query to locate those salespeople who do not live in the same city
--where their customers live and have received a commission of more than 12% from the company.
--Return Customer Name, customer city, Salesman, salesman city, commission. 

select c.cust_name, c.city, s.name, s.city, s.commission from Inventory.Customer c
join Inventory.Salesman s on s.salesman_id = c.salesman_id 
where s.city <> c.city and s.commission > 0.12;

--6. From the following tables write a SQL query to find the details of an order.
--Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 

select o.ord_no, o.ord_date, o.purch_amt, c.cust_name Customer, c.grade, s.name Salesman, s.commission from Inventory.Customer c
join Inventory.Orders o on o.customer_id = c.customer_id
join Inventory.Salesman s on s.salesman_id = c.salesman_id

--7. Write a SQL statement to join the tables salesman, customer 
--and orders so that the same column of each table appears once
--and only the relational rows are returned.

select * from Inventory.Customer c
join Inventory.Orders o on o.customer_id = c.customer_id
join Inventory.Salesman s on s.salesman_id = c.salesman_id

--8. From the following tables write a SQL query to display the customer name,
--customer city, grade, salesman, salesman city.
--The results should be sorted by ascending customer_id.

select c.cust_name, c.city, c.grade, s.name, s.city from Inventory.Customer c
join Inventory.Salesman s on c.salesman_id = s.salesman_id
order by c.customer_id asc;

--9. From the following tables write a SQL query to find those customers with a grade less than 300.
--Return cust_name, customer city, grade, Salesman, salesmancity. 
--The result should be ordered by ascending customer_id. 

select c.cust_name Customer, c.city, c.grade, s.name Salesman, s.city from Inventory.Customer c
join Inventory.Salesman s on c.salesman_id = s.salesman_id
where c.grade < 300 
order by c.customer_id;

--10. Write a SQL statement to make a report with customer name, city, order number, order date, 
--and order amount in ascending order according to the order date to determine 
--whether any of the existing customers have placed an order or not.

select c.cust_name Customer, c.city, o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c 
join Inventory.Orders o on c.customer_id = o.customer_id
order by o.ord_date asc;

--11.  SQL statement to generate a report 
--with customer name, city, order number, order date, order amount, salesperson name, 
--and commission to determine if any of the existing customers have not placed orders 
--or if they have placed orders through their salesman or by themselves.

select 
      c.cust_name Customer, 
	  c.city, 
	  o.ord_no, 
	  o.ord_date, 
	  o.purch_amt, 
	  s.name Salesman, 
	  s.commission 
from Inventory.Orders o
left outer join Inventory.Customer c on c.customer_id = o.customer_id
left outer join Inventory.Salesman s on o.salesman_id = s.salesman_id

--12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one 
--or more customers or have not yet joined any of the customers.

select * from Inventory.Salesman s
left join Inventory.Customer c on s.salesman_id = c.salesman_id

--13. From the following tables write a  SQL query to list all salespersons along 
--with customer name, city, grade, order number, date, and amount. 
--Condition for selecting list of salesmen : 
--1. Salesmen who works for one or more customer or, 
--2. Salesmen who not yet join under any customer, Condition for selecting list of customer : 
--3. placed one or more orders, or 
--4. no order placed to their salesman.

select s.name Salesman, c.cust_name Customer, c.city, c.grade, o.ord_no, o.ord_date, o.purch_amt
from Inventory.Customer c
right join Inventory.Salesman s on c.salesman_id = s.salesman_id
right join Inventory.Orders o on c.customer_id = o.customer_id

--14. Write a SQL statement to make a list for the salesmen who either work for one 
--or more customers or yet to join any of the customer. 
--The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, 
--or he may not have placed any order to the associated supplier.

select s.name Salesname, c.cust_name Customer, c.city, c.grade, o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
right outer join Inventory.Salesman s on c.salesman_id = s.salesman_id
left outer join Inventory.Orders o on c.customer_id = o.customer_id
where o.purch_amt > 2000 and c.grade is not null;

--15.For those customers from the existing list who put one or more orders, 
--or which orders have been placed by the customer who is not on the list, 
--create a report containing the customer name, city, order number, order date, and purchase amount

select c.cust_name Customer, c.city, o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
left join Inventory.Orders o 
   on c.customer_id = o.customer_id

--16. Write a SQL statement to generate a report with the customer name, 
--city, order no. order date, purchase amount for only those customers on the list 
--who must have a grade and placed one or more orders 
--or which order(s) have been placed by the customer who neither is on the list nor has a grade.

select c.cust_name Customer, c.city, o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
full outer join Inventory.Orders o
  on c.customer_id = o.customer_id
where c.grade is not null and o.ord_no >= 1;

--17. Write a SQL query to combine each row of the salesman table with each row of the customer table.

select * from Inventory.Customer c
cross join Inventory.Salesman s

--18. Write a SQL statement to create a Cartesian product between salesperson and customer, 
--i.e. each salesperson will appear for all customers 
--and vice versa for that salesperson who belongs to that city.

select * from Inventory.Salesman s
cross join Inventory.Customer c
where s.city is not null;

--19. Write a  SQL statement to create a Cartesian product between salesperson 
--and customer, i.e. each salesperson will appear for every customer 
--and vice versa for those salesmen who belong to a city
--and customers who require a grade.

select * from Inventory.Salesman s 
cross join Inventory.Customer c 
where s.city is not null and c.grade is not null;

--20. Write a SQL statement to make a Cartesian product between salesman 
--and customer i.e. each salesman will appear for all customers 
--and vice versa for those salesmen who must belong to a city which is not the same as his customer 
--and the customers should have their own grade.

select * from Inventory.Salesman s 
cross join Inventory.Customer c 
where s.city is not null and s.city <> c.city and grade is not null;

--21. From the following tables write a  SQL query to select all rows from both participating tables 
--as long as there is a match between pro_com and com_id.

--CREATE TABLE Companies (
--    COM_ID INT PRIMARY KEY,
--    COM_NAME VARCHAR(50) NOT NULL
--);
--INSERT INTO Companies (COM_ID, COM_NAME)
--VALUES 
--    (11, 'Samsung'),
--    (12, 'iBall'),
--    (13, 'Epsion'),
--    (14, 'Zebronics'),
--    (15, 'Asus'),
--    (16, 'Frontech');

select * from Companies c 
join item_mast i on c.COM_ID = i.pro_com;

--22. Write a SQL query to display the item name, price, and company name of all the products.

select i.pro_name, i.pro_price, c.COM_NAME from Companies c
join item_mast i on c.COM_ID = i.pro_com

--23. From the following tables write a SQL query to calculate the average price of items of each company.
--Return average value and company name.

select avg(pro_price) AvePrice, c.Com_name Company from Companies c
join item_mast i on c.COM_ID = i.pro_com
group by c.COM_NAME 

--24. From the following tables write a SQL query to calculate 
--and find the average price of items of each company higher than 
--or equal to Rs. 350. Return average value and company name.

select avg(pro_price) AvgPrice, c.com_name from Companies c 
inner join item_mast i on c.COM_ID = i.pro_com
group by c.com_name
having avg(pro_price) > 350;

--25. From the following tables write a SQL query to find the most expensive product of each company.
--Return pro_name, pro_price and com_name

select i.pro_name, i.pro_price, c.com_name from Companies c 
join item_mast i on c.COM_ID = i.pro_com and i.pro_price = 
   (select max(i.pro_price) from item_mast i where i.pro_com = c.COM_ID)
order by i.pro_price desc;

--26. From the following tables write a SQL query to display all the data of employees including their department.

select * from emp_department e
join emp_details d on e.dpt_code = d.emp_dept;

--27. From the following tables write a SQL query to display the first and last names of each employee, 
--as well as the department name and sanction amount.

select e.emp_fname, e.emp_lname, d.dpt_name, d.dpt_allotment from emp_details e
join emp_department d on e.emp_dept = d.dpt_code;

--28. From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 
--and display the first name and last name of employees.

select e.emp_fname First_Name, e.emp_lname Last_Name from emp_department d
join emp_details e on d.dpt_code = e.emp_dept
where d.dpt_allotment > 50000;

--29. From the following tables write a SQL query to find the names of departments 
--where more than two employees are employed. Return dpt_name.

select d.dpt_name Department from emp_department d 
join emp_details e on d.dpt_code = e.emp_dept
group by d.dpt_name 
having count(*) > 2;

