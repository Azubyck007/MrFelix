/*************************************************************************
****************************************
NAME: Weeklyrank
PURPOSE: My script purpose...
MODIFICATION LOG:
 Ver      Date         Author           Description
1.0 - 05/24/2024  Okolocha Felix   I built this Script for EC-IT143
 RUNTIME:1S
Xm Xs
NOTES:
This is where I talk about what this script is, why I built it, and other
stuff...
**************************************************************************
****************************************/
-- Q1: Analyzing the correlation between goal difference (GD) and team ranks reveals a strong relationship, where teams with higher GD tend to secure better positions in the standings
-- A1: Question goes on the previous line, intoduction to the answer goes

WITH Stats AS (
    SELECT
        AVG(GD) AS avg_GD,
        AVG(Rank) AS avg_Rank,
        STDEV(GD) AS stddev_GD,
        STDEV(Rank) AS stddev_Rank
    FROM WeeklyRank
),
Covariance AS (
    SELECT
        AVG((GD - Stats.avg_GD) * (Rank - Stats.avg_Rank)) AS covariance
    FROM WeeklyRank, Stats
)
SELECT
    covariance / (stddev_GD * stddev_Rank) AS correlation
FROM Covariance, Stats;

--Q2 How can we analyze the performance trends of prominent teams such as Manchester United, Chelsea, and Liverpool across multiple weeks to gain understanding into their consistency, resilience, and adaptability when encountering different opponents and challenges?
SELECT Week, Team, Points, Rank
FROM WeeklyRank
WHERE Team IN ('Manchester United', 'Chelsea', 'Liverpool')
ORDER BY Team, Week;


--Q3: Currently, Manchester United, Chelsea, and Liverpool lead the standings with 3 points each, showcasing their early dominance and competitiveness in the league.
SELECT Team, Points, Rank
FROM WeeklyRank
WHERE Team IN ('Manchester United', 'Chelsea', 'Liverpool') AND Points = 3
ORDER BY Points DESC;

--Q4 What are the standings of the top teams, such as Manchester United, Chelsea, and Liverpool, in Week 1, based on their goal difference (GD), points, and ranking?
--A4 Filter the data for Manchester United, Chelsea, and Liverpool for Week 1 and retrieve their goal difference (GD), points, and ranking.

SELECT Team, GD, Points, Rank
FROM WeeklyRank
WHERE Team IN ('Man United', 'Chelsea', 'Liverpool') AND Week = 1;





