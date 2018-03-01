SELECT sum(city.population)
FROM country INNER JOIN city ON city.countrycode = country.code
WHERE continent = 'Asia';