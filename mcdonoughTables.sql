--DROP ALL TABLES--
/*
ALTER TABLE AINCOME
DROP CONSTRAINT fk_aIncomeWEAPONCLASS;
ALTER TABLE AWEAPONCLASS
DROP CONSTRAINT fk_aWeaponClassINCOME;
ALTER TABLE ACOUNTRY
DROP CONSTRAINT fk_aCountryREGION;
ALTER TABLE ATEAM
DROP CONSTRAINT fk_aTeamRegion;
DROP TABLE AEQUIPMENT;
DROP TABLE AGRENADE;
DROP TABLE AINCOME;
DROP TABLE APLAYER;
DROP TABLE AREGION;
DROP TABLE ATOURNAMENT;
DROP TABLE ATEAM;
DROP TABLE ATOURNAMENTORGANIZER;
DROP TABLE AVENUE;
DROP TABLE AWEAPON;
DROP TABLE AWEAPONCLASS;
DROP TABLE ASIDE;
DROP TABLE ACOUNTRY;
*/

--TABLES AND PRIMARY KEYS--
CREATE TABLE aSide
(
	sideName NVARCHAR2(20),
	sideAbbreviation NVARCHAR2(2),
	CONSTRAINT pk_aSide PRIMARY KEY (sideAbbreviation)
);

CREATE TABLE aGrenade
(
	grenadeName NVARCHAR2(20),
	exclusiveSide NVARCHAR2(2),
	price INTEGER,
	maxHold INTEGER,
	CONSTRAINT pk_aGrenade PRIMARY KEY (grenadeName)
);

CREATE TABLE aEquipment
(
	equipmentName NVARCHAR2(20),
	exclusiveSide NVARCHAR2(2),
	price INTEGER,
	CONSTRAINT pk_aEquipment PRIMARY KEY (equipmentName)
);

CREATE TABLE aWeapon
(
	weaponName NVARCHAR2(20),
	exclusiveSide NVARCHAR2(2),
	price INTEGER,
	weaponClass NVARCHAR2(20),
	CONSTRAINT pk_aWeapon PRIMARY KEY (weaponName)
);

CREATE TABLE aWeaponClass
(
	weaponClass NVARCHAR2(20),
	killReward INTEGER,
	CONSTRAINT pk_aWeaponClass PRIMARY KEY (weaponClass)
);

CREATE TABLE aIncome
(
	incomeID INTEGER,
	reason NVARCHAR2(25),
	amount INTEGER,
	CONSTRAINT pk_aIncome PRIMARY KEY (incomeID)
);

CREATE TABLE aPlayer
(
	playerNum INTEGER,
	firstName NVARCHAR2(20),
	lastName NVARCHAR2(20),
	alias NVARCHAR2(20),
	country NVARCHAR2(20),
	currentTeam INTEGER,
	bestWeapon NVARCHAR2(20),
	eDPI INTEGER,
	CONSTRAINT pk_aPlayer PRIMARY KEY (playerNum)
);


CREATE TABLE aCountry
(
	countryName NVARCHAR2(20),
	region NVARCHAR2(20),
	CONSTRAINT pk_aCountry PRIMARY KEY (countryName)
);

CREATE TABLE aRegion
(
	regionName NVARCHAR2(20),
	CONSTRAINT pk_aRegion PRIMARY KEY (regionName)
);

CREATE TABLE aTeam
(
	teamNum INTEGER,
	region NVARCHAR2(20),
	organization NVARCHAR2(20),
	currentRank INTEGER,
	weeksAtNumber1 INTEGER,
	CONSTRAINT pk_aTeam PRIMARY KEY (teamNum)
);

CREATE TABLE aTournament
(
	tournamentNum INTEGER,
	tournamentName NVARCHAR2(20),
	tournamentOrganizer INTEGER,
	tournamentMonth NVARCHAR2(20),
	tournamentYear INTEGER,
	venue INTEGER,
	winningTeam INTEGER,
	prizePool INTEGER,
	major NVARCHAR2(3),
	mvp NVARCHAR2(20),
	CONSTRAINT pk_aTournament PRIMARY KEY (tournamentNum)
);

CREATE TABLE aVenue
(
	venueNum INTEGER,
	venueName NVARCHAR2(20),
	city NVARCHAR2(20),
	country NVARCHAR2(20),
	CONSTRAINT pk_aVenue PRIMARY KEY (venueNum)
);

CREATE TABLE aTournamentOrganizer
(
	tournamentOrganizerNum INTEGER,
	tournamentOrganizerName NVARCHAR2(20),
	CONSTRAINT pk_aTournamentOrganizer PRIMARY KEY (tournamentOrganizerNum)
);

--FOREIGN KEYS--
/*
ALTER TABLE aGrenade
ADD CONSTRAINT fk_aGrenadeSIDE
FOREIGN KEY (exclusiveSide) REFERENCES aSide(sideAbbreviation);

ALTER TABLE aEquipment
ADD CONSTRAINT fk_aEquipmentSIDE
FOREIGN KEY (exclusiveSide) REFERENCES aSide(sideAbbreviation);

ALTER TABLE aWeapon
ADD CONSTRAINT fk_aWeaponSIDE
FOREIGN KEY (exclusiveSide) REFERENCES aSide(sideAbbreviation);

ALTER TABLE aWeapon
ADD CONSTRAINT fk_aWeaponWEAPONCLASS
FOREIGN KEY (weaponClass) REFERENCES aWeaponClass(weaponClass);

ALTER TABLE aWeaponClass
ADD CONSTRAINT fk_aWeaponClassINCOME
FOREIGN KEY (killReward) REFERENCES aIncome(incomeID);

ALTER TABLE aIncome
ADD CONSTRAINT fk_aIncomeWEAPONCLASS
FOREIGN KEY (reason) REFERENCES aWeaponClass(weaponClass);

ALTER TABLE aPlayer
ADD CONSTRAINT fk_aPlayerCOUNTRY
FOREIGN KEY (country) REFERENCES aCountry(countryName);

ALTER TABLE aPlayer
ADD CONSTRAINT fk_aPlayerTEAM
FOREIGN KEY (currentTeam) REFERENCES aTeam(teamNum);

ALTER TABLE aPlayer
ADD CONSTRAINT fk_aPlayerWEAPON
FOREIGN KEY (bestWeapon) REFERENCES aWeapon(weaponName);

ALTER TABLE aCountry
ADD CONSTRAINT fk_aCountryRegion
FOREIGN KEY (region) REFERENCES aRegion(regionName);

ALTER TABLE aTeam
ADD CONSTRAINT fk_aTeamRegion
FOREIGN KEY (region) REFERENCES aRegion(regionName);

ALTER TABLE aTournament
ADD CONSTRAINT fk_aTournamentTEAM
FOREIGN KEY (winningTeam) REFERENCES aTeam(teamNum);

ALTER TABLE aTournament
ADD CONSTRAINT fk_aTournamentVENUE
FOREIGN KEY (venue) REFERENCES aVenue(venueNum);

ALTER TABLE aTournament
ADD CONSTRAINT fk_aTournamentTOURNEYORG
FOREIGN KEY (tournamentOrganizer) REFERENCES aTournamentOrganizer(tournamentOrganizerNum);



