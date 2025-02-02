use W3Resource
go 

--Lesson SQL-4 Task 3

--Question 1 Salespeople from Paris or Rome
--From the following table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City.
--Return salesman_id, name, city, commission.

Select salesman_id, name, city, commission from Inventory.Salesman
where city = 'Paris' or city = 'Rome';

--Question 2 Salespeople in Paris or Rome
--From the following table, write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'.
--Return salesman_id, name, city, commission. 

Select salesman_id, name, city, commission from Inventory.Salesman
where city = 'Paris' or city = 'Rome';

--Question 3. Salespeople Not in Paris or Rome
--From the following table, write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome.
--Return salesman_id, name, city, commission.

Select salesman_id, name, city, commission from Inventory.Salesman
--where not (city = 'Paris' or city = 'Rome'); --this is also true! 
where city not in ('Paris', 'Rome');

--Question 4. Customers with Specific IDs
--From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009.
--Return customer_id, cust_name, city, grade, and salesman_id.  

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
Where customer_id in (3007, 3008, 3009);

--Question 5. Salespeople with Commission 0.12-0.14
--From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). 
--Return salesman_id, name, city, and commission.  

Select salesman_id, name, city, commission from Inventory.Salesman
where commission between 0.12 and 0.14;

--Question 6. Orders Between 500-4000 Excluding Specific Amounts
--From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included).
--Exclude orders amount 948.50 and 1983.43.
--Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 

Select ord_no, purch_amt, ord_date, customer_id, salesman_id from Inventory.Orders
Where (purch_amt between 500 and 4000) and not purch_amt in (948.50, 1983.43);

--Question 7. Salespeople with Names N-O Range
--From the following table, write a SQL query to retrieve the details of the salespeople
--whose names begin with any letter between 'A' and 'L' (not inclusive).
--Return salesman_id, name, city, commission. 

Select salesman_id, name, city, commission from Inventory.Salesman
where name between 'A' and 'L';

--Question 8. Salespeople with Names Not A-M Range
--From the following table, write a SQL query to find the details of all salespeople
--except those whose names begin with any letter between 'A' and 'M'. 
--Return salesman_id, name, city, commission.  

Select salesman_id, name, city, commission from Inventory.Salesman
Where name not between 'A' and 'M';

--Question 9. Customers with Names Starting with B
--From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'.
--Return customer_id, cust_name, city, grade, salesman_id.. 

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where cust_name like 'B%';

--Question 10. Customers with Names Ending with N
--From the following table, write a  SQL query to find the details of the customers whose names end with the letter 'n'. 
--Return customer_id, cust_name, city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where cust_name like '%N';

--Question11. Salespeople Name Starts 'N' with Fourth 'L'
--From the following table, write a SQL query to find the details of those salespeople whose names begin with ‘N’
--and the fourth character is 'l'. Rests may be any character.
--Return salesman_id, name, city, commission. 

Select salesman_id, name, city, commission from Inventory.Salesman
Where name like 'N__L%';

--Question 12. Rows with Underscore Character
--From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ).
--Return col1.

--Select col1 from testtable 
--where col1 like '%/_%' escape '/'; --	THERE IS NOT ANY TABLE NAMED testtable!
--So I cannot complete Questions which require testtable

--Question 20. Customers Without Grade
--From the following table, write a SQL query to find all those customers who does not have any grade. 
--Return customer_id, cust_name, city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
Where grade is null;

--Question 21. Customers With Grade
--From the following table, write a SQL query to locate all customers with a grade value.
--Return customer_id, cust_name,city, grade, salesman_id.

Select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
Where not grade is null;

--Question 22. Employees with Last Name Starting 'D'
--From the following table, write a  SQL query to locate the employees whose last name begins with the letter 'D'.
--Return emp_idno, emp_fname, emp_lname and emp_dept.

Select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
Where emp_lname like 'D%';

