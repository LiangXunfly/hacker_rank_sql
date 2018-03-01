/* ac commit1
*/
SELECT salary * months, count(salary * months)
FROM Employee
GROUP BY (salary * months)
ORDER BY (salary * months) DESC
LIMIT 0, 1;


/* wrong: count()里面不能用amount
*/
SELECT salary * months as amount, count(amount)
FROM Employee
GROUP BY (amount)
ORDER BY (amount) DESC
LIMIT 0, 1;



/* ac commit2: 别名能在select之外的地方使用
*/ 
SELECT salary * months as amount, count(salary)
FROM Employee
GROUP BY (amount)
ORDER BY (amount) DESC
LIMIT 0, 1;