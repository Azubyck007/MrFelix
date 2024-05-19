INSERT INTO dbo.Matches_Refereed_By_M_Oliver_Table (Date, HomeTeam, AwayTeam)
SELECT 
    CONVERT(DATE, Date, 103) AS Date,
    HomeTeam,
    AwayTeam
FROM dbo.Matches_Refereed_By_M_Oliver;


 




    

