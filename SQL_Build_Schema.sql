-- Building Schema

-- Create below tables & insert data
-- Create tables: Orders, OrderDetails, Customers
-- Create tables: Departments, Employees
-- Create tables: Products


Create TABLE Orders (
  OrderID INT,
  CustomerID INT,
  OrderDate DATE
  );
  
  INSERT INTO Orders (OrderID, CustomerID, OrderDate)
  VALUES
  (1,12,'2023-07-24'),
(2,13,'2023-07-10'),
(3,14,'2023-07-10'),
(4,15,'2023-07-10'),
(5,16,'2023-07-24'),
(6,12,'2023-06-19'),
(7,13,'2023-06-12'),
(8,14,'2023-06-05'),
(9,15,'2023-05-29'),
(10,16,'2023-05-22'),
(11,12,'2023-05-15'),
(12,13,'2023-05-08'),
(13,14,'2023-05-01'),
(14,15,'2023-04-24'),
(15,16,'2023-04-17'),
(16,12,'2023-04-10')
;


Create TABLE Customers (
  CustomerID INT, 
  CustomerName VARCHAR(20), 
  City VARCHAR(50), 
  Country VARCHAR(50)
);
  
  INSERT INTO Customers (CustomerID, CustomerName, City, Country)
  VALUES
  ('12','Test1','New York','United States'),
('13','Test2','Beijing','China'),
('14','Test3','London','United Kingdom'),
('15','Test4','Paris','France'),
('16','Test5','Hong Kong','China')
;

Create TABLE OrderDetails (
  OrderDetailID INT,
  OrderID INT,
  ProductID VARCHAR(10),
  Quantity FLOAT,
  UnitPrice FLOAT
  );
  
  INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
  VALUES
(1,1,'A',5,80),
(2,2,'A',9,80),
(3,3,'A',9,80),
(4,4,'A',2,80),
(5,5,'A',2,80),
(6,6,'A',0,80),
(7,7,'A',9,80),
(8,8,'A',9,80),
(9,9,'A',2,80),
(10,10,'A',5,80),
(11,11,'A',3,80),
(12,12,'A',4,80),
(13,13,'A',6,80),
(14,14,'A',7,80),
(15,15,'A',3,80),
(16,16,'A',9,80),
(17,1,'B',4,40),
(18,2,'B',6,40),
(19,3,'B',8,40),
(20,4,'B',3,40),
(21,5,'B',4,40),
(22,6,'B',2,40),
(23,7,'B',0,40),
(24,8,'B',9,40),
(25,9,'B',8,40),
(26,10,'B',3,40),
(27,11,'B',2,40),
(28,12,'B',9,40),
(29,13,'B',0,40),
(30,14,'B',8,40),
(31,15,'B',0,40),
(32,16,'B',1,40),
(33,1,'C',4,70),
(34,2,'C',7,70),
(35,3,'C',8,70),
(36,4,'C',3,70),
(37,5,'C',1,70),
(38,6,'C',2,70),
(39,7,'C',5,70),
(40,8,'C',7,70),
(41,9,'C',9,70),
(42,10,'C',4,70),
(43,11,'C',4,70),
(44,12,'C',3,70),
(45,13,'C',4,70),
(46,14,'C',8,70),
(47,15,'C',9,70),
(48,16,'C',1,70)
;

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Insert data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Marketing'),
    (2, 'Sales'),
    (3, 'Finance'),
    (4, 'HR');

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    Gender VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary, Gender, DepartmentID)
VALUES
    -- DepartmentID: 1 (Marketing)
    (1, 'John', 'Doe', 75000.00, 'M', 1),
    (2, 'Jane', 'Smith', 80000.00, 'F', 1),
    (3, 'Mike', 'Johnson', 90000.00, 'M', 1),
    (4, 'Emily', 'Brown', 70000.00, 'F', 1),
    (5, 'David', 'Lee', 85000.00, 'M', 1),
    (6, 'Sarah', 'Williams', 72000.00, 'F', 1),
    (7, 'James', 'Miller', 82000.00, 'M', 1),
    (8, 'Laura', 'Taylor', 78000.00, 'F', 1),

    -- DepartmentID: 2 (Sales)
    (9, 'Daniel', 'Anderson', 88000.00, 'M', 2),
    (10, 'Anna', 'Martin', 76000.00, 'F', 2),
    (11, 'Robert', 'Wilson', 92000.00, 'M', 2),
    (12, 'Sophia', 'Thompson', 84000.00, 'F', 2),
    (13, 'William', 'Clark', 78000.00, 'M', 2),
    (14, 'Olivia', 'Hall', 86000.00, 'F', 2),
    (15, 'Michael', 'Adams', 79000.00, 'M', 2),
    (16, 'Emma', 'Allen', 91000.00, 'F', 2),

    -- DepartmentID: 3 (Finance)
    (17, 'Benjamin', 'Parker', 72000.00, 'M', 3),
    (18, 'Ava', 'Cook', 89000.00, 'F', 3),
    (19, 'Ethan', 'Green', 77000.00, 'M', 3),
    (20, 'Isabella', 'Bell', 93000.00, 'F', 3),
    (21, 'Mason', 'King', 93000.00, 'M', 3),
    (22, 'Mia', 'Turner', 93000.00, 'F', 3),
    (23, 'Alexander', 'Ward', 74000.00, 'M', 3),
    (24, 'Charlotte', 'Brooks', 89000.00, 'F', 3),

    -- DepartmentID: 4 (HR)
    (25, 'Daniel', 'Collins', 78000.00, 'M', 4),
    (26, 'Sophia', 'White', 82000.00, 'F', 4),
    (27, 'Elijah', 'Carter', 75000.00, 'F', 4),
    (28, 'Ava', 'Scott', 90000.00, 'F', 4),
    (29, 'Logan', 'Allen', 82000.00, 'M', 4),
    (30, 'Ella', 'Gonzalez', 87000.00,'F', 4),
    (31, 'Jackson', 'Harris', 76000.00, 'M', 4),
    (32, 'Chloe', 'Hill', 84000.00, 'F', 4);





CREATE TABLE Products (
    ProductID INT,
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, Category, Price) VALUES
    (1, 'Electronics', 500.00),
    (2, 'Clothing', 200.00),
    (3, 'Electronics', 800.00),
    (4, 'Electronics', 650.00),
    (5, 'Clothing', 300.00),
    (6, 'Beauty', 150.00),
    (7, 'Clothing', 400.00),
    (8, 'Beauty', 180.00),
    (9, 'Electronics', 700.00),
    (10, 'Clothing', 250.00),
    (11, 'Beauty', 120.00),
    (12, 'Electronics', 900.00);