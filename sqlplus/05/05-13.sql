-- List the jobs that are unique to department 20 compare 
-- to other departments present in emp table.

((
    SELECT job
    FROM emp
    WHERE deptno LIKE ( 20 )
)) MINUS ((
    SELECT job
    FROM emp
    WHERE deptno != 20
));
