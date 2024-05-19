
--Step3. Create a query answer the question

SELECT Date, HomeTeam, AwayTeam
FROM [soccer21-22]
WHERE Referee = 'M Oliver'
ORDER BY Referee DESC
