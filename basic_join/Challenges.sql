/* 第二个t1并不能查
*/
SELECT hacker_id, name, counter
FROM 
(SELECT hackers.hacker_id, name, count(*) as counter
FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, hackers.name) t1
WHERE counter in 
(SELECT counter FROM t1 WHERE count(*) = 1 OR counter = max(counter))
ORDER BY counter DESC, hacker_id;



/* 是有结果了,但是没有去掉挑战总数相同且不为最大数的记录. 因为max(counter)统计的是该组的最大counter,而不是所有记录的最大counter
*/
SET max_counter := select max(counter) FROM (SELECT hackers.hacker_id, name, count(*) as counter
FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, hackers.name) t1;
SELECT t1.hacker_id, t1.name, t1.counter
FROM 
(SELECT hackers.hacker_id, name, count(*) as counter
FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, hackers.name) t1
WHERE counter in 
(SELECT counter FROM 
(SELECT count(*) as counter
FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, hackers.name) t2
GROUP BY counter
HAVING count(counter) = 1 OR counter = max(counter))
ORDER BY counter DESC, hacker_id;





SELECT t1.hacker_id, t1.name, t1.counter
FROM 
(SELECT hackers.hacker_id, name, count(*) as counter
FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, hackers.name) t1
WHERE counter in 
(SELECT counter FROM 
(SELECT count(*) as counter
FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, hackers.name) t2
GROUP BY counter

/*
HAVING count(counter) = SELECT max(t3.counter) FROM 
(SELECT count(*) as counter FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id GROUP BY challenges.hacker_id) t3)
*/
having counter = 50



)
ORDER BY counter DESC, hacker_id;


SELECT count(*) as counter FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, hackers.name) t2