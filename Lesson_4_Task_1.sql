use W3Resource
go

--Lesson SQL-04 task 1

--Question 1 Display All Salespeople
--Write a SQL statement that displays all the information about all salespeople

Select * from Inventory.Salesman;

--Question 2 Display a Custom String
--Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution".

Select 'This is SQL Exercise, Practice and Solution';

--Question 3 Display Three Numbers
--Write a SQL query to display three numbes in three columns 

Select '1', '2', '3';

--Questoin 4 Sum of Two Numbers
--Write an SQL query to display the sum of two numbers 10 and 15 from the RDBMS	server.

Select 10+15;

--Question 5 Arithmetic Expression Result
--Write an SQL query to display the result of an arithmetic expression

Select 10*20-13+21;

--Question 6 Specific Columns of Salespeople
--Write a SQL statement to display specific columns such as name and commisions for all salespeople 

Select salesman_id, name, city, commission from Inventory.Salesman;

--Question 7 Custom Column Order in Orders
--Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and puschase amount for all orders.

Select ord_no, purch_amt, ord_date, customer_id, salesman_id from Inventory.Orders;

--Question 8 Unique Salespeople IDs
--From the following table, with a SQL query to identify the unique salespeople ID. Return salesman_id.

Select ord_date, salesman_id, ord_no, purch_amt from Inventory.Orders;

--Question 9 Salespeople in Paris
--From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city 

Select name, city from Inventory.Salesman
where city = 'Paris';

--Question 10 Customers with Grade 200
--from the following table, write a SQL query to find customer whose greade is 200. Return customer_id, cust_name, grade, salesman_id

select customer_id, cust_name, grade, salesman_id from Inventory.Customer
where grade = 200;

--Question 11 Orders by Salesperson 5001
--from the following table, write a SQL query to find order that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.

Select ord_no, ord_date, purch_amt from Inventory.Orders
where salesman_id = 5001;

--Question 12 Nobel Winner of 1970
--From the following table, write SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner.

Select subject, winner from nobel_win
where year = 1970;

--Question 13 Literature Winner 1971
--From the following table, write a SQL query to find the Noble Prize winner in 'Literature' for 1971. Return winner.

Select winner from nobel_win
Where subject = 'Literature' and year = 1971;

--Question 14 Locate Dennis Gabor
--From the following table, write SQL query to locate the Noble Prize winner 'Dennis Gabor'. Return year, subject.

Select year, subject from nobel_win
where winner = 'Dennis Gabor';

--Question 15 Physics Winners Since 1950
--From the following table, write a SQL query to find the Nobel Prize winners in the field of 'Physics' since 1950. Return winner.

Select winner from nobel_win
where subject = 'Physics' and year >= 1950;

--Question 16 Chemistry Winners (1965-1975)
--From the following table, write a SQL query to find the Nobel Prize winners in 'Chemistry' between the years 1965 and 1975. 
--Begin and end values are included. Return year, subject, winner and country.

Select year, subject, winner, country from nobel_win
--where subject = 'Chemistry' and year between 1965 and 1975; This is also true!
where subject = 'Chemistry' and  year >= 1965 and year <= 1975;

--Question 17 Prime Ministers After 1972
--Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.

Select * from nobel_win
where category = 'Prime Minister' and year > 1972;

--Question 18 Winners with First Name Louis
--From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’.
--Return year, subject, winner, country, and category. 

Select year, subject, winner, country, category from nobel_win
where winner like 'Louis%';

--Question 19 Combine Winners (Physics 1970 & Economics 1971)
--From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. 
--Return year, subject, winner, country, and category. 

Select year, subject, winner, country, category from nobel_win
where (subject = 'Physics' and year = 1970)
union  
(select * from nobel_win where (subject = 'Economics' and year = 1971));

--Question 20 Winners Excluding Physiology & Economics
--From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics.
--Return year, subject, winner, country, and category. 

select year, subject, winner, country, category from nobel_win
where year = 1970 and subject not in ('Physiology', 'Economics');

--Question 21 Physiology Before 1971 & Peace After 1974
--From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974.
--Return year, subject, winner, country, and category. 

Select year, subject, winner, country, category from nobel_win
where (year < 1971 and subject = 'Physiology')
union
(select * from nobel_win where ( year > 1974 and subject = 'Peace'));

--Question 22 Details of Johannes Georg Bednorz
--From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'.
--Return year, subject, winner, country, and category.  

Select year, subject, winner, country, category from nobel_win
where winner = 'Johannes Georg Bednorz'

--Question 23 Winners Excluding Subjects Starting with P
--From the following table, write a  SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'.
--Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending. 

Select year, subject, winner, country, category from nobel_win
where winner not like 'P%'
order by year desc, winner asc; 

--Question 24 Ordered 1970 Nobel Prize Winners
--From the following table, write a SQL query to find the details of 1970 Nobel Prize winners.
--Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set.
--Return year, subject, winner, country, and category.

Select year, subject, winner, country, category from nobel_win
where year = 1970 
order by 
     case 
	   when subject in ('Economics', 'Chemistry') then 1
	   else 0
	 end asc, subject, winner;

--Question 25 Products in Price Range Rs.200-600
--From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600.
--Begin and end values are included.
--Return pro_id, pro_name, pro_price, and pro_com.

Select pro_id, pro_name, pro_price, pro_com from item_mast
where pro_price between 200 and 600;

--Question 26 Average Price for Manufacturer Code 16
--From the following table, write a SQL query to calculate the average price for a manufacturer code of 16.
--Return avg.

Select avg(pro_price) as AveragePrice from item_mast
where pro_com = 16;

--Question 27 Display Item Name and Price
--From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'  

Select pro_name as 'Item Name', pro_price as 'Price in Rs' from item_mast

--Question 28 Items with Price >= $250
--From the following table, write a SQL query to find the items whose prices are higher than or equal to $250.
--Order the result by product price in descending, then product name in ascending.
--Return pro_name and pro_price.  

Select pro_name, pro_price from item_mast
 where pro_price >= 250
 order by pro_price desc, pro_name;

 --Question 29 Average Price per Company
 --From the following table, write a SQL query to calculate average price of the items for each company.
 --Return average price and company code. 

 Select avg(pro_price), pro_com from item_mast
 group by pro_com;


 --Question 30 Cheapest Item
 --From the following table, write SQL query to find the cheapest item(s).
 --Return pro_name and pro_price

--Select top 2 pro_name, pro_price from item_mast
--order by pro_price; that is also true somehow :)

Select pro_name, pro_price from item_mast
where pro_price = (select min(pro_price) from item_mast)

--Question 31 Unique Employee last Names
--From the following table, write SQL query to find the unique last name of employees. 
--Return emp_lname

Select emp_lname from emp_details; --easy 

--Question 32 Employees with last name Snares
--From the following table, write SQL query to find the details of employees whose last name is 'Snares'. 
--Return emp_idno, emp_fname, emp_lname, emp_dept.

Select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_lname = 'Snares';

--Question 33 Employees in Department 57
--From the following table, write SQL query to retrieve the details of the employees who work in the department 57.
--Return emp_idno, emp_fname, emp_lname, emp_dept.

Select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_dept = 57;

