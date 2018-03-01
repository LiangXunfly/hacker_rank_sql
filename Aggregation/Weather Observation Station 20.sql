/* 
   limit不能用表达式
*/
SET @location := (SELECT COUNT(*) FROM STATION) - 1;
SELECT ROUND(LAT_N, 4)
FROM STATION
ORDER BY LAT_N
LIMIT @location, 1;



SET @counter := (SELECT COUNT(*) FROM station);
SET @location1 := CEILING(@counter / 2);
SET @location2 := (@counter / 2) - 1;
SET @median := CASE @counter % 2 = 1 THEN (SELECT LAT_N FROM station ORDER BY LAT_N LIMIT @location1, 1)
ELSE (SELECT sum(LAT_N) / 2 FROM station ORDER BY LAT_N LIMIT @location2, 2);  




CREATE FUNCTION getMedian(N INT) RETURNS float
BEGIN
  DECLARE counter INT;
  DECLARE location INT;
  SET counter = (SELECT count(*) FROM station);
  SET ranking = N - 1;
  /*
  RETURN (
      # Write your MySQL query statement below.
      SELECT Salary
      FROM (SELECT DISTINCT Salary FROM Employee) distinctSalary 
      ORDER BY Salary DESC
      LIMIT ranking, 1
  );
*/
  return counter;
END
