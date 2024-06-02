--Q: How to extract first name from contact name?

-- A: Well, here is your problem.....
--    ContactName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from combine name tsql stackflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT t.ContactName,
LEFT (t.ContactName,CHARINDEX(' ', t.ContactName + ' ')-1) AS first_name
FROM [dbo].[t_w3_schools_customers] AS t
ORDER BY 1
