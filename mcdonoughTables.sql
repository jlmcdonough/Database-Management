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
	role NVARCHAR2(10),
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
	weaponClass INTEGER,
	CONSTRAINT pk_aWeapon PRIMARY KEY (weaponName)
);

CREATE TABLE aWeaponClass
(
	weaponClassID INTEGER,
	weaponClassName NVARCHAR2(20),
	eliminationReward INTEGER,
	CONSTRAINT pk_aWeaponClass PRIMARY KEY (weaponClassID)
);

CREATE TABLE aIncome
(
	incomeID INTEGER,
	reason NVARCHAR2(40),
	amount INTEGER,
	CONSTRAINT pk_aIncome PRIMARY KEY (incomeID)
);

CREATE TABLE aPlayer
(
	playerNum INTEGER,
	firstName NVARCHAR2(20),
	lastName NVARCHAR2(20),
	alias NVARCHAR2(20),
	country NVARCHAR2(40),
	currentTeam INTEGER,
	bestWeapon NVARCHAR2(20),
	eDPI INTEGER,
	CONSTRAINT pk_aPlayer PRIMARY KEY (playerNum)
);


CREATE TABLE aCountry
(
	countryName NVARCHAR2(40),
	region NVARCHAR2(20),
	CONSTRAINT pk_aCountry PRIMARY KEY (countryName)
);

CREATE TABLE aRegion
(
	regionAbbreviation NVARCHAR2(3),
	regionName NVARCHAR2(40),
	CONSTRAINT pk_aRegion PRIMARY KEY (regionAbbreviation)
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
	tournamentOrganizer INTEGER,
	tournamentName NVARCHAR2(20),
	tournamentYear INTEGER,
	tournamentMonth NVARCHAR2(20),
	venue INTEGER,
	winningTeam INTEGER,
	prizePool INTEGER,
	major NVARCHAR2(3),
	mvp NVARCHAR2(20),
	CONSTRAINT pk_aTournament PRIMARY KEY (tournamentOrganizer, tournamentName, tournamentYear)
);

CREATE TABLE aVenue
(
	venueNum INTEGER,
	venueName NVARCHAR2(40),
	city NVARCHAR2(20),
	country NVARCHAR2(40),
	CONSTRAINT pk_aVenue PRIMARY KEY (venueNum)
);

CREATE TABLE aTournamentOrganizer
(
	tournamentOrganizerNum INTEGER,
	tournamentOrganizerName NVARCHAR2(20),
	foundYear INTEGER,
	headquaterLocation NVARCHAR2(40),
	parentCompany NVARCHAR2(20),
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
FOREIGN KEY (weaponClass) REFERENCES aWeaponClass(weaponClassID);

ALTER TABLE aWeaponClass
ADD CONSTRAINT fk_aWeaponClassINCOME
FOREIGN KEY (eliminationReward) REFERENCES aIncome(incomeID)

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
FOREIGN KEY (region) REFERENCES aRegion(regionAbbreviation);

ALTER TABLE aTeam
ADD CONSTRAINT fk_aTeamRegion
FOREIGN KEY (region) REFERENCES aRegion(regionAbbreviation);

ALTER TABLE aTournament
ADD CONSTRAINT fk_aTournamentTEAM
FOREIGN KEY (winningTeam) REFERENCES aTeam(teamNum);

ALTER TABLE aTournament
ADD CONSTRAINT fk_aTournamentVENUE
FOREIGN KEY (venue) REFERENCES aVenue(venueNum);

ALTER TABLE aTournament
ADD CONSTRAINT fk_aTournamentTOURNEYORG
FOREIGN KEY (tournamentOrganizer) REFERENCES aTournamentOrganizer(tournamentOrganizerNum);



