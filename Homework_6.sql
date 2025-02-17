use W3Resource



---------------------------------------------- Homework 6 par 1----------------------------------------------




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





---------------------------------------------- Homework 6 par 2----------------------------------------------





--1. From the following tables, write a SQL query to find the first name, last name, department number, 
--and department name for each employee.

select * from hr.Departments
select * from hr.Employees

select e.first_name, e.last_name, e.department_id, d.department_name from hr.Employees e
join hr.Departments d on e.department_id = d.department_id

--2. From the following tables, write a SQL query to find the first name, last name, department, city,
--and state province for each employee.

select e.first_name, e.last_name, d.department_name, l.city, l.state_province from hr.Employees e
join hr.Departments d on e.department_id = d.department_id
join hr.Locations l on d.location_id = l.location_id

--3. From the following table, write a SQL query to find the first name, last name, salary, 
--and job grade for all employees.

select e.first_name, e.last_name, e.salary, j.grade_level from hr.Employees e
join hr.Job_Grades j on e.salary between j.lowest_sal and j.highest_sal;

--4. From the following tables, write a SQL query to find all those employees who work in department ID 80 or 40. 
--Return first name, last name, department number and department name.

select e.first_name, e.last_name, e.department_id, d.department_name from hr.Employees e 
left join hr.Departments d on e.department_id = d.department_id
where e.department_id in (80, 40);

--5. From the following tables, write a SQL query to find those employees 
--whose first name contains the letter ‘z’. Return first name, last name, department, city,
--and state province.

select e.first_name, e.last_name, d.department_name, l.city, l.state_province from hr.Employees e
join hr.Departments d on e.department_id = d.department_id
join hr.Locations l on d.location_id = l.location_id
where e.first_name like '%z%';

--6. From the following tables, write a SQL query to find all departments, including those without employees.
--Return first name, last name, department ID, department name.

select e.first_name, e.last_name, e.department_id, d.department_name from hr.Employees e
right join hr.Departments d on e.department_id = d.department_id

--7. From the following table, write a SQL query to find the employees who earn less than the employee of ID 182.
--Return first name, last name and salary.

select e.first_name, e.last_name, e.salary from hr.Employees e 
join hr.Employees c on e.salary < c.salary and c.employee_id = 182;

--8. From the following table, write a SQL query to find the employees and their managers.
--Return the first name of the employee and manager

select e.first_name Employee, c.first_name Manager from hr.Employees e
join hr.Employees c on e.manager_id = c.employee_id

--9. From the following tables, write a SQL query to display the department name, city, 
--and state province for each department.

select d.department_name, l.city, l.state_province from hr.Departments d
join hr.Locations l on d.location_id = l.location_id;

--10. From the following tables, write a SQL query to find out which employees have or do not have a department.
--Return first name, last name, department ID, department name.

select e.first_name, e.last_name, e.department_id, d.department_name from hr.Employees e
left join hr.Departments d on e.department_id = d.department_id;

--11. From the following table, write a SQL query to find the employees 
--and their managers. Those managers do not work under any manager also appear in the list. 
--Return the first name of the employee and manager.

select e.first_name Employee, m.first_name Manager from hr.Employees e
left join hr.Employees m on m.manager_id = e.employee_id;

--12. From the following tables, write a SQL query to find the employees 
--who work in the same department as the employee with the last name Taylor.
--Return first name, last name and department ID.

select e.first_name, e.last_name, e.department_id from hr.Employees e 
join hr.Departments d on e.department_id = d.department_id and e.last_name = 'Taylor';

--13. From the following tables, write a  SQL query to find all employees who joined on 
--or after 1st January 1993 and on or before 31 August 1997.
--Return job title, department name, employee name, and joining date of the job.

select j.job_title, d.department_name, e.first_name + ' ' + e.last_name Employee_Name, h.start_date from hr.Job_History h 
join hr.Jobs j on h.job_id = j.job_id
join hr.Departments d on h.department_id = d.department_id
join hr.Employees e on d.department_id = e.department_id
where h.start_date between '1993-01-01' and '1997-08-31';

--14. From the following tables, write a SQL query to calculate the difference 
--between the maximum salary of the job and the employee's salary. 
--Return job title, employee name, and salary difference.

select j.job_title, e.first_name + ' ' + e.last_name Employee, 
(j.max_salary - e.salary) Salary_Difference from hr.Employees e
join hr.jobs j on e.job_id = j.job_id;

--15. From the following table, write a SQL query to calculate the average salary, 
--the number of employees receiving commissions in that department.
--Return department name, average salary and number of employees.

select d.department_name, avg(e.salary) AvgSalary, count(e.employee_id) EmployeeNumber from hr.Departments d
join hr.Employees e on d.department_id = e.department_id
group by d.department_name;

