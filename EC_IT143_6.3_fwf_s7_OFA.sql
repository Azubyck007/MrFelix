-- Step7
-- Q: How to extract first name from contact name?

-- A: Well, here is your problem.....
--    ContactName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from combine name tsql stackflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

WITH s1 --Use a common Table expreesion and compare first_name to first_name2

AS (SELECT t.ContactName
		, LEFT(t.ContactName,CHARINDEX(' ',t.ContactName + ' ')-1) AS first_name
		, dbo.udf_parse_first_name(t.ContactName) AS first_name2
FROM [dbo].[t_w3_schools_customers] AS t)
	
	 SELECT *
	 FROM s1
	 WHERE first_name <> first_name2; -- Expected output is 0
