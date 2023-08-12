-- QUERY 1 (Join):

-- Consider a database with two tables:
-- 1. Table name: "Employees" Columns: "EmployeeID" (integer, primary key), "FirstName" (text), "LastName" (text), "DepartmentID" (integer), "Salary" (decimal).
-- 2. Table name: "Departments" Columns: "DepartmentID" (integer, primary key), "DepartmentName" (text), "Location" (text).
-- Now, let's assume you want to retrieve the names and salaries of all employees who work in the "Marketing" department and earn a salary greater than $50,000. Write an SQL query to fetch this information.

-- SQL Query (Join):

Select
	a.FirstName,
	a.LastName,
	a.Salary,
	b.DepartmentID
From
	Employees a
Join
	Departments b
	ON
	a.DepartmentID = b.DepartmentID 
Where
	b.DepartmentName = 'Marketing' and
	a.Salary > 50000
	;


-- QUERY 2 (Joins & Sub-query):
-- Consider a database with the following two tables:
-- 1. Table name: "Orders" Columns: "OrderID" (integer, primary key), "CustomerID" (integer), "OrderDate" (date), "TotalAmount" (decimal).
-- 2. Table name: "Customers" Columns: "CustomerID" (integer, primary key), "CustomerName" (text), "City" (text), "Country" (text).
-- Now, write an SQL query to find the total number of orders and the total amount spent by each customer from the "United States." Display the results with the following columns: "CustomerName," "City," "Country," "TotalOrders," and "TotalAmountSpent."


-- SQL Query (Joins & Sub-query):

	Select
		a.CustomerName,
        	a.City,
        	a.Country,
        	count(d.OrderID) as TotalOrders,
        	Sum(d.TotalAmount) as TotalAmountSpent
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
	Group By a.CustomerName, a.City, a.Country
	Order By a.CustomerName, a.City, a.Country;



-- QUERY 3 (Case Statement):
-- Consider a database with the following two tables:
-- 1. Table name: "Employees" Columns: "EmployeeID" (integer, primary key), "FirstName" (text), "LastName" (text), "DepartmentID" (integer), "Salary" (decimal), "Gender" (text).
-- 2. Table name: "Departments" Columns: "DepartmentID" (integer, primary key), "DepartmentName" (text), "Location" (text).
-- Write an SQL query to retrieve a list of employees along with their names, departments, salaries, and an additional column "GenderGroup," which categorizes employees into "Male" and "Female" based on their gender.


-- SQL Query (CASE Statement):

	Select
		a.FirstName,
		a.LastName,
		b.DepartmentName,
		a.Salary,
		CASE
			When a.Gender = 'M'  then 'M'
			Else 'F'
		END AS GenderGroup
	From Employees a
	Join Departments b
	On a.DepartmentID = b.DepartmentID;



-- QUERY 4 (Aggregate Functions):
	
-- Consider a database with the following two tables:
-- 1. Table name: "Employees" Columns: "EmployeeID" (integer, primary key), "FirstName" (text), "LastName" (text), "DepartmentID" (integer), "Salary" (decimal), "Gender" (text).
-- 2. Table name: "Departments" Columns: "DepartmentID" (integer, primary key), "DepartmentName" (text), "Location" (text).
-- Calculate the average salary for employees in each department, and based on their salary, categorize them into salary groups. The salary groups will be 'Low' for salaries less than $50,000, 'Medium' for salaries between $50,000 and $80,000 (inclusive), and 'High' for salaries greater than $80,000.


-- SQL Query (Aggregate Functions):


	Select
		b.DepartmentName,
		Count(*) as Total_Employees
		AVG(a.Salary) as Avg_Sal
		CASE
			When AVG(a.Salary) < 50000 then 'Low'
			When AVG(a.Salary) >= 50000 and AVG(a.Salary) <=80000 then 'Medium'
			Else 'High'
		END AS Salary_Category
	From Employees a
	Join Departments b
	On a.DepartmentID = b.DepartmentID
	Group By DepartmentName;



-- QUERY 5:
	
-- Consider the following three tables in the database:
-- 3. Table name: "Orders" Columns: "OrderID" (integer, primary key), "CustomerID" (integer), "OrderDate" (date).
-- 4. Table name: "Customers" Columns: "CustomerID" (integer, primary key), "CustomerName" (text), "City" (text), "Country" (text).
-- 5. Table name: "OrderDetails" Columns: "OrderDetailID" (integer, primary key), "OrderID" (integer), "ProductID" (integer), "Quantity" (integer), "UnitPrice" (decimal).
	
-- Now, write an SQL query to find the total sales amount for each customer. The total sales amount is the sum of the Total Dollar value that can be calculated using "UnitPrice" multiplied by "Quantity" from the "OrderDetails" table for each customer.
	
-- SQL Query (Aggregate Functions):
	
	Select
		b.CustomerName,
		b.CustomerID,
		Sum(c.UnitPrice * c.Quantity) as SalesAmount
	From Customers b
	Join Orders a On b.CustomerID = a.CustomerID
	Join OrderDetails c On c.OrderID = a.OrderID
	Group By CustomerName, b.CustomerID;


-- QUERY 6 (Date Manipulation):
	
-- In the above query if the SalesAmount is to be calculated only for months Apr & May:

-- SQL Query (Date Manipulation):

	Select
		b.CustomerName,
		b.CustomerID,
		Sum(c.UnitPrice * c.Quantity) as SalesAmount
		From Customers b
		Join Orders a On b.CustomerID = a.CustomerID
		Join OrderDetails c On c.OrderID = a.OrderID
		WHERE MONTH(a.OrderDate) IN (4, 5)
    Group By CustomerName, CustomerID;


-- QUERY 7:
-- If the SalesAmount is to be calculated for dates before May end or other date operations
	
-- SQL Query (Date Manipulation):

	Select
		b.CustomerName,
		b.CustomerID,
		Sum(c.UnitPrice * c.Quantity) as SalesAmount
		From Customers b
		Join Orders a On b.CustomerID = a.CustomerID
		Join OrderDetails c On c.OrderID = a.OrderID
		WHERE a.OrderDate < '2023-05-30'
    Group By CustomerName, b.CustomerID;

	
-- Another Eg. 
-- WHERE o.OrderDate BETWEEN '2023-04-01' AND '2023-06-30'