--16. From the following tables, write a SQL query to calculate the difference between the maximum salary 
--and the salary of all the employees who work in the department of ID 80.
--Return job title, employee name and salary difference.

select j.job_title, e.first_name + ' ' + e.last_name EmployeeName, 
(j.max_salary - e.salary) SalaryDifference from hr.Employees e
join hr.jobs j on e.job_id = j.job_id
where e.department_id = 80;

--17. From the following table, write a SQL query to find the name of the country, city, 
--and departments, which are running there.

select c.country_name, l.city, d.department_name from hr.Countries c 
join hr.Locations l on c.country_id = l.country_id
join hr.Departments d on l.location_id = d.location_id;

--18. From the following tables, write a SQL query to find the department name 
--and the full name (first and last name) of the manager.

select d.department_name, e.first_name + ' ' + e.last_name Employee from hr.Departments d
join hr.Employees e on d.manager_id = e.employee_id;

--19. From the following table, write a SQL query to calculate the average salary of employees for each job title.

select avg(e.salary) AvgSalary, j.job_title from hr.Employees e
join hr.jobs j on e.job_id = j.job_id
group by j.job_title;

--20. From the following table, write a SQL query to find the employees who earn $12000 or more.
--Return employee ID, starting date, end date, job ID and department ID.

select h.* from hr.Job_History h
join hr.Employees e on e.employee_id = h.employee_id
where e.salary >= 12000;

--21. From the following tables, write a SQL query to find out which departments have at least two employees.
--Group the result set on country name and city. 
--Return country name, city, and number.

select c.country_name, l.city, count(d.department_id) cnt from hr.Countries c
join hr.Locations l on c.country_id = l.country_id
join hr.Departments d on l.location_id = d.location_id
join hr.Employees e on d.department_id = e.department_id
group by c.country_name, l.city;

--SELECT 
--    c.country_name, 
--    l.city, 
--    COUNT(d.department_id) AS cnt 
--FROM hr.Countries c
--JOIN hr.Locations l ON c.country_id = l.country_id
--JOIN hr.Departments d ON l.location_id = d.location_id
--JOIN hr.Employees e ON d.department_id = e.department_id
--WHERE d.department_id IN 
--    (SELECT e.department_id  -- Corrected reference
--     FROM hr.Employees e
--     GROUP BY e.department_id  -- Grouping by Employees table's department_id
--     HAVING COUNT(e.employee_id) >= 2)  -- Corrected COUNT condition
--GROUP BY c.country_name, l.city;

--22. From the following tables, write a SQL query to find the department name, 
--full name (first and last name) of the manager and their city.

select d.department_name, e.first_name + ' ' + e.last_name, l.city from hr.Employees e 
join hr.Departments d on d.manager_id = e.employee_id
join hr.Locations l on l.location_id = d.location_id;

--23. From the following tables, write a SQL query to calculate the number of days 
--worked by employees in a department of ID 80.
--Return employee ID, job title, number of days worked.

select e.employee_id, j.job_title, datediff(DAY, h.start_date, h.end_date) Days from hr.Employees e 
join hr.jobs j on e.job_id = j.job_id
join hr.Job_History h on e.employee_id = h.employee_id
where e.department_id = 80;

--24. From the following tables, write a SQL query to find full name (first and last name), 
--and salary of all employees working in any department in the city of London.

select e.first_name + ' ' + e.last_name Employee, e.salary, d.department_name, l.city from  hr.Employees e
join hr.Departments d on e.department_id = d.department_id
join hr.Locations l on l.location_id = d.location_id
where l.city = 'London';

--25. From the following tables, write a SQL query to find full name (first and last name), job title, start 
--and end date of last jobs of employees who did not receive commissions.

select e.first_name + ' ' + e.last_name Employee, j.job_title, h.start_date, h.end_date from  hr.Employees e
join hr.Job_History h on e.job_id = h.job_id
join hr.jobs j on h.job_id = j.job_id
where e.commission_pct = 0;

--26. From the following tables, write a  SQL query to find the department name, department ID, 
--and number of employees in each department

select d.department_name, d.department_id from hr.Employees e 
join hr.Departments d on e.department_id = d.department_id
where d.department_id in 
(select department_id from hr.Employees group by department_id having count(employee_id) > 0)

--27. From the following tables, write a SQL query to find out the full name 
--(first and last name) of the employee with an ID 
--and the name of the country where he/she is currently employed.

select e.first_name + ' ' + e.last_name Employee, e.employee_id, l.city, c.country_name from  hr.Employees e
join hr.Departments d on e.department_id = d.department_id
join hr.Locations l on d.location_id = l.location_id
join hr.Countries c on l.country_id = c.country_id