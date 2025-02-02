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

--Answer

Select *
from [dbo].[TestMultipleZero]
where not (A = 0 and B = 0 and C = 0 and D = 0);