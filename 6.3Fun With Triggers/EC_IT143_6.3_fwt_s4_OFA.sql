CREATE TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world
AFTER UPDATE
AS
/*************************************************************************
****************************************
NAME: dbo.trg_hello_world_last_mod
PURPOSE: Hello World - Last Modified By Trigger
MODIFICATION LOG:
Ver    Date    Author    Description
----- ---------- ----------- ---------------------------------------
1.0 05/30/2024 OFELIX    1. Built this script for EC IT143
RUNTIME:
1s
NOTES:
This is where I talk about what this script is, why I built it, and other
stuff...
**************************************************************************
****************************************/
BEGIN
    UPDATE dbo.t_hello_world
    SET 
		last_modified_date = GETDATE()
    WHERE my_message IN
    (
        SELECT DISTINCT my_message
        FROM inserted
    );
END;
GO