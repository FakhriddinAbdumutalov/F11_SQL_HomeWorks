use W3Resource


--HomeWokr1

--1. Salespeople from Paris or Rome
--From the following table, write a SQL query to find the details of those salespeople who come
--from the 'Paris' City or 'Rome' City.
--Return salesman_id, name, city, commission.

Select salesman_id, name, city, commission from Inventory.Salesman
Where city = 'Paris' or city = 'Rome';

--2. Salespeople in Paris or Rome
--From the following table, write a SQL query to find the details of the salespeople who come 
--from either 'Paris' or 'Rome'. 
--Return salesman_id, name, city, commission.

Select salesman_id, name, city, commission from Inventory.Salesman
Where city = 'Paris' or city = 'Rome';

--3. Salespeople Not in Paris or Rome
--From the following table, write a SQL query to find the details of those salespeople
--who live in cities other than Paris and Rome.
--Return salesman_id, name, city, commission.  

Select salesman_id, name, city, commission from Inventory.Salesman
Where not city = 'Paris' and not city = 'Rome';

--4. Customers with Specific IDs
--From the following table, write a SQL query to retrieve the details of all customers
--whose ID belongs to any of the values 3007, 3008 or 3009.
--Return customer_id, cust_name, city, grade, and salesman_id. 

select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where customer_id in (3007, 3008, 3009);
--where customer_id = 3007 or customer_id = 3008 or customer_id = 3009;

--5. Salespeople with Commission 0.12-0.14
--From the following table, write a SQL query to find salespeople who receive commissions 
--between 0.12 and 0.14 (begin and end values are included).
--Return salesman_id, name, city, and commission.

select salesman_id, name, city, commission from Inventory.Salesman
where commission between 0.12 and 0.14;

--6. Orders Between 500-4000 Excluding Specific Amounts
--From the following table, write a SQL query to select orders 
--between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. 
--Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 

select ord_no, purch_amt, ord_date, customer_id, salesman_id from Inventory.Orders
where purch_amt between 500 and 4000 and not purch_amt in (948.50, 1983.43);

--7. Salespeople with Names N-O Range
--From the following table, write a SQL query to retrieve the details of the salespeople
--whose names begin with any letter between 'A' and 'L' (not inclusive).
--Return salesman_id, name, city, commission. 

select salesman_id, name, city, commission from Inventory.Salesman
where name between 'A' and 'L';

--8. Salespeople with Names Not A-M Range
--From the following table, write a SQL query to find the details of all salespeople except those 
--whose names begin with any letter between 'A' and 'M'.
--Return salesman_id, name, city, commission.  

select salesman_id, name, city, commission from Inventory.Salesman
where not name between 'A' and 'M';

--9. Customers with Names Starting with B
--From the following table, write a SQL query to retrieve the details of the customers 
--whose names begins with the letter 'B'.
--Return customer_id, cust_name, city, grade, salesman_id.. 

select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where cust_name like 'B%';

--10. Customers with Names Ending with N
--From the following table, write a  SQL query to find the details of the customers
--whose names end with the letter 'n'. 
--Return customer_id, cust_name, city, grade, salesman_id.

select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where cust_name like '%N';

--11. Salespeople Name Starts 'N' with Fourth 'L'
--From the following table, write a SQL query to find the details of those salespeople
--whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character.
--Return salesman_id, name, city, commission. 

select salesman_id, name, city, commission from Inventory.Salesman
where name like 'N__L%';

--12. Rows with Underscore Character
--From the following table, write a SQL query to find those rows 
--where col1 contains the escape character underscore ( _ ).
--Return col1.

--create table testtable (
--    col1 varchar(255)
--);

--insert into testtable (col1) values
--('A001/DJ-402\44_/100/2015'),
--('A001_\DJ-402\44_/100/2015'),
--('A001_DJ-402-2014-2015'),
--('A002_DJ-401-2014-2015'),
--('A001/DJ_401'),
--('A001/DJ_402\44'),
--('A001/DJ_402\44\2015'),
--('A001/DJ-402%45\2015/200'),
--('A001/DJ_402\45\2015%100'),
--('A001/DJ_402%45\2015/300'),
--('A001/DJ-402\44');

select col1 from testtable 
where col1 like '%/_%' escape '/';

--13. Rows Without Underscore Character
--From the following table, write a SQL query to identify those rows
--where col1 does not contain the escape character underscore ( _ ).
--Return col1.

select col1 from testtable
where not col1 like '%/_%' escape '/';

--14. Rows with Forward Slash Character
--From the following table, write a SQL query to find rows in
--which col1 contains the forward slash character ( / ).
--Return col1.

select col1 from testtable
where col1 like '%//%' escape '/';

--15. Rows Without Forward Slash Character
--From the following table, write a SQL query to identify those rows
--where col1 does not contain the forward slash character ( / ).
--Return col1.

select col1 from testtable
where not col1 like '%//%' escape '/';

--16. Rows with '_/' String
--From the following table, write a SQL query to find those rows
--where col1 contains the string ( _/ ). Return col1.

select col1 from testtable
where col1 like '%/_//%' escape '/';

--17. Rows Without '_/' String
--From the following table, write a SQL query to find those rows
--where col1 does not contain the string ( _/ ). Return col1.

select col1 from testtable
where not col1 like '%/_//%' escape '/';

--18. Rows with Percent Character
--From the following table, write a SQL query to find those rows
--where col1 contains the character percent ( % ). Return col1.

select col1 from testtable
where col1 like '%/%%' escape '/';

--19. Rows Without Percent Character
--From the following table, write a SQL query to find those rows
--where col1 does not contain the character percent ( % ). Return col1.

select col1 from testtable
where not col1 like '%/%%' escape '/';

--20. Customers Without Grade
--From the following table, write a SQL query to find all those customers
--who does not have any grade.
--Return customer_id, cust_name, city, grade, salesman_id.

select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where grade is null;

--21. Customers With Grade
--From the following table, write a SQL query to locate all customers with a grade value.
--Return customer_id, cust_name,city, grade, salesman_id.

select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where grade is not null;

--22. Employees with Last Name Starting 'D'
--From the following table, write a  SQL query to locate the employees
--whose last name begins with the letter 'D'.
--Return emp_idno, emp_fname, emp_lname and emp_dept

select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_lname like 'D%';
