--Lesson SQL-5 Task 1 

--Puzzle 3 If all the columns having zero value then don't show that row.
--In this case we have to remove the 5th row while selecting data.



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

--Answer for puzzle 3

Select *
from [dbo].[TestMultipleZero]
where not (A = 0 and B = 0 and C = 0 and D = 0);

--Answer for puzzle 4

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

select EmpName, count(*) as DuplicateCount
from TESTDuplicateCount
group by EmpName
having count(*) > 1;


declare @Num int = 6; -- Change this number to check others
declare @Sum int = 0;
declare @i int = 1;

while @i < @Num
begin
    if @Num % @i = 0
        set @Sum = @Sum + @i;
    set @i = @i + 1;
end;

if @Sum = @Num
    print cast(@Num as varchar) + ' is a Perfect Number';
else
    print cast(@Num as varchar) + ' is NOT a Perfect Number';
