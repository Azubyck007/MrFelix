DROP VIEW IF EXISTS dbo.Matches_Refereed_By_M_Oliver
GO

CREATE VIEW dbo.Matches_Refereed_By_M_Oliver
AS

/****************************************
NAME: dbo.Matches_Refereed_By_M_Oliver
PURPOSE: To know the number of matches refereed by M Oliver
MODIFICATION LOG:
 Ver       Date         Author            Description
-1.0   05/18/2024   Okolocha Felix    I built this Script for EC-IT143
----------------------------------------
RUNTIME:1S
Xm Xs
NOTES:
This is where I talk about what this script is, why I built it, and the steps it took...
**************************************************************************
****************************************/
SELECT Date, HomeTeam, AwayTeam
FROM [soccer21-22]
WHERE Referee = 'M Oliver'

