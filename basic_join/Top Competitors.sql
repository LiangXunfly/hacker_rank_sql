SELECT hackers.hacker_id, hackers.name
FROM hackers
INNER JOIN submissions ON hackers.hacker_id = submissions.hacker_id
INNER JOIN challenges ON submissions.challenge_id = challenges.challenge_id
INNER JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level
GROUP BY submissions.hacker_id
HAVING count(submissions.score = difficulty.score) >= 2
ORDER BY count(submissions.score = difficulty.score) DESC, hackers.hacker_id;



SELECT hackers.hacker_id, hackers.name
FROM hackers
INNER JOIN submissions ON hackers.hacker_id = submissions.hacker_id
INNER JOIN challenges ON submissions.challenge_id = challenges.challenge_id
INNER JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level
GROUP BY submissions.hacker_id
HAVING submissions.score = difficulty.score AND count(*) >= 2
ORDER BY count(*) DESC, hackers.hacker_id;



/* ERROR 1055 (42000) at line 1: Expression #2 of SELECT list is not in GROUP BY clause
   and contains nonaggregated column 'hackers.name' which is not functionally dependent on columns in GROUP BY clause; 
   this is incompatible with sql_mode=only_full_group_by
   分组之后SELECT的属性要小心
*/
SELECT hackers.hacker_id, hackers.name
FROM hackers
INNER JOIN submissions ON hackers.hacker_id = submissions.hacker_id
INNER JOIN challenges ON submissions.challenge_id = challenges.challenge_id
INNER JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level
WHERE submissions.score = difficulty.score
GROUP BY hackers.hacker_id
HAVING count(*) >= 2
ORDER BY count(*) DESC, hackers.hacker_id;



/* ac commit: 
*/
SELECT hackers.hacker_id, hackers.name
FROM hackers
INNER JOIN submissions ON hackers.hacker_id = submissions.hacker_id
INNER JOIN challenges ON submissions.challenge_id = challenges.challenge_id
INNER JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level
WHERE submissions.score = difficulty.score
GROUP BY hackers.hacker_id, hackers.name
HAVING count(*) >= 2
ORDER BY count(*) DESC, hackers.hacker_id;