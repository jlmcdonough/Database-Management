--Left Outer Join QUERY
--For all reasons other than losing a round, give the income amount, income reason, and weaponClass name, if any. 
SELECT aIncome.amount, aIncome.reason, aWeaponClass.weaponClassName 
FROM aIncome LEFT OUTER JOIN aWeaponClass ON (aIncome.incomeID = aWeaponClass.eliminationReward)
WHERE aIncome.reason NOT LIKE 'lose%'
