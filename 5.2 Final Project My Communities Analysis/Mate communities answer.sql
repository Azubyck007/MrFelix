/*************************************************************************
****************************************
NAME: soccer21-22
PURPOSE: My script purpose...
MODIFICATION LOG:
Ver      Date          Author               Description
1.0   05/24/2024     Ubong Esu    I built this Script for EC-IT143
-------------------------------------------------------------------------
RUNTIME:1s
Xm Xs
NOTES:
This is where I talk about what this script is, why I built it, and other
stuff...
**************************************************************************
****************************************/
-- Q1:	What were the highest goals of the season for your soccer set and which team has the highest victory for this season and what was the main factor behind their success, did they put out a good performance?
-- A1:

-- Find the highest number of goals scored in a single week
SELECT MAX(GD) AS highest_goals_of_season
FROM WeeklyRank;

-- Identify the team(s) with the highest number of points for the season
SELECT Team, Points
FROM WeeklyRank
WHERE Points = (SELECT MAX(Points) FROM WeeklyRank);

-- Q2: How many clubs took part in the soccer competition and who were the highest goal scorers, which team took the cup, which team performance was outstanding with less fault play and what is your expectation next season?

-- Count the number of unique clubs that took part in the soccer competition
SELECT COUNT(DISTINCT Team)
FROM WeeklyRank;

-- Identify the highest goal scorers
SELECT TOP 1 Team, MAX(GD) AS highest_goals
FROM WeeklyRank
GROUP BY Team
ORDER BY MAX(GD) DESC;

-- Determine which team won the cup
SELECT TOP 1 Team, MAX(Points) AS points
FROM WeeklyRank
GROUP BY Team
ORDER BY MAX(Points) DESC;

-- Identify the team with outstanding performance characterized by fewer faults
SELECT TOP 1 Team, MIN(GD) AS least_faults
FROM WeeklyRank
GROUP BY Team
ORDER BY MIN(GD) ASC;

-- expectation for the next season could be base on recent performances, etc.)
-- let's assume an expectation based on the average points per team
SELECT AVG(Points) AS average_points_per_team
FROM WeeklyRank;
