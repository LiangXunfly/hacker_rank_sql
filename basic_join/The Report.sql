/* UNION All的排序规则并不能确定
   这个题的描述并不清楚,我以为grade小于8的排序条件和大于等于8的不一样. 题描述不清
*/
(SELECT name, (SELECT grade FROM grades where marks >= min_mark AND marks <= max_mark) grade, students.marks
FROM students
WHERE marks >= 70
ORDER BY grade DESC, name)
UNION ALL
(SELECT NULL as name, (SELECT grade FROM grades where marks >= min_mark AND marks <= max_mark) grade, students.marks
FROM students
WHERE marks < 70
ORDER BY marks)
;


/* ac commit:
*/
SELECT CASE WHEN grade >= 8 THEN name ELSE NULL END, grade, marks  
FROM students INNER JOIN grades ON students.marks >= grades.min_mark AND students.marks <= grades.max_mark
ORDER BY grade DESC, name;