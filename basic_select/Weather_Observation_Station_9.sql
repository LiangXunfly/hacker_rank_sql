/* wa
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^[!AEIOUaeiou]';

/* wa
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^[?!AEIOUaeiou]';

/* wa
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^(!AEIOUaeiou)';

/* wa
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^(?!AEIOUaeiou)';


/* wa
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^(?![AEIOUaeiou])';




/* ac commit1:
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY not in (SELECT CITY FROM STATION WHERE CITY regexp '^[AEIOU]');


/* ac commit2:
*/
SELECT DISTINCT CITY
FROM STATION
WHERE NOT CITY regexp '^[AEIOU]';


/* ac commit3:
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT regexp '^[AEIOU]';




/* ac commit4:
   原来不是!,而是^
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^[^AEIOUaeiou]';