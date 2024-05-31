DECLARE dno number := &deptno;

BEGIN
update dept
set
    loc = 'KOLKATA'
where
    deptno = dno;

if (SQL % FOUND) then DBMS_OUTPUT.PUT_LINE ('Updated');

else DBMS_OUTPUT.PUT_LINE ('Data NOT Found');

end if;

END;