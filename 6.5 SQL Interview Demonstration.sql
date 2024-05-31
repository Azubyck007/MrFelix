-- Q1: How do you explain what SQL is to someone without a technical background? 
-- 
-- SQL as the language you use to interact with a large, organized library of books
-- SQL, which stands for Structured Query Language, is the specific set of instructions you give to the "librarian" 
-- (the database management system) to organize, find, update, and manage data efficiently in a "library" (the database).

-- Here’s how it works:
--Retrieving Books (SELECT)
--Adding Books (INSERT)
--Updating Books (UPDATE)
--Removing Books (DELETE)

-- Q2: What are the different types of keys in SQL and when do you use them?

-- PRIMARY KEY uniquely identifies each record in a table.
-- Is used to enforce entity integrity. A table can have only one primary key, which can be a single column or a combination of columns.

CREATE TABLE Employee (
    EmployeeID int PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255)
);

--  Foreign Key is a column or a set of columns in one table that uniquely identifies a row in another table.
--  Is used to enforce referential integrity between two tables.
  
  CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    OrderDate date,
    EmployeeID int,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Unique Key ensures that all values in a column or a set of columns are unique across the table.
-- Is used to enforce uniqueness of values in a column or a set of columns.

  CREATE TABLE Users (
    UserID int PRIMARY KEY,
    Username varchar(255) UNIQUE
);
-- Others are:
-- Composite Key: Used when a single column is not enough to uniquely identify records, combining multiple columns instead.
-- Candidate Key: Used during the design phase to identify all possible unique keys; one of them is chosen as the primary key.
-- Alternate Key: Used when additional unique identifiers are needed besides the primary key.
-- Super Key: Used to identify all combinations of columns that can uniquely identify rows, useful in database design and normalization.


--	Q3: Can you list all of the joins in SQL and the use case for each of them?

--INNER JOIN - Returns only the rows where there is a match in both tables.
-- Is used when you need to retrieve records that have matching values in both tables.

				SELECT Orders.OrderID, Customers.CustomerName
				FROM Orders
				INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- LEFT JOIN - Returns all rows from the left table, and the matched rows from the right table. 
--             If there is no match, NULL values are returned for columns from the right table.
-- Is used when you need all records from the left table, and the matched records from the right table 

				SELECT Customers.CustomerName, Orders.OrderID
				FROM Customers
				LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN - Returns all rows from the right table, and the matched rows from the left table.
--              If there is no match, NULL values are returned for columns from the left table.
-- Is used when you need all records from the right table, and the matched records from the left table

				SELECT Orders.OrderID, Customers.CustomerName
				FROM Orders
				RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- FULL JOIN - Returns all rows when there is a match in one of the tables. It returns NULL for non-matching rows from either table.
-- Is used when you need all records from both tables, regardless of whether there is a match.

				SELECT Customers.CustomerName, Orders.OrderID
				FROM Customers
				FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Others are: 
-- CROSS JOIN: For all possible combinations of rows.
-- SELF JOIN: For joining a table with itself.
-- NATURAL JOIN: For automatic joins based on common column names.
-- USING Clause: For specifying columns to join on when they have the same name.
-- OUTER APPLY: For joining with table-valued functions, including all rows from the left table.
-- INNER APPLY: For joining with table-valued functions, including only matching rows.

--Q4: What is the importance of data integrity in your work with SQL?

-- Data integrity in SQL is crucial for maintaining database accuracy, consistency, and reliability. 
-- It enforces business rules, prevents corruption, and supports data security.
-- Types include entity, referential, domain, and user-defined integrity.
-- It enhances operational efficiency, compliance, and customer trust.