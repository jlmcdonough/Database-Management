--None QUERY
--For weapon classes in which none of the French players are best with any of its weapons, give the weapon class name and the income amount it generates
SELECT aWeaponClass.weaponClassName, aIncome.amount
FROM aWeaponClass, aIncome
WHERE aWeaponClass.eliminationReward = aIncome.incomeID
AND aWeaponClass.weaponClassID NOT IN(
	SELECT DISTINCT aWeapon.weaponClass
	FROM aWeapon
	WHERE aWeapon.weaponNum IN(
		SELECT aPlayer.bestWeapon
		FROM aPlayer
		WHERE aPlayer.country = 'France'))
