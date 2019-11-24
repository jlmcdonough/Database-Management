--Universal Quantifier QUERY
--Name the tournament, it’s year, prize pool, and mvp for every tournament won by a team with at least one Swedish player.
SELECT aTournament.tournamentName, aTournament.tournamentYear, aTournament.prizePool, aTournament.mvp
FROM aTournament
WHERE NOT EXISTS(
	SELECT *
	FROM aTeam
	WHERE NOT EXISTS(
		SELECT *
		FROM aPlayer
		WHERE aPlayer.Country = 'Sweden'
		AND aTeam.teamNum = aPlayer.currentTeam
		AND aTeam.teamNum = aTournament.winningTeam))
