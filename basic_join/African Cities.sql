SELECT city.name
FROM country INNER JOIN city ON city.countrycode = country.code
WHERE continent = 'Africa';