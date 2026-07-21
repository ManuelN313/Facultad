-- 1
WITH CountryLess10000 (Code, Name) AS (
    SELECT Code, Name
    FROM country
    WHERE Population < 10000
)
SELECT city.Name AS City, CountryLess10000.Name AS Country
FROM city
INNER JOIN CountryLess10000 ON CountryLess10000.Code = city.CountryCode;

-- 2
SELECT *
FROM city
WHERE Population >= (SELECT avg(Population) AS Avg FROM city);

-- 3
WITH NotAsianCity (City, Continent, Population) AS (
    SELECT city.Name AS City, country.Continent, city.Population
    FROM city
    INNER JOIN country ON city.CountryCode = country.Code
    WHERE country.Continent != 'Asia'
),
MinAsianCountryPopulation (Min) AS (
    SELECT min(Population) AS Min
    FROM country
    WHERE Continent = 'Asia'
)
SELECT City, Continent, Population
FROM NotAsianCity
WHERE Population >= (SELECT min FROM MinAsianCountryPopulation);

-- 4
WITH OfficialLanguageSpeakersPercentage (CountryCode, Percentage) AS (
    SELECT CountryCode, sum(Percentage) AS Percentage
    FROM countrylanguage
    WHERE IsOfficial = 'T'
    GROUP BY CountryCode
),
NotOfficialLanguages (Country, CountryCode, Language, Percentage) AS (
    SELECT country.Name AS Country, countrylanguage.CountryCode, countrylanguage.LanguageCountry AS Language, countrylanguage.Percentage
    FROM countrylanguage
    INNER JOIN country ON country.Code = countrylanguage.CountryCode
    WHERE IsOfficial = 'F'
)
SELECT NOL.Country, NOL.Language, NOL.Percentage
FROM NotOfficialLanguages AS NOL
INNER JOIN OfficialLanguageSpeakersPercentage AS OLSP ON OLSP.CountryCode = NOL.CountryCode
WHERE NOL.Percentage > OLSP.Percentage;

-- 5
-- No subquery
(
    SELECT DISTINCT Region
    FROM country
    WHERE SurfaceArea < 1000.00
)
INTERSECT
(
    SELECT DISTINCT country.Region
    FROM country
    INNER JOIN city ON city.CountryCode = country.Code
    WHERE city.Population > 100000
);

-- Subquery
SELECT DISTINCT Region
FROM country
WHERE SurfaceArea < 1000.00 AND Region IN (
    SELECT country.Region
    FROM country
    INNER JOIN city ON city.CountryCode = country.Code
    WHERE city.Population > 100000
);

-- 6
-- Agrupacion
SELECT country.Name AS Country, max(city.Population) AS MostPopulousCity
FROM country
INNER JOIN city ON city.CountryCode = country.Code
GROUP BY country.Name;

-- Subquery
SELECT country.Name AS Country, city.Population AS MostPopulousCity
FROM country
INNER JOIN city ON city.CountryCode = country.Code
WHERE city.Population >= ALL (
    SELECT Population
    FROM city
    WHERE city.CountryCode = country.Code
);

--7
SELECT country.Name AS Country, countrylanguage.LanguageCountry AS NotOfficialLanguage
FROM country
INNER JOIN countrylanguage ON countrylanguage.CountryCode = country.Code
WHERE countrylanguage.IsOfficial = 'F' AND countrylanguage.Percentage >= (
    SELECT avg(Percentage)
    FROM countrylanguage
    WHERE countrylanguage.IsOfficial = 'T' AND countrylanguage.CountryCode = country.Code
);

-- Consultas para chequear 7
SELECT country.Name AS Country, avg(Percentage)
FROM countrylanguage
INNER JOIN country ON countrylanguage.CountryCode = country.Code
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY Country;
 
SELECT country.Name AS Country, countrylanguage.LanguageCountry AS NotOfficialLanguage, countrylanguage.Percentage
FROM country
INNER JOIN countrylanguage ON countrylanguage.CountryCode = country.Code
WHERE countrylanguage.IsOfficial = 'F';

-- 8
SELECT Continent, sum(Population) AS TotalPopulation
FROM country
GROUP BY Continent
ORDER BY TotalPopulation DESC;

-- 9 (no se cual version seria la correcta)
SELECT Continent, avg(LifeExpectancy) AS AverageLifeExpectency
FROM country
WHERE LifeExpectancy BETWEEN 40 AND 70
GROUP BY Continent;

SELECT Continent, avg(LifeExpectancy) AS AverageLifeExpectency
FROM country
GROUP BY Continent
HAVING AverageLifeExpectency BETWEEN 40 AND 70;

-- 10
SELECT Continent, avg(Population) AS AveragePopulation, sum(Population) AS TotalPopulation, min(Population) AS MinPopulation, max(Population) AS MaxPopulation
FROM country
GROUP BY Continent;

-- 11

-- No es posible hacer la consulta con agrupaciones ya que GROUP BY comprime solo una
-- columna en UN valor, es decir que no es posible traer el nombre y la poblacion.
-- Pero si es posible hacer la consulta con una subquery escalar. La solucion esta dada
-- arriba.

SELECT country.Name AS Country, city.Name AS City, city.Population AS MostPopulousCity 
FROM country
INNER JOIN city ON city.CountryCode = country.Code
WHERE city.Population >= ALL (
    SELECT Population
    FROM city
    WHERE city.CountryCode = country.Code
);