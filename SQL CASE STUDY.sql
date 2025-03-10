--   CASE STUDY 2
--1) How many states are there where products have been sold ?
     Select COUNT(DISTINCT State) As COUNTSTATE From Location 
	
--2) How many products are of regular type ?
     Select COUNT(Product) As COUNT_OF_PRODUCT From Product
	 Where Type ='Regular'
	 
--3) How much spending has been done on marketing of product id 1
     Select SUM(Marketing) As MARKETING from fact where Productid=1

--4) What is the minimum sales of a product ?     Select MIN(sales) As MINSALES from fact

--5) Display max Cost of Good Sold(COGS).     Select MAX(COGS) As MAXSOLD from fact

--6) Display the Details of the productid where product type is coffee
     Select  Productid from Product where Product_Type='Coffee'

--7) Display the details where total_expenses is greater than 40.     Select * from fact where total_expenses > 40--8) What is the average sales in Area_Code 719 ?     Select AVG(Sales) As AVGSALES from fact where Area_Code=719--9) Find out the total profit generated by Colorado state.     Select SUM(Profit) As TOTALPROFIT from fact INNER JOIN Location     ON fact.Area_Code=Location.Area_Code where State='Colorado'
--10) Display the average inventory for each product id.
      Select Productid, AVG(Inventory) as AVGINVENTORY from fact 
      GROUP BY Productid ORDER BY Productid ASC

--11) Display state in a sequential order in a location table.
      Select * from Location ORDER BY State DESC

--12) Display the average budget margin of the store where average budget margin should be
--    greater than 100.
      Select  Productid ,AVG(Budget_Margin) As AVGMARGIN from fact 
      GROUP BY Productid HAVING AVG(Budget_Margin) > 100

--13) What is the total sales done on date 2010-01-01      Select SUM(Sales) As Total_Sales from fact 
      where Date='2010-01-01'

--14) Display the average total expense of each product id on individual date
      Select Productid, Date, AVG(Total_Expenses) As Avg_Total_Expense 
      from fact GROUP BY Productid ,Date

--15) Display the table with the following attributes such as
--    Date, productid, product_type, product, Sales, profit, state, area_code
      Select fact.Date , fact.Productid ,Product.Product_type ,fact.Sales, 
	  fact.Profit, Location.State,Location.Area_Code from fact 
	  INNER JOIN Location  ON fact.Area_Code=Location.Area_Code
      INNER JOIN Product ON fact.Productid=Product.Productid

--16) Display the rank without any gap to show the Sales wise rank.      Select Date, Productid ,Sales,Profit ,Area_Code ,
      dense_rank() over (order by Sales asc) as Sales_Rank from fact

--17) Find the State wise Profit and Sales.
      Select State ,SUM(Sales) As Sales , SUM(Profit) As profit from fact
	  INNER JOIN
      Location ON fact.area_code=location.area_code GROUP BY State


--18) Find the State wise Profit and Sales along with the Product Name.
      Select Product ,State,SUM(Sales) as sales ,SUM(Profit) As profit 
      from fact INNER JOIN Location on fact.Area_Code=Location.Area_Code
      INNER JOIN Product ON fact.Productid= Product.Productid GROUP BY State, 
	  Product

 --19) If there is an increase in sales of 5%. Calculate the increased sales.
       Select  Sales, (Sales*0.05) As increased_sales from fact

 --20) Find the maximum profit along with the Product id and Product Type.       Select fact.productid, product.type ,fact.profit from fact 
	   INNER JOIN Product
       ON  fact.productid=Product.productid 
       where fact.Profit=(Select MAX(Profit) from fact)

--21) Create a Stored Procedure to fetch the result according 
--    to the product type from Product.
      Create Procedure ptype @prod_type varchar(20) 
      as 
      Select * from Product
      where Product_type = @prod_type

      exec ptype @prod_type ='Coffee'

--22) Write a query by creating a condition in which if the total expenses is
--    less than 60 then it is profit or else loss.
      Select total_expenses , iif(total_expenses<60,'profit','loss') 
	  as Status from fact

--23) Give the total weekly sales value with the Date and productid details. Use roll-up to pull the
--    data in hierarchical order.      Select date, Productid , SUM(Sales) As total_weeklysales from fact	  GROUP BY date , productid  with rollup--25) Create a user-defined function for the product table to fetch 
--    a particular product type based upon the user�s preference.
      Create function Producttable(@Product_type varchar(20))
      returns
      table as 
      return select * from product where product_type=@product_type

      Select * from dbo.producttable('coffee')

--26) Change the product type from coffee to tea where product id is 1 
--    and undo it.
      Begin transaction
      UPDATE Product SET Product_type='tea' where Productid =1
      rollback transaction

--27) Display the Date, productid and sales where total expenses
--    are between 100 to 200.
      Select Date ,Productid ,Sales , Total_Expenses from fact where 
      Total_Expenses between 100 and 200

--28) Delete the records in the product table for regular type.
      Delete from Product where Type='Regular'

--29) Display the ASCII value of the fifth character from the column product
      Select Product ,ASCII(SUBSTRING(Product,5,1)) 
	  As ascii_value from Product

