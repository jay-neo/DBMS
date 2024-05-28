CREATE VIEW Dept_Summary AS
SELECT d.dname,
       MIN(e.sal) AS MINSal,
       MAX(e.sal) AS MAXSal,
       AVG(e.sal) AS AVGSal
FROM dept d
JOIN emp e ON d.deptno = e.deptno
GROUP BY d.dname;
