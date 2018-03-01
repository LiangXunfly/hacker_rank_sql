SELECT t1.hacker_id, sum(score) as total
FROM hackers LEFT JOIN
(SELECT hackers.hacker_id, max(score) as score
FROM hackers LEFT JOIN submissions ON hackers.hacker_id = submissions.hacker_id
GROUP BY hackers.hacker_id, submissions.challenge_id) t1 ON hackers.hacker_id = t1.hacker_id
GROUP BY t1.hacker_id
ORDER BY total DESC, hacker_id;