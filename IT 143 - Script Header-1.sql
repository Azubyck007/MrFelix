/*****************************************************************************************************************
CREATE VIEW 
NAME:    My Script Name
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: How many countries appear in the Person.CountryRegion table?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...
-- Question from Liah Macasaet

SELECT COUNT(DISTINCT CountryRegionCode)
AS NumberOfCountries
FROM Person.CountryRegion;


-- Question from Liah Macasaet
-- Q2:  How many items with ListPrice more than $600 have been sold?
-- A2: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT 
    COUNT(*) AS NumberOfItemsSold
FROM 
    Sales.SalesOrderDetail sod
INNER JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
WHERE 
    p.ListPrice > 600;

-- Question from Nixon  Ehaji
-- Q3: How many sales orders have been placed by customers, and what is the average order value for these customers?
-- A3: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT 
    COUNT(*) AS TotalOrders,
    AVG(TotalDue) AS AverageOrderValue
FROM 
    Sales.SalesOrderHeader

-- Question from Adrian Marwin Matro
-- Q4: Which City improved in sales?
-- A4: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT
    City,
    SUM(TotalDue) AS TotalSales
FROM
    Sales.SalesOrderHeader soh
INNER JOIN
    Person.Address a ON soh.BillToAddressID = a.AddressID
GROUP BY
    City;

-- Question from God's Power Udoma
-- Q5: Can you show the total number of products sold each year and point out the product category that sold the most each year?
-- A5: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT 
    YEAR(soh.OrderDate) AS SalesYear,
    pc.Name AS ProductCategory,
    COUNT(*) AS TotalProductsSold
FROM 
    Sales.SalesOrderHeader soh
INNER JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
INNER JOIN 
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN 
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY 
    YEAR(soh.OrderDate), pc.Name
ORDER BY 
    SalesYear, TotalProductsSold DESC;


-- Question from Olawunmi Omopariola
-- Q6: Can you provide a breakdown of the top-selling products in the AdventureWorks database, including the quantity sold, revenue generated, and the average selling price for each product category?
-- A6: Question goes on the previous line, intoduction to the answer goes on this line...

WITH ProductSales AS (
    SELECT
        pc.Name AS ProductCategory,
        p.ProductID,
        p.Name AS ProductName,
        SUM(sod.OrderQty) AS TotalQuantitySold,
        SUM(sod.LineTotal) AS TotalRevenue,
        AVG(sod.UnitPrice) AS AverageSellingPrice
    FROM
        Production.Product p
    INNER JOIN
        Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    INNER JOIN
        Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
    INNER JOIN
        Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
    GROUP BY
        pc.Name,
        p.ProductID,
        p.Name
),
RankedProducts AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY ProductCategory ORDER BY TotalQuantitySold DESC) AS SalesRank
    FROM
        ProductSales
)
SELECT
    ProductCategory,
    ProductName,
    TotalQuantitySold,
    TotalRevenue,
    AverageSellingPrice
FROM
    RankedProducts
WHERE
    SalesRank = 1
ORDER BY
    ProductCategory;


-- Question from Olawunmi Omopariola
-- Q7: How many indexes are there in the AdventureWorks database, and which tables do they belong to?
-- A7: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT 
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM 
    sys.indexes i
INNER JOIN 
    sys.tables t ON i.object_id = t.object_id
WHERE 
    t.type_desc = 'USER_TABLE';

-- Question from Okolocha Felix (mine question)
-- Q8: Can you provide a list of columns in the person.person table?
-- A8: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person'
AND TABLE_SCHEMA = 'Person';

-- Question from Okolocha Felix (mine question)
-- Q9: Can you provide a list of columns in the person.person table?
-- A9: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person'
AND TABLE_SCHEMA = 'Person';
