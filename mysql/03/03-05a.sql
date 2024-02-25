CREATE TABLE Emp (
  EMPNO DECIMAL(4,0) NOT NULL,
  ENAME VARCHAR(10),
  JOB VARCHAR(9),
  MGR DECIMAL(4,0),
  HIREDATE DATE,
  SAL DECIMAL(7,2),
  COMM DECIMAL(7,2),
  DEPTNO DECIMAL(2,0) NOT NULL
);

INSERT INTO Emp (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'SMITH', 'CLERK', 7902, STR_TO_DATE('17-DEC-80', '%d-%b-%y'), 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, STR_TO_DATE('20-FEB-81', '%d-%b-%y'), 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, STR_TO_DATE('22-FEB-81', '%d-%b-%y'), 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, STR_TO_DATE('02-APR-81', '%d-%b-%y'), 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, STR_TO_DATE('28-SEP-81', '%d-%b-%y'), 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, STR_TO_DATE('01-MAY-81', '%d-%b-%y'), 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, STR_TO_DATE('09-JUN-81', '%d-%b-%y'), 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, STR_TO_DATE('19-APR-87', '%d-%b-%y'), 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, STR_TO_DATE('17-NOV-81', '%d-%b-%y'), 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, STR_TO_DATE('08-SEP-81', '%d-%b-%y'), 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, STR_TO_DATE('23-MAY-87', '%d-%b-%y'), 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, STR_TO_DATE('03-DEC-81', '%d-%b-%y'), 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, STR_TO_DATE('03-DEC-81', '%d-%b-%y'), 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, STR_TO_DATE('23-JAN-82', '%d-%b-%y'), 1300, NULL, 10);


SELECT * FROM Emp;