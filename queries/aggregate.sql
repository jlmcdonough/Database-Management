--Aggregate QUERY
--For team's whose average weapon price is less than the current #1 ranked team's weapon price, give the team number, name, their average as well as most expensive weapon weapon price
SELECT aTeam.teamNum, aTeam.teamName, to_char((AVG(aWeapon.price)),'9999.99') average_price, MAX(aWeapon.price)most_expensive
FROM aTeam, aPlayer, aWeapon
WHERE aWeapon.weaponNum = aPlayer.bestWeapon
AND aPlayer.currentTeam = aTeam.teamNum
GROUP BY aTeam.teamNum, aTeam.teamName
HAVING  AVG(aWeapon.Price) <(SELECT AVG(aWeapon.price)
	FROM aTeam, aPlayer, aWeapon
	WHERE aWeapon.weaponNum = aPlayer.bestWeapon
	AND aPlayer.currentTeam = aTeam.teamNum
	AND aTeam.currentRank = 1)
