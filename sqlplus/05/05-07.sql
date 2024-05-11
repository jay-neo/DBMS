-- Find names, job and salaries of all employees and also his boss.
SELECT
    e1.ename,
    e1.job,
    e1.sal,
    e2.ename AS BOSS
FROM
    emp e1
    JOIN emp e2 ON e1.MGR = e2.empno;
