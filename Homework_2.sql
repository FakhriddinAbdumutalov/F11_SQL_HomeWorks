use W3Resource

--Homework 2 part 1

--1. Display All Salespeople
--Write a SQL statement that displays all the information about all salespeople.

select * from Inventory.Salesman;

--2. Display a Custom String
--Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution". 

select 'This is SQL Exercise, Practice and Solutions' as String;

--3. Display Three Numbers
--Write a SQL query to display three numbers in three columns. 

select '1', '2', '3';

--4. Sum of Two Numbers
--Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server.

select 10+15; --select sum(10+15) also possible

--5. Arithmetic Expression Result
--Write an SQL query to display the result of an arithmetic expression. 

select 10*11-20+2/4;

--6. Specific Columns of Salespeople
--Write a SQL statement to display specific columns such as names and commissions for all salespeople.  

select name, commission from Inventory.Salesman;

--7. Custom Column Order in Orders
--Write a query to display the columns in a specific order, such as order date,
--salesman ID, order number, and purchase amount for all orders.

select salesman_id, ord_no, purch_amt from Inventory.Orders

--8. Unique Salespeople IDs
--From the following table, write a SQL query to identify the unique salespeople ID.
--Return salesman_id. 

select distinct salesman_id from Inventory.Salesman;

--9. Salespeople in Paris
--From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'.
--Return salesperson's name, city.

select name, city from Inventory.Salesman
where city = 'Paris';

--10. Customers with Grade 200
--From the following table, write a SQL query to find customers whose grade is 200.
--Return customer_id, cust_name, city, grade, salesman_id.

select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where grade = 200;

--11. Orders by Salesperson 5001
--From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001.
--Return ord_no, ord_date, purch_amt.  

select ord_no, ord_date, purch_amt from Inventory.Orders
where salesman_id = 5001;

--12. Nobel Winner of 1970
--From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970.
--Return year, subject and winner. 

--13. Literature Winner 1971
--From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 

select winner from nobel_win
where subject = 'Literature' and year = 1971;

--14. Locate Dennis Gabor
--From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'.
--Return year, subject. 

select year, subject from nobel_win
where winner = 'Dennis Gabor';

--15. Physics Winners Since 1950
--From the following table, write a SQL query to find
--the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. 

select winner from nobel_win
where subject = 'Physics' and year >= 1950;

--16. Chemistry Winners (1965-1975)
--From the following table, write a  SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975.
--Begin and end values are included. Return year, subject, winner, and country. 

select year, subject, country from nobel_win
where subject = 'Chemistry' and year between 1965 and 1975;

--17. Prime Ministers After 1972
--Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.

select * from nobel_win
where winner = 'Menachem Begin' or winner = 'Yitzhak Rabin' and year > 1972;

--18. Winners with First Name Louis
--From the following table, write a SQL query to retrieve the details of the winners
--whose first names match with the string ‘Louis’.
--Return year, subject, winner, country, and category. 

select year, subject, winner, country, category from nobel_win
where winner like 'LOUIS%';

--19. Combine Winners (Physics 1970 & Economics 1971)
--From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971.
--Return year, subject, winner, country, and category. 

select year, subject, winner, country, category from nobel_win
where (subject = 'Physics' and year = 1970)
union
(select * from nobel_win where (subject = 'Economics' and year = 1971));

--20. 1970 Winners Excluding Physiology & Economics
--From the following table, write a SQL query to find the Nobel Prize winners in 1970
--excluding the subjects of Physiology and Economics.
--Return year, subject, winner, country, and category. 

select * from nobel_win
where year = 1970 and subject not in ('Physiology', 'Economics');

--21. Physiology Before 1971 & Peace After 1974
--From the following table, write a SQL query to combine the winners in 'Physiology'
--before 1971 and winners in 'Peace' on or after 1974.
--Return year, subject, winner, country, and category. 

select * from nobel_win
where (subject = 'Physiology' and year < 1971)
union
(select * from nobel_win where (subject = 'Peace' and year >= 1974));

--22. Details of Johannes Georg Bednorz
--From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'.
--Return year, subject, winner, country, and category.  

select * from nobel_win
where winner = 'Johannes Georg Bednorz';

--23. Winners Excluding Subjects Starting with P
--From the following table, write a SQL query to find Nobel Prize winners for the subject
--that does not begin with the letter 'P'.
--Return year, subject, winner, country, and category.
--Order the result by year, descending and winner in ascending.  

select * from nobel_win
where winner not like 'P%'
order by year desc, winner asc;

--24. Ordered 1970 Nobel Prize Winners
--From the following table, write a SQL query to find the details of 1970 Nobel Prize winners.
--Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set.
--Return year, subject, winner, country, and category. 

