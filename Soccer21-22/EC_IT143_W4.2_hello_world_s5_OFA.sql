

-- Drop the table if it already exists
DROP TABLE IF EXISTS dbo.Matches_Refereed_By_M_Oliver_Table;
GO

-- Create the table
CREATE TABLE dbo.Matches_Refereed_By_M_Oliver_Table (
    Date DATE,
    HomeTeam NVARCHAR(255),
    AwayTeam NVARCHAR(255), 
);
GO
-- Insert data into the new table from the view
INSERT INTO dbo.Matches_Refereed_By_M_Oliver_Table (Date, HomeTeam, AwayTeam)
SELECT 
    TRY_CAST(Date AS DATE) AS Date,
    HomeTeam,
    AwayTeam
FROM 
    dbo.Matches_Refereed_By_M_Oliver;
GO

