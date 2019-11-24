--Full Outer Join QUERY
--For venues or tournament organizers that are not from the United States of America, give the venue name and country, if any, as well as the organizer name and headquarters location, if any, such that if both exists, the venue's country is the same as the headquarters’.
SELECT aVenue.venueName, aVenue.country, aTournamentOrganizer.tournamentOrganizerName, aTournamentOrganizer.headquaterLocation
FROM aVenue FULL OUTER JOIN aTournamentOrganizer ON (aVenue.country = aTournamentOrganizer.headquaterLocation)
WHERE aVenue.country <> 'United States of America'
OR aTournamentOrganizer.headquaterLocation <> 'United States of America'
