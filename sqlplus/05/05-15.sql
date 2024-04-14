-- Display all employee details whose salary is greater than average salary 
-- of employees whose date of joining is before 1st April 81.

SELECT * FROM emp WHERE sal > (
    SELECT AVG(sal)
    FROM emp
    WHERE hiredate < To_date('01-APR-81','DD-MON-YY')
);
