SELECT*
FROM countries

--How many entries in the countries table are from Africa?

SELECT count(*) as africanCountries
FROM countries
WHERE continent=="Africa"

-------What was the total population of the continent of Oceania in 2005?

SELECT countries.continent, population_years.year, SUM(population_years.population)
FROM countries
JOIN population_years
ON countries.id==population_years.country_id
WHERE  countries.continent=="Oceania" AND population_years.year==2005


SELECT countries.continent, AVG(population_years.population)
FROM countries
JOIN population_years
ON countries.id==population_years.country_id
GROUP BY countries.continent

--What is the average population of countries in South America in 2003?


SELECT countries.continent, AVG(population_years.population), population_years.year
FROM countries
JOIN population_years
ON countries.id==population_years.country_id
WHERE  population_years.year==2003 AND  countries.continent=="South America"
GROUP BY countries.continent


--What country had the smallest population in 2007?

SELECT countries.name, MIN(population_years.population) AS minPOPU, population_years.year
FROM countries
INNER JOIN population_years
ON countries.id==population_years.country_id
WHERE population_years.year==2007 AND population_years.population IS NOT NULL
GROUP BY countries.name
ORDER BY minPOPU
LIMIT 1


--What is the average population of Poland during the time period covered by this dataset?

SELECT countries.name, AVG(population_years.population) AS AvgPopu
FROM countries
INNER JOIN population_years
ON countries.id==population_years.country_id
WHERE countries.name="Poland"
GROUP BY countries.name



--How many countries have the word “The” in their name?

SELECT countries.name
FROM countries
WHERE name LIKE "%The"


--What was the total population of each continent in 2010?

SELECT countries.continent, AVG(population_years.population), population_years.year
FROM countries
JOIN population_years
ON countries.id==population_years.country_id
WHERE  population_years.year==2010
GROUP BY countries.continent
