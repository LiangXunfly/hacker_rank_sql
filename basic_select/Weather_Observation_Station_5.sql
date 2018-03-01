/* ERROR 1111 (HY000): Invalid use of group function
   MAX和MIN是组方法
*/
SELECT CITY, char_length(CITY)
FROM STATION
WHERE char_length(CITY) = MAX(char_length(CITY)) OR char_length(CITY) = MIN(char_length(CITY))
ORDER BY char_length(CITY) DESC, CITY;



/* ERROR: do not need to the alias to the select
   FROM must following alias
*/
(SELECT CITY, char_length(CITY)
FROM STATION 
ORDER BY char_length(CITY), CITY 
LIMIT 0, 1) min_result
UNION
(SELECT CITY, char_length(CITY)
FROM STATION 
ORDER BY char_length(CITY) DESC, CITY 
LIMIT 0, 1) max_result






/* ac commit:
*/
(SELECT CITY, char_length(CITY)
FROM STATION 
ORDER BY char_length(CITY), CITY 
LIMIT 0, 1) 
UNION
(SELECT CITY, char_length(CITY)
FROM STATION 
ORDER BY char_length(CITY) DESC, CITY 
LIMIT 0, 1)


