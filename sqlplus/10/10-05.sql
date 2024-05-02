create view vi as
select
    empno,
    ename,
    emp.deptno,
    job,
    sal,
    dname,
    loc
from
    emp,
    dept
where
    emp.deptno = dept.deptno;

-----------------------
create
or replace trigger ti instead of delete on vi for each row
begin
delete from emp
where
    deptno = :old.deptno;

delete from dept
where
    deptno = :old.deptno;

end;