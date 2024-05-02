create
or replace function review_emp (emp_no number) return number is incr emp.sal % type;

net emp.sal % type;

vempno emp.empno % type;

vsal emp.sal % type;

vcomm emp.comm % type;

begin
select
    empno,
    sal,
    nvl(comm, 0) into vempno,
    vsal,
    vcomm
from
    emp
where
    empno = emp_no;

net := vsal + vcomm;

if vsal <= 1500 then incr := net * 0.2;

elsif vsal > 1500
and vsal <= 3000 then incr := net * 0.3;

else incr := net * 0.4;

end if;

return (incr);

end review_emp;
