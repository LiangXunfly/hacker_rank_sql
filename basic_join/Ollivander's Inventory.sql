SELECT id, t2.age, t2.coins_needed, t2.power
FROM
(SELECT age, power, min(coins_needed) minum
FROM wands INNER JOIN wands_property ON wands.code = wands_property.code 
WHERE is_evil = 0
GROUP BY age, power) t1
LEFT JOIN
(SELECT id, age, power, coins_needed 
FROM wands INNER JOIN wands_property ON wands.code = wands_property.code) t2
ON t1.age = t2.age AND t1.power = t2.power AND t1.minum = t2.coins_needed
ORDER BY power DESC, age DESC;