select * from nobel_win
where year = 1970
order by 
     case 
	    when subject in ('Chemistry', 'Economics') then 1
		else 0
	end asc, subject, winner;

--25. Products in Price Range Rs.200-600
--From the following table, write a SQL query to select a range of products
--whose price is in the range Rs.200 to Rs.600. Begin and end values are included.
--Return pro_id, pro_name, pro_price, and pro_com. 

select pro_id, pro_name, pro_price, pro_com from item_mast
where pro_price between 200 and 600;

--26. Average Price for Manufacturer Code 16
--From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg. 

select AVG(pro_price) as AvgPrice from item_mast
where pro_com = 16;

--27. Display Item Name and Price
--From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.' 

select pro_name as 'Item Name', pro_price as 'Price in Rs.' from item_mast

--28. Items with Price >= $250
--From the following table, write a  SQL query to find the items whose prices are higher than or equal to $250. 
--Order the result by product price in descending, then product name in ascending.
--Return pro_name and pro_price

select pro_name, pro_price from item_mast
where pro_price >= 250
order by pro_price desc, pro_name;

--29. Average Price per Company
--From the following table, write a SQL query to calculate average price of the items for each company.
--Return average price and company code. 

select AVG(pro_price) as AvgPri, pro_com from item_mast
group by pro_com;

--30. Cheapest Item
--From the following table, write a SQL query to find the cheapest item(s).
--Return pro_name and, pro_price.

select pro_name, pro_price from item_mast
where pro_price = (select min(pro_price) from item_mast);
--select min(pro_price) as CheapestItem, pro_name from item_mast
--group by pro_name;

--31. Unique Employee Last Names
--From the following table, write a SQL query to find the unique last name of all employees.
--Return emp_lname.

select distinct emp_lname from emp_details

--32. Employees with Last Name Snares
--From the following table, write a SQL query to find the details of employees whose last name is 'Snares'.
--Return emp_idno, emp_fname, emp_lname, and emp_dept. 

select * from emp_details
where emp_lname = 'Snares';

--33. Employees in Department 57
--From the following table, write a SQL query to retrieve the details of the employees who work in the department 57.
--Return emp_idno, emp_fname, emp_lname and emp_dept..

select * from emp_details
where emp_dept = 57;





------------------------------------------Homework 2 part 2 ---------------------------------------------






--1. Customers with Grade > 100
--From the following table, write a SQL query to locate the details of customers with grade values above 100.
--Return customer_id, cust_name, city, grade, and salesman_id. 

select * from Inventory.Customer
where grade > 100;

--2. New York Customers with Grade > 100
--From the following table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100.
--Return customer_id, cust_name, city, grade, and salesman_id.  

select * from Inventory.Customer
where city = 'New York' and grade > 100;

--3. New York or Grade > 100
--From the following table, write a SQL query to find customers
--who are from the city of New York or have a grade of over 100.
--Return customer_id, cust_name, city, grade, and salesman_id. 

select * from Inventory.Customer
where city = 'New York' or grade > 100;

--4. New York or Not Grade > 100
--From the following table, write a SQL query to find customers 
--who are either from the city 'New York' or who do not have a grade greater than 100. 
--Return customer_id, cust_name, city, grade, and salesman_id.  

select * from Inventory.Customer
where city = 'New York' or not grade > 100;

--5. Not New York and Not Grade > 100
--From the following table, write a SQL query to identify customers
--who are not from the city of 'New York' and do not have a grade value greater than 100.
--Return customer_id, cust_name, city, grade, and salesman_id.

select * from Inventory.Customer
where not city = 'New York' and not grade > 100;

--6. Exclude Specific Orders
--From the following table, write a SQL query to find details of all orders excluding 
--those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 

select * from Inventory.Orders
where not ((ord_date = '2012-09-10' and salesman_id > 5005) or purch_amt > 1000);

--7. Salespeople with Commission Range 0.10-0.12
--From the following table, write a SQL query to find the details of those salespeople
--whose commissions range from 0.10 to0.12.
--Return salesman_id, name, city, and commission. 

select * from Inventory.Salesman
where (commission > 0.10 and commission < 0.12);

--8. Orders with Amount < 200 or Exclusions
--From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 
--or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. 
--Return ord_no, purch_amt, ord_date, customer_id and

select * from Inventory.Orders
where (purch_amt < 200 or (not ord_date < '2012-02-10' and customer_id > 3009));

--9. Conditional Orders Exclusions
--From the following table, write a SQL query to find all orders that meet the following conditions. 
--Exclude combinations of order date equal to '2012-08-17'
--or customer ID greater than 3005 and purchase amount less than 1000.

