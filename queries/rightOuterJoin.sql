--Right Outer Join QUERY
--For teams that have won at least one major after 2015, give the tournament name, tournament year, team name, as well as the team's current rank, if any.
SELECT aTeam.currentRank, aTeam.teamName, aTournament.tournamentName, aTournament.tournamentYear
FROM aTournament RIGHT OUTER JOIN aTeam ON (aTournament.winningTeam = aTeam.teamNum)
WHERE aTournament.major = 'Yes'
AND aTournament.tournamentYear > 2015
