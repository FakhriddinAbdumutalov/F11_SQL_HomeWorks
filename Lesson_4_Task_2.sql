use W3Resource
go 

--Lesson SQL-4 Task 2

--Questoin 1 Customers with grade > 100
--From the following table, write a SQL query to locate the details of customers with grade values above 100. 
--Return customer_id, cust_name, city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where grade > 100;

--Question 2 New York Customers with grade > 100
--From the following table, write a SQL query to find all the customers in 'New York' city who have grade value above 100.
--Return customer_id, cust_name, city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where city = 'New York' and grade > 100;

--Question 3 New York or grade > 100
--From the following table, write a SQL query to find customers who are from New York or have a grade of over 100. 
--Return customer_id, cust_name, city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where city = 'New York' or grade > 100;

--Question 4 New York or not grade > 100
--From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100.
--Return customer_id, cust_name, city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where city = 'New York' or not grade > 100;

--Question 5 Not New York and Not Grade > 100
--From the following table, write a SQL query to identify customers who are not from the city 'Ney York' and do not have a grade value greater than 100.
--Return customer_id, cust_name, city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where not (city = 'New York' or grade > 100);

--Question 6 Exclude Specific Orders
--From the following table, write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10'
--and salesman_id higher than 5005 or purch_amt greater than 1000.
--Return ord_no, Purch_amt, ord_date, customer_id, salesman_id.

Select ord_no, purch_amt, ord_date, customer_id, salesman_id from Inventory.Orders
where not ((ord_date = '2012-09-10' and salesman_id > 5005) or purch_amt > 1000);

--Question 7 Salespeople with Commission Range 0.10-0.12
--From the following table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12.
--Return salesman_id, name, city, and commission. 

Select salesman_id, name, city, commission from Inventory.Salesman
--where commission between 0.10 and 0.12 wrong :(
Where (commission > 0.10 and commission < 0.12);

--Question 8 Orders with amount < 200 or Exlusions
--From the following table, write a SQL query to find details of all orders with a purchase amount less than 200
--or exclude orders with an order date greater than or equal to '2012-02-10'
--and a customer ID less than 3009.
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

Select ord_no, purch_amt, ord_date, customer_id, salesman_id from Inventory.Orders
where purch_amt < 200 or not(ord_date >= '2012-02-10' and customer_id > 3009);

--Question 9 Conditional Orders Exclusions 
--From the following table, write a SQL query to find all orders that meet the following conditions.
--Exclude combinations of order date equal to '2012-08-17'
--or customer ID greater than 3005 and purchase amount less than 1000.

Select * from Inventory.Orders
where not ((ord_date = '2012-08-17' or customer_id > 3005) and purch_amt < 1000);

--Question 10 Orders with achieved Percentage > 50%
--Write a  SQL query that displays order number, purchase amount, and the achieved
--and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.

Select ord_no, purch_amt,
    (100 * purch_amt) / 6000 as 'Achieved %',
	(100 * (6000 - purch_amt) / 6000) as 'Unachieved %'
from Inventory.Orders
where (100 * purch_amt) / 6000 > 50; -- was too hard :(

--Question 11 Employees with Last Name Dosni or Mardy
--From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’.
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  

Select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_lname = 'Dosni' or emp_lname = 'Mardy';

--Question 12 Employees in Department 47 or 63
--From the following table, write a SQL query to find the employees who work at depart 47 or 63.
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  

Select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_dept = 47 or emp_dept = 63;

     