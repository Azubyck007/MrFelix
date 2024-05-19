

CREATE PROCEDURE dbo.Load_Matches_Refereed_By_M_Oliver
AS
BEGIN
    SET NOCOUNT ON;

    -- Truncate the table
    TRUNCATE TABLE dbo.Matches_Refereed_By_M_Oliver_Table;

    -- Insert data into dbo.Matches_Refereed_By_M_Oliver_Table from dbo.Matches_Refereed_By_M_Oliver view
    INSERT INTO dbo.Matches_Refereed_By_M_Oliver_Table (Date, HomeTeam, AwayTeam)
    SELECT 
        CONVERT(DATE, CONVERT(DATE, V.Date, 103), 103) AS Date, -- Convert 'dd/mm/yyyy' to DATE
        V.HomeTeam,
        V.AwayTeam
    FROM 
        dbo.Matches_Refereed_By_M_Oliver AS V;
END;

