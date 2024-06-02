--Step 5
 CREATE FUNCTION [dbo].[udf_parse_first_name]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)


/*****************************************************************************************************************
NAME:    dbo.udf_parse-first_name
PURPOSE: Parse first name from combined name
MODIFICATION LOG:
Ver      Date           Author               Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/29/2024   OkolochaFelix       1. Built this view for EC IT143
RUNTIME: 
1s
NOTES: 
The purpose of this view is to...
 
******************************************************************************************************************/
BEGIN
		DECLARE @v_first_name AS VARCHAR(100)
		SET  @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ',@v_combined_name + ' ') - 1);

		RETURN @v_first_name;
	
	END;
GO