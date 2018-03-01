/*  ac commit1
    LIKE only support % and -, not []
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'A%' OR CITY LIKE 'e%' OR CITY LIKE 'E%' OR CITY LIKE 'i%' OR CITY LIKE 'I%' OR
CITY LIKE 'o%' OR CITY LIKE 'O%' OR CITY LIKE 'u%' OR CITY LIKE 'U%';




/* 这样好像会匹配所有的结果,*是有或者没有都可以
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY regexp '^[AEIOU]*';





/*  ac commit2:加入点之后就能用了
	Answer: . matches a single character
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY regexp '^[AEIOU].*';


/* ac commit3
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY regexp '^[AEIOU]';