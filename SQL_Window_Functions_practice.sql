-- QUERY 8:
-- Question: For each customer, find the running total of their TotalAmount over time, ordered by OrderDate.
	
	
	
Select
	a.CustomerName,
	d.OrderID,
	d.CustomerID,
	d.OrderDate,
	Sum(d.TotalAmount) OVER (Partition by d.CustomerID Order by d.OrderDate asc) as Cumulative
	From
	(Select
		b.OrderID,
		b.CustomerID,
		b.OrderDate,
		Sum(c.Quantity * c.UnitPrice) as TotalAmount
	From Orders b
	Join OrderDetails c ON b.OrderID = c.OrderID
	Group By b.OrderID, b.CustomerID, b.OrderDate
	) d
	Join Customers a ON d.CustomerID = a.CustomerID
	Order By a.CustomerID, d.OrderDate;
	
	
-- QUERY 9:
-- Retrieve the top 3 orders based on the highest TotalAmount for each customer. 
	
	
Select * 
	    From (
	    Select
			a.CustomerID,
			a.CustomerName,
			d.OrderID,
			d.OrderDate,
			d.TotalAmount,
			Rank() OVER (Partition by a.CustomerID Order by d.TotalAmount desc) as OrderRank
		From
		(
		SELECT
		        b.OrderID,
		        b.CustomerID,
		        b.OrderDate,
		        SUM(c.Quantity * c.UnitPrice) AS TotalAmount
		    FROM Orders b
		    JOIN OrderDetails c ON b.OrderID = c.OrderID
		    GROUP BY b.OrderID, b.CustomerID, b.OrderDate
		) as d
		Join Customers a on d.CustomerID = a.CustomerID
	    ) Ranked_Orders
	    Where OrderRank <=3
	    ;
	
	
-- QUERY 10:
	
-- Given two tables, "Employees" and "Departments," defined in the schema, write a query to find the names of the top 5 highest-paid employees in each department.
	
	
	Select * From
	(
	Select
		b.DepartmentName,
		a.FirstName,
		a.LastName,
		a.Salary,
		Rank() OVER (Partition by b.DepartmentName Order by a.Salary Desc) as Salary_Rank
	From Employees a
	Join Departments b Join On a.DepartmentID = b.DepartmentID
	) as c
	Where Salary_Rank <=5
	;
	
	
-- QUERY 11:
	
-- Write a SQL query to find the second-highest salary from the "Employees" table without using the LIMIT keyword.
	
	
Select * From
    (Select 
		a.*,
		DENSE_RANK() OVER (order by a.Salary desc) as Sal_Rank
	from Employees a) b
    Where Sal_Rank = 2;

  SELECT MAX(Salary) AS SecondHighestSalary
  FROM Employees
  WHERE Salary < (
    SELECT MAX(Salary) 
    FROM Employees
  );

	
	
-- QUERY 12:
	
-- We want the average sales per order in a day where OrderID is the order number? Note there could be multiple orders in each day.
	
Select
b.OrderDate,
avg(c.Total_Sum) as Avg_Amount
From
(
Select 
  a.OrderID,
  Sum(a.UnitPrice * a.Quantity) as Total_Sum
 From Orderdetails a
 Group By a.OrderID
 ) c
 Join Orders b On c.OrderID = b.OrderID
 Group by b.OrderDate
 Order by b.OrderDate;
	
	
-- QUERY 13:
	
-- Given a table "Products" with columns "ProductID," "Category," and "Price," write a query to find the top 3 most expensive products in each category.
	
Select
	*
	From
	(
	  Select
	  category,
	  Price,
	  Rank() OVER (PARTITION BY Category Order by Price Desc) as Price_Rank
	From
	  Products
	  ) b
	  Where Price_Rank <=3;