SELECT country.continent, floor(AVG(city.population)) as average
FROM country inner join city on country.code = city.countrycode
GROUP BY country.continent;