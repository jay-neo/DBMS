SELECT ENAME FROM Emp WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, HIREDATE)) < 38;
