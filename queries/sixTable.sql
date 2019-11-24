--Six Table QUERY
--North American players have a tendency to thrive playing in front of a home crowd.  Give the player's alias, best weapon, their country and team, as well as the tournament name, year, and venue name such that it is also located in North America.  
SELECT aPlayer.alias, aWeapon.weaponName, aPlayer.country, aTeam.teamName, aTournament.tournamentName, aTournament.tournamentYear, aVenue.venueName
FROM aRegion, aTeam, aTournament, aPlayer, aVenue, aWeapon
WHERE aRegion.regionName = 'North America'
AND aRegion.regionAbbreviation = aTeam.region
AND aTeam.teamNum = aPlayer.currentTeam
AND aTeam.teamNum = aTournament.winningTeam
AND aVenue.venueNum = aTournament.venue
AND aPlayer.bestWeapon = aWeapon.weaponNum
