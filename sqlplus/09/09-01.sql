SET SERVEROUTPUT ON

DECLARE 
    v_empno    emp.empno%TYPE; 
    v_ename    emp.ename%TYPE; 
    v_sal      emp.sal%TYPE; 
    v_deptno   emp.deptno%TYPE; 

    CURSOR c1 IS 
        SELECT empno, ename, sal, deptno 
        FROM emp 
        WHERE sal + NVL(comm, 0) > 25000; 
BEGIN 
    OPEN c1; 
    LOOP 
        FETCH c1 INTO v_empno, v_ename, v_sal, v_deptno; 
        EXIT WHEN c1%NOTFOUND; 
        DBMS_OUTPUT.PUT_LINE(v_empno || ' ' || v_ename || ' ' || v_sal || ' ' || v_deptno); 
    END LOOP; 
    CLOSE c1; 
END; 
/
