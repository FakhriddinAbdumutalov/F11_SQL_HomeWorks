--Lesson 9 
--HomeWork

use W3Resource
go

--Task 1

--1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city.
--Return Salesman, cust_name and city

select * from Inventory.Customer
select * from Inventory.Salesman

Select s.name, c.cust_name, c.city from Inventory.Salesman as s
  join Inventory.Customer as c
   on s.salesman_id = c.salesman_id and s.city = c.city
order by s.name, c.cust_name, c.city

--2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. 
--Return ord_no, purch_amt, cust_name, city.

select * from Inventory.Customer
select * from Inventory.Orders

Select o.ord_no, count(o.purch_amt) as OrderAmountCount, c.cust_name, c.city from Inventory.Customer as c 
join Inventory.Orders as o 
on c.customer_id = o.customer_id 
where o.purch_amt between 500 and 2000
order by o.ord_no, o.purch_amt, c.cust_name, c.city

 --3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents.
 --Return Customer Name, city, Salesman, commission.

 select * from Inventory.Customer
 select * from Inventory.Salesman

 select c.cust_name, c.city, s.name, s.commission from Inventory.Customer as c 
   join Inventory.Salesman as s 
    on s.salesman_id = c.salesman_id
order by commission desc

--4. From the following tables write a SQL query to find salespeople
--who received commissions of more than 12 percent from the company.
--Return Customer Name, customer city, Salesman, commission.  

Select * from Inventory.Customer
Select * from Inventory.Salesman


Select c.cust_name, c.city, s.name, s.commission from Inventory.Customer as c
   join Inventory.Salesman as s 
   on s.salesman_id = c.salesman_id 
where s.commission > 0.12

--5. From the following tables write a SQL query to locate those salespeople who do not live in the same city
--where their customers live and have received a commission of more than 12% from the company.
--Return Customer Name, customer city, Salesman, salesman city, commission.  

Select * from Inventory.Customer
Select * from Inventory.Salesman

Select 
     c.cust_name as Customer_Name,
	 c.city as Customer_City,
	 s.name as Salesman_Name,
	 s.city as SalesmanCity,
	 s.commission from Inventory.Customer c 
     join Inventory.Salesman s 
	 on s.salesman_id = c.salesman_id and s.city <> c.city
Where s.commission > 0.12

--6. From the following tables write a SQL query to find the details of an order.
--Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission

Select * from Inventory.Orders 
Select * from Inventory.Customer
Select * from Inventory.Salesman

Select 
       o.ord_no as OrderNumber,
	   o.ord_date as OrderDate,
	   o.purch_amt as PurchaseAmount,
	   c.cust_name as CustomerName,
	   c.grade,
	   s.name as SalesmanName, 
	   s.commission from Inventory.Orders o 
   join Inventory.Customer c
   on o.customer_id = c.customer_id
   join Inventory.Salesman s 
   on o.salesman_id = s.salesman_id;

--7. Write a SQL statement to join the tables salesman, customer
--and orders so that the same column of each table appears once
--and only the relational rows are returned. 