select * from Inventory.Orders
where ((not ord_date = '2012-08-17' or customer_id > 3005) and purch_amt < 1000);

--10. Orders with Achieved Percentage > 50%
--Write a  SQL query that displays order number, purchase amount, and the achieved 
--and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.  

select 
    ord_no, 
	purch_amt, 
	(100 * purch_amt) / 6000 as 'Achieved %',
	(100 * (6000 - purch_amt) / 6000) as 'Unachieved %'
from Inventory.Orders
where (100 * purch_amt) / 6000 > 50;

--11. Employees with Last Name Dosni or Mardy
--From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’.
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  

select * from emp_details
where emp_lname = 'Dosni' or emp_lname = 'Mardy';

--12. Employees in Department 47 or 63
--From the following table, write a SQL query to find the employees who work at depart 47 or 63.
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  

select * from emp_details
where emp_dept = 47 or emp_dept = 63;







--------------------------------------------- Homework 2 part 3 ---------------------------------------------







--1. Salespeople from Paris or Rome
--From the following table, write a SQL query to find the details of those salespeople
--who come from the 'Paris' City or 'Rome' City.
--Return salesman_id, name, city, commission.

select * from Inventory.Salesman
where city = 'Paris' or city = 'Rome';

--2. Salespeople in Paris or Rome
--From the following table, write a SQL query to find the details of the salespeople 
--who come from either 'Paris' or 'Rome'.
--Return salesman_id, name, city, commission. 

select * from Inventory.Salesman
where city = 'Paris' or city = 'Rome';

--3. Salespeople Not in Paris or Rome
--From the following table, write a SQL query to find the details of those salespeople
--who live in cities other than Paris and Rome.
--Return salesman_id, name, city, commission.

select * from Inventory.Salesman
where city not in ('Paris' , 'Rome');
--where not (city = 'Paris' or city = 'Rome');

--4. Customers with Specific IDs
--From the following table, write a SQL query to retrieve the details of all customers
--whose ID belongs to any of the values 3007, 3008 or 3009. 
--Return customer_id, cust_name, city, grade, and salesman_id.  

select * from Inventory.Customer
where customer_id in (3007, 3008, 3009);

--5. Salespeople with Commission 0.12-0.14
--From the following table, write a SQL query to find salespeople
--who receive commissions between 0.12 and 0.14 (begin and end values are included).
--Return salesman_id, name, city, and commission.

select * from Inventory.Salesman
where commission between 0.12 and 0.14;

--6. Orders Between 500-4000 Excluding Specific Amounts
--From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included).
--Exclude orders amount 948.50 and 1983.43.
--Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

select * from Inventory.Orders
where ord_no between 500 and 4000 or not (purch_amt = 948.50 or purch_amt = 1983.43);

--7. Salespeople with Names N-O Range
--From the following table, write a SQL query to retrieve the details of the salespeople
--whose names begin with any letter between 'A' and 'L' (not inclusive). 
--Return salesman_id, name, city, commission.

select * from Inventory.Salesman
where name between 'A' and 'L';

--8. Salespeople with Names Not A-M Range
--From the following table, write a SQL query to find the details of all salespeople except those
--whose names begin with any letter between 'A' and 'M'.
--Return salesman_id, name, city, commission. 

select * from Inventory.Salesman 
where not name between 'A' and 'M';

--9. Customers with Names Starting with B
--From the following table, write a SQL query to retrieve the details of the customers 
--whose names begins with the letter 'B'. 
--Return customer_id, cust_name, city, grade, salesman_id.. 

select * from Inventory.Customer
where cust_name	like 'B%';

--10. Customers with Names Ending with N
--From the following table, write a  SQL query to find the details of the customers
--whose names end with the letter 'n'. 
--Return customer_id, cust_name, city, grade, salesman_id.

select * from Inventory.Customer
where cust_name like '%N';

--11. Salespeople Name Starts 'N' with Fourth 'L'
--From the following table, write a SQL query to find the details of those salespeople
--whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character.
--Return salesman_id, name, city, commission. 

select * from Inventory.Salesman
where name like 'N__L%';

--12. Rows with Underscore Character
--From the following table, write a SQL query to find those rows
--where col1 contains the escape character underscore ( _ ).
--Return col1.

select * from testtable
where col1 like '%/_%' escape '/';

--13. Rows Without Underscore Character
--From the following table, write a SQL query to identify those rows
--where col1 does not contain the escape character underscore ( _ ). Return col1.

select * from testtable
where col1 not like '%/_%' escape '/';

--14. Rows with Forward Slash Character
--From the following table, write a SQL query to find rows in 
--which col1 contains the forward slash character ( / ). Return col1.

