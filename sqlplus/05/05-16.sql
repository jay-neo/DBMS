-- List the job with highest average salary.

SELECT job
FROM emp
GROUP BY job 
HAVING AVG(sal) = (
    SELECT MAX(AVG(sal))
    FROM emp
    GROUP BY job
);
