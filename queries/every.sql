--Universal Quantifier QUERY
--Get weapon name and class for weapons that are favorited by at least one player from every country in the database.
SELECT aWeapon.weaponName, aWeaponClass.weaponClassName
FROM aWeapon, aWeaponClass
WHERE NOT EXISTS(
	SELECT *
	FROM aCOUNTRY
	WHERE NOT EXISTS(
		SELECT *
		FROM aPlayer
		WHERE aPlayer.country = aCountry.countryname
		AND aPlayer.bestWeapon = aWeapon.weaponNum
		AND aWeaponClass.weaponClassID = aWeapon.weaponClass))

