/* ac commit:
   REPLACE竟然可以直接对int进行操作
*/
SELECT CEILING(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES;