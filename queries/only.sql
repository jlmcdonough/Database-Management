--Only QUERY
--For those that only won at the Laxness-Arena, give the team name, their region, and the year(s) they won it.
SELECT aTeam.teamName, aTeam.region
FROM aTeam
WHERE aTeam.teamNum IN(
	SELECT tourney1.winningTeam
	FROM aTournament tourney1
	WHERE tourney1.winningTeam NOT IN(
		SELECT tourney2.winningteam
		FROM aTournament tourney2
		WHERE tourney2.venue NOT IN(
		SELECT aVenue.venuenum
		FROM aVenue
		WHERE aVenue.venueName = 'Laxness-Arena')))
