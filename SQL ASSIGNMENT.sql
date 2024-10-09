 
   select * from Salesman  select * from Customer   select * from Orders

-- 1. Insert a new record in your Orders table. 
     insert into orders values(601,'2023-12-13',1000,8)
 
 
 /*2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.*/

 
  alter table Salesman
  add constraint PK_Salesman PRIMARY KEY (SalesmanId);

  alter table Salesman
  alter column city SET DEFAULT 'unknown'

  alter table Salesman
  alter column City SET DEFAULT 'Unknown';

 
  alter table Customer
  add constraint FK FOREIGN KEY(SalesmanId) REFERENCES Salesman(SalesmanId);

  alter table Customer
  alter column CustomerName VARCHAR(255) NOT NULL;

/*3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
     amount value greater than 500.*/

	 select * from Customer as c inner join Orders as o on c.Customer_id = o.customer_id
	 where  First_name like '%N' and Amount > 500;


/*4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.*/

     SELECT SalesmanId FROM Salesman UNION
	 SELECT order_id FROM Orders

	 SELECT SalesmanId FROM Salesman UNION ALL
	 SELECT order_id FROM Orders

	 

/*5. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500*/

 select * from Orders    Select * from Customer    select * from Salesman


  SELECT O.order_date, S.Name, C.First_name,S.Commission , S.City FROM Orders AS O
  INNER JOIN  Customer as C ON O.order_id = C.Customer_id INNER JOIN Salesman AS S
  ON S.SalesmanId = o.order_id WHERE O.Amount BETWEEN 500 AND 1500

 -- 6. Using right join fetch all the results from Salesman and Orders table.    SELECT * FROM Salesman AS S RIGHT JOIN Orders AS O ON S.SalesmanId = O.order_id	 	
 select * from Orders   select * from Salesman	  	   --SQL Mandatory Assignment 2	     --1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
--   Chicken Bites’.

                
CREATE FUNCTION dbo.GetQuickBites()
RETURNS TABLE
AS
RETURN
(SELECT *, STUFF('Quick Bites', CHARINDEX(' ', 'Quick Bites'), 0, ' Chicken') AS NewName FROM jomato
);


SELECT * FROM dbo.GetQuickBites();


/*2. Use the function               to display the restaurant name and cuisine type which has the
         maximum number of rating.*/
 
  select * from Jomato

  create function dbo.rating()
  returns table
  return
  select restaurantname , CuisinesType,No_of_Rating from Jomato where No_of_Rating in (select max( No_of_Rating)
  from Jomato)

  select * from dbo.rating()

 -- drop function dbo.rating

/*3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3 star rating.*/
 
   select * ,  RatingStatus =
  (select 
   CASE
        WHEN rating > 4 THEN 'Excellent'
        WHEN rating > 3.5 AND rating <= 4 THEN 'Good'
        WHEN rating > 3 AND rating <= 3.5 THEN 'Average'
        WHEN rating <= 3 THEN 'Bad'
        ELSE NULL 
    END) from jomato;


/*4. Find the Ceil, floor and absolute values of the rating column         and display the current date
and separately                           display the year, month_name and day.*/

     select CEILING(Rating) AS Ceil , FlOOR(Rating) AS Flooor , ABS(Rating) AS Absolute , GETDATE() AS
	 CurrentDate, YEAR(GETDAtE()) AS Yearr,
	 MONTH(GETDATE()) AS Monthh , DAY(GETDATE()) AS Dayy from Jomato

--5. Display the restaurant type and total average cost using rollup.

     select * from Jomato

	 select Restauranttype , AverageCost from Jomato Group by Restauranttype,AverageCost with
	 rollup

	
--SQL Mandatory Assignment 3/*1. Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero.*/   select * from Jomato	create procedure zero	as	select RestaurantName , RestaurantType , CuisinesType,TableBooking from jomato where	TableBooking not in (0)	exec zero/*2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.*/

    Begin Transaction

	update Jomato
	set CuisinesType  = 'Cafeteria'
	where  CuisinesType  = 'Cafe'

	Rollback Transaction

/*3. Generate a row number column and find the top 5 areas with the highest rating of
restaurants.*/   select * from Jomato     	select top 5 * ,  row_number() over(order by Rating desc) as RowNumber from Jomato--4. Use the while loop to display the 1 to 50.

     DECLARE @Counter INT = 1;

     WHILE @Counter <= 50
     BEGIN
     PRINT @Counter;
     SET @Counter = @Counter + 1;
     END;



/*5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants.*/	CREATE VIEW TopRating AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNumber
    FROM Jomato
) AS Ranked
WHERE RowNumber <= 5;


SELECT * FROM TopRating;
--6. Create a trigger that give an message whenever a new record is inserted.      create trigger inserted on Jomato	 after insert	 as begin	 print 'New Record has been Inserted'	 end	 	