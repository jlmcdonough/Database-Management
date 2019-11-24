--Join On QUERY
--Name the countries in which a tournament organizer and venue are co-located.  Include the amount of tournaments hosted in that country.
SELECT DISTINCT aVenue.country, COUNT(aTournament.tournamentName)TOURNAMENT_AMOUNT
FROM aTournament, aVenue JOIN aTournamentOrganizer ON (aVenue.country = aTournamentOrganizer.headquaterLocation)
WHERE aTournament.venue = aVenue.venueNum
AND aTournament.tournamentOrganizer = aTournamentOrganizer.tournamentOrganizerNum
GROUP BY aVenue.country
