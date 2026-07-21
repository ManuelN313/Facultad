-- 1
SELECT city.Name AS City, country.Name AS Country, country.Region, country.GovernmentForm
FROM country
INNER JOIN city ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 10;

-- 2
SELECT country.Name AS Country, city.Name AS Capital, country.Population AS CountryPopulation
FROM country
LEFT JOIN city ON city.ID = country.Capital
ORDER BY country.Population ASC
LIMIT 10;
 
-- 3
SELECT country.Name AS Country, country.Continent, countrylanguage.LanguageCountry AS Language
FROM country
INNER JOIN countrylanguage ON countrylanguage.CountryCode = country.Code
WHERE countrylanguage.IsOfficial = 'T';

-- 4 (si un pais no tiene capital no aparece aca)
SELECT country.Name AS Country, city.Name AS Capital
FROM country
INNER JOIN city ON city.ID = country.Capital
ORDER BY country.SurfaceArea DESC
LIMIT 20;

-- 5
SELECT city.Name AS City, countrylanguage.LanguageCountry AS Language, countrylanguage.Percentage AS PercentageSpeakers
FROM city
INNER JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
ORDER BY city.Population DESC;

-- 6
(
    SELECT *
    FROM country
    WHERE Population >= 100
    ORDER BY Population ASC
    LIMIT 10
)
UNION
(
    SELECT *
    FROM country
    ORDER BY Population DESC
    LIMIT 10
);

-- 7
(
    SELECT country.Name AS Country
    FROM country
    INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.IsOfficial = 'T' AND countrylanguage.LanguageCountry = 'English'
)
INTERSECT
(
    SELECT country.Name AS Country
    FROM country
    INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.IsOfficial = 'T' AND countrylanguage.LanguageCountry = 'French'
);

-- 8
(
    SELECT country.Name AS Country
    FROM country
    INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.LanguageCountry = 'English'
)
EXCEPT
(
    SELECT country.Name AS Country
    FROM country
    INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.LanguageCountry = 'Spanish'
);

-- Preguntas

-- 1)
-- Si ambas consultas devuelven la misma información (todas las ciudades pertenecientes a la Argentina).
-- Ambos enfoques arrojan el mismo resultado porque especifican la misma condición de filtrado.
-- Usar la cláusula ON o la cláusula WHERE para filtrar después de una INNER JOIN es una cuestión 
-- de estilo de codificación y preferencia personal. El INNER JOIN se asegura que se muestren los datos
-- que cumplen con la condición pedida.

-- 2)
-- Si cambiamos el INNER JOIN a un LEFT JOIN, el comportamiento será diferente: En la primera consulta
-- se mostraran todas las ciudades de la tabla city, las que pertenezcan a Argentina tendran en la columna
-- country el valor de  'Argentina' mientras que las que no 'Null'. En la segunda consulta solamente se mostrara
-- las ciudades que pertenezcan a la Argetina. La diferencia de esto es porque el LEFT JOIN muestra todas las
-- filas de A independientemente de si aparecen en B, pero con el WHERE podemos hacer que estas filas no aparezcan