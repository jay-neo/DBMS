SET SURVEROUTPUT ON 
DECLARE 
    Vempno emp.empno%type; 
    Vename emp.ename%type; 
    Vsal emp.sal%type; 
    Vdeptno emp.deptno%type; 
    URSOR C1 is SELECT empno,ename,sal,deptno FROM emp 
    WHERE sal+NVL(comm.,0) > 25000; 
BEGIN 
    OPEN C1; 
    LOOP 
        FETCH C1 INTO Vempno,Vname,Vsal, Vdeptno; 
        IF C1%FOUND THEN 
            Dbms_output.put_line(Vempno||' '|| Vname||' ' || Vsal ||' ' ||Vdeptno); 
        ELSE 
            EXIT; 
        END IF; 
    END LOOP; 
    CLOSE C1;
END;