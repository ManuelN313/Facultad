-- DDL

-- 1
DROP DATABASE world;
CREATE DATABASE world;
USE world;

-- 2
CREATE TABLE country
(
Code CHAR(3) PRIMARY KEY,
Name VARCHAR(100),
Continent VARCHAR(100),
Region VARCHAR(100),
SurfaceArea NUMERIC(20,2),
IndepYear INT,
Population INT,
LifeExpectancy NUMERIC(20,2),
GNP NUMERIC(20,2),
GNPOld NUMERIC(20,2),
LocalName VARCHAR(100),
GovernmentForm VARCHAR(100),
HeadOfState VARCHAR(100),
Capital INT,
Code2 CHAR(2)
);

CREATE TABLE city
(
ID INT PRIMARY KEY,
Name VARCHAR(100),
CountryCode CHAR(3),
District VARCHAR(100),
Population INT,
FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

CREATE TABLE countrylanguage
(
CountryCode CHAR(3),
LanguageCountry VARCHAR(100),
IsOfficial CHAR(1),
Percentage NUMERIC(20,2),
PRIMARY KEY (CountryCode, LanguageCountry),
FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

-- 3
SOURCE /home/manuel/Desktop/laboratorio/world-data.sql;

-- 4
CREATE TABLE Continent
(
Name VARCHAR(100) PRIMARY KEY,
Area INT,
PercentTotalMass NUMERIC(20,2),
MostPopulousCity INT UNIQUE,
FOREIGN KEY (MostPopulousCity) REFERENCES city(ID) 
);

-- 5
INSERT INTO `city` VALUES (4080,'McMurdo Station','USA','Ross Island',1000);

INSERT INTO `Continent` VALUES ('Africa',30370000,20.4,608);
INSERT INTO `Continent` VALUES ('Antarctica',14000000,9.2,4080);
INSERT INTO `Continent` VALUES ('Asia',44579000,29.5,1024);
INSERT INTO `Continent` VALUES ('Europe',10180000,6.8,3357);
INSERT INTO `Continent` VALUES ('North America',24709000,16.5,2515);
INSERT INTO `Continent` VALUES ('Oceania',8600000,5.9,130);
INSERT INTO `Continent` VALUES ('South America',17840000,12.0,206);

-- 6
ALTER TABLE `country`
ADD FOREIGN KEY (Continent) REFERENCES Continent(Name);

-- Consultas

-- 1
SELECT Name, Region
FROM country
ORDER BY Name ASC;

-- 2
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

-- 3
SELECT Name, Region, SurfaceArea, GovernmentForm
FROM country
ORDER BY SurfaceArea ASC
LIMIT 10;

-- 4
SELECT Name
FROM country
WHERE GovernmentForm LIKE '%Dependent Territory of%'
OR GovernmentForm LIKE '%Territory of%';

-- 5
SELECT CONCAT(LanguageCountry, ' ', CountryCode) AS 'NameLanguage', Percentage
FROM countrylanguage
WHERE IsOfficial = 'T';

-- Adicionales

-- 6
SELECT CONCAT(LanguageCountry, ' ', CountryCode) AS 'NameLanguage', Percentage
FROM countrylanguage
WHERE CountryCode = 'AIA' AND LanguageCountry = 'English';

UPDATE countrylanguage
SET Percentage = 100.00
WHERE CountryCode = 'AIA' AND LanguageCountry = 'English';

-- 7
SELECT Name
FROM city
WHERE District = 'Córdoba' AND CountryCode = 'ARG';

-- 8
SELECT Name
FROM city
WHERE District = 'Córdoba' AND CountryCode != 'ARG';

DELETE FROM city
WHERE District = 'Córdoba' AND CountryCode != 'ARG';

-- 9
SELECT Name, HeadOfState
FROM country
WHERE HeadOfState LIKE '%John%';

-- 10
SELECT Name, Population
FROM country
WHERE Population BETWEEN 35000000 AND 40000000
ORDER BY Population DESC;