--Group By QUERY
--Get weapon names for weapons that generate less income than the pistol class
SELECT aWeapon.weaponName
FROM aWeapon, aWeaponClass
WHERE aWeapon.weaponClass = aWeaponClass.weaponClassID
AND aWeaponClass.eliminationReward IN(
	SELECT income1.incomeID
	FROM aWeaponClass, aIncome income1
	WHERE income1.incomeID = aWeaponClass.eliminationReward
	GROUP BY income1.incomeID, income1.amount
	HAVING income1.amount < (SELECT income2.amount
		FROM aIncome income2, aWeaponClass wepClass2
		WHERE wepClass2.weaponClassName = 'pistol'
		AND wepClass2.eliminationReward = income2.incomeID))
