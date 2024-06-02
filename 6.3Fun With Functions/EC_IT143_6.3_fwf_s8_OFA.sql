SELECT t.CustomerID
	 , t.CustomerName
	 , t.ContactName
	 , dbo.udf_parse_first_name(t.ContactName) AS first_name
	 , ' ' AS ContactName_last_name
	 , t.Address
	 , t.City
	 , t.Country
	 FROM dbo.t_w3_schools_customers AS t
	 ORDER BY 3;