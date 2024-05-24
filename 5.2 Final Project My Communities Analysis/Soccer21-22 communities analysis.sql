/*************************************************************************
****************************************
NAME: soccer21-22
PURPOSE: My script purpose...
MODIFICATION LOG:
Ver      Date          Author               Description
1.0   05/23/2024   Okolocha Felix    I built this Script for EC-IT143
-------------------------------------------------------------------------
RUNTIME:1s
Xm Xs
NOTES:
This is where I talk about what this script is, why I built it, and other
stuff...
**************************************************************************
****************************************/
-- Q1: Using the provided spreadsheet, tally the total goals scored by home teams (FTHG) in all matches. This information helps us understand how strong home teams were this season. Did home teams consistently outperform their away counterparts?
-- A1: Below is the query to answer the question. I compare the total goal scored by home and away team

SELECT 
    SUM(CAST(FTHG AS INT)) AS Total_Home_Goals,
    SUM(CAST(FTAG AS INT)) AS Total_Away_Goals
FROM [soccer21-22];


--Q2: Review the spreadsheet to identify which referee officiated the most matches. Knowing this helps us determine if a particular referee might have influenced the outcomes more frequently. Was this referee often involved in high-stakes games? 
--A2 To count the number of matches per referee
WITH Referee_Count AS (
    SELECT Referee, COUNT(*) AS Match_Count
    FROM [soccer21-22]
    GROUP BY Referee
)
SELECT TOP 1 Referee, Match_Count
FROM Referee_Count
ORDER BY Match_Count DESC;

--Q3: Analyze the data to find which home team had the highest number of shots on target (HST) throughout the season. This metric can indicate offensive strength. Did this team also have a high win rate, or did they struggle to convert these opportunities?
--A3 Calculate Total HST for Each Home Team

-- Alter the HST column to a numeric data type (e.g., INT)
ALTER TABLE [dbo].[soccer21-22]
ALTER COLUMN HST INT;

-- Calculate Total HST for Each Home Team
WITH HomeTeamStats AS (
    SELECT
        HomeTeam AS home_team_name,
        SUM(CAST(HST AS INT)) AS total_hst,
        COUNT(*) AS total_matches
    FROM
        [soccer21-22]
    WHERE
        FTR IN ('H', 'A', 'D')  -- Consider only matches with a result
    GROUP BY
        HomeTeam
),

-- Calculate Win Rate for Each Home Team
HomeTeamWinRate AS (
    SELECT
        HomeTeam AS home_team_name,
        COUNT(CASE WHEN FTR = 'H' THEN 1 END) AS total_wins
    FROM
        [soccer21-22]
    WHERE
        FTR IN ('H', 'A', 'D')  -- Consider only matches with a result
    GROUP BY
        HomeTeam
)

-- Combine Home Team Stats and Win Rates, and fetch the team with the highest HST
SELECT TOP 1
    s.home_team_name,
    s.total_hst,
    w.total_wins,
    (w.total_wins * 100.0 / s.total_matches) AS win_rate_percentage
FROM
    HomeTeamStats s
JOIN
    HomeTeamWinRate w ON s.home_team_name = w.home_team_name
ORDER BY
    s.total_hst DESC;


--Q4:Using the spreadsheet, calculate the average number of fouls committed by home teams (HF) per match. Compare this to away teams (AF). Does playing at home make teams more aggressive, or are they more cautious to avoid penalties? 
--A4 Calculate Average HF and AF per Match

WITH AvgFouls AS (
    SELECT
        AVG(CAST(HF AS FLOAT)) AS avg_hf,
        AVG(CAST(AF AS FLOAT)) AS avg_af
    FROM
        [soccer21-22]
    WHERE
        HF IS NOT NULL  -- Exclude NULL values if any
        AND AF IS NOT NULL
)

-- Fetch the Average Fouls Committed by Home and Away Teams
SELECT
    avg_hf AS average_hf_home_teams,
    avg_af AS average_af_away_teams,
    CASE
        WHEN avg_hf > avg_af THEN 'Home teams tend to be more aggressive.'
        WHEN avg_hf < avg_af THEN 'Away teams tend to be more aggressive.'
        ELSE 'There''s no significant difference in aggression between home and away teams.'
    END AS aggression_comparison
FROM
    AvgFouls;



