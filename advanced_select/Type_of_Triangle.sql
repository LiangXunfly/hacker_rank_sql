/* 有输出,但是wrong answer
*/
SET @type := NULL;
SELECT @type := case
WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
WHEN A = B AND B = C THEN 'Equilateral'
WHEN (A = B AND B != C) OR (A = C AND A != B) OR (B = C AND A != B) THEN 'Isosceles'
ELSE 'Scalene'
END
FROM TRIANGLES;