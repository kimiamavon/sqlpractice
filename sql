/* 
https://www.hackerrank.com/challenges/the-pads/problem

Generate the following two result sets:
1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:  

*/

SELECT Name, concat('(',SUBSTRING(Occupation, 1,1), ')')
From Occupations ; 


(SELECT 'There are a total of', count(Occupation), LOWER(Occupation)
FROM OCCUPATIONS
Group by occupation
ORDER BY count(Occupation), Occupation) )
