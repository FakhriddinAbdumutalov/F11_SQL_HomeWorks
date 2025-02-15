

--------------------------------------- Homework 3 part 1 --------------------------------------------


--Puzzle 3
--If all the columns having zero value then don't show that row.
--In this case we have to remove the 5th row while selecting data

--Create table
CREATE TABLE [dbo].[TestMultipleZero]
(
    [A] [int] NULL,
    [B] [int] NULL,
    [C] [int] NULL,
    [D] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0)

select * from [dbo].[TestMultipleZero]
where not(A = 0 and B = 0 and C = 0 and D = 0);







--------------------------------------- Homework 3 part 2 --------------------------------------- 



--Puzzle 4
--In the puzzle we have to find the duplicate values from a duplicate table where duplicate vaules are more than 1

CREATE TABLE TESTDuplicateCount ( 
    ID INT,
    EmpName VARCHAR(100),
    EmpDate DATETIME
) 
--Insert Data 
INSERT INTO TESTDuplicateCount(ID,EmpName,EmpDate) 
VALUES
(1,'Pawan','2014-01-05'),
(2,'Pawan','2014-03-05'), 
(3,'Pawan','2014-02-05'), 
(4,'Manisha','2014-07-05'), 
(5,'Sharlee','2014-09-05'), 
(6,'Barry','2014-02-05'), 
(7,'Jyoti','2014-04-05'), 
(8,'Jyoti','2014-05-05')

select empName, count(*) as DuplicateCount
from TESTDuplicateCount
group by EmpName
having count(*) > 1 




--------------------------------------- Homework 3 part 3 --------------------------------------- 



--Write a query to identify a number is perfect or not


declare @num int = 42; 
declare @sum int = 0;
declare @i int = 1;

while @i < @num
begin
    if @num % @i = 0
        set @sum = @sum + @i;
    set @i = @i + 1;
end

select @num as number, 
       @sum as sum_of_divisors,
       case 
           when @sum = @num then 'perfect number'
           else 'not a perfect number'
       end as result;