select * from testtable 
where col1 like '%//%' escape '/';

--15. Rows Without Forward Slash Character
--From the following table, write a SQL query to identify those rows 
--where col1 does not contain the forward slash character ( / ). Return col1

select * from testtable 
where col1 not like '%//%' escape '/';

--16. Rows with '_/' String
--From the following table, write a SQL query to find those rows
--where col1 contains the string ( _/ ). Return col1.

select * from testtable
where col1 like '%/_//%' escape '/';

--17. Rows Without '_/' String
--From the following table, write a SQL query to find those rows
--where col1 does not contain the string ( _/ ). Return col1.

select * from testtable
where col1 not like '%/_//%' escape '/';

--18. Rows with Percent Character
--From the following table, write a SQL query to find those rows
--where col1 contains the character percent ( % ). Return col1.

select * from testtable
where col1 like '%/%%' escape '/';

--19. Rows Without Percent Character
--From the following table, write a SQL query to find those rows
--where col1 does not contain the character percent ( % ). Return col1.

select * from testtable
where col1 not like '%/%%' escape '/';

--20. Customers Without Grade
--From the following table, write a SQL query to find all those customers who does not have any grade.
--Return customer_id, cust_name, city, grade, salesman_id.

select * from Inventory.Customer
where grade is null;

--21. Customers With Grade
--From the following table, write a SQL query to locate all customers with a grade value. 
--Return customer_id, cust_name,city, grade, salesman_id.

select * from Inventory.Customer
where grade is not null;

--22. Employees with Last Name Starting 'D'
--From the following table, write a SQL query to locate the employees 
--whose last name begins with the letter 'D'.
--Return emp_idno, emp_fname, emp_lname and emp_dept. 

select * from emp_details
where emp_lname like 'D%';





--------------------------------------------- Homework 2 part 4 ---------------------------------------------





--1. From the following table, write a SQL query to select all the salespeople.
--Return salesman_id, name, city, commission with the percent sign (%).

select salesman_id, name, city, '%' as 'Percent', commission * 100 as CommissionPercent from Inventory.Salesman

--2. From the following table, write a SQL query to find the number of orders booked for each day.
--Return the result in a format like "For 2001-10-10 there are 15 orders".". 

select 'For', ord_date, ', there are', count(purch_amt)as Count, 'orders'as Orders from Inventory.Orders
group by ord_date

--3. From the following table, write a SQL query to find all the orders. 
--Sort the result-set in ascending order by ord_no. Return all fields. 

select * from Inventory.Orders
order by ord_no;

--4. From the following table, write a SQL query to find all the orders. 
--Sort the result-set in descending order by ord_date. Return all fields

select * from Inventory.Orders
order by ord_date desc;

--5. From the following table, write a SQL query to find all the orders.
--Sort the result-set in descending order by ord_date and purch_amt. Return all fields.

select * from Inventory.Orders
order by ord_date, purch_amt desc;

--6. From the following table, write a SQL query to find all the customers.
--Sort the result-set by customer_id. Return cust_name, city, grade.

select cust_name, city, grade from Inventory.Customer
order by customer_id;

--7. From the following table, write a SQL query that calculates the maximum purchase amount
--generated by each salesperson for each order date. Sort the result-set by salesperson id and order date in ascending order.
--Return salesperson id, order date and maximum purchase amount.

select salesman_id, ord_date,  max(purch_amt)as max from Inventory.Orders
group by salesman_id, ord_date
--where purch_amt = (select max(purch_amt) from Inventory.Orders)
order by salesman_id, ord_date;

--8. From the following table, write a SQL query to find all the customers.
--Sort the result-set in descending order on 3rd field.
--Return customer name, city and grade. 

select cust_name, city, grade from Inventory.Customer
order by 3 desc;

--9. From the following table, write a SQL query that counts the unique orders
--and the highest purchase amount for each customer. Sort the result-set in descending order on 2nd field.
--Return customer ID, number of distinct orders and highest purchase amount by each customer.

select distinct  customer_id, count(ord_no) as OrderNumber, max(purch_amt) as MaxPurchase from Inventory.Orders
group by customer_id
order by 2 desc;

--10. From the following table, write a SQL query to calculate the summation of purchase amount,
--total commission (15% for all salespeople) by each order date. Sort the result-set on order date.
--Return order date, summation of purchase amount and commission.

--select ord_date, sum(purch_amt) as TotalPurch, s.commission  from Inventory.Orders as o 
--join Inventory.Salesman as s on s.salesman_id = o.salesman_id
--group by ord_date, s.commission

select ord_date, sum(purch_amt) as TotalPurch, sum(purch_amt)*0.15 from Inventory.Orders
group by ord_date;

