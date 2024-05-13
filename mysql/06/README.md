<div align="center"><h1>Assignment 6</h1></div>

1. Create two table emp_new and dept_new as the same structure and data as of emp and dept table.
2. Modify dept_new table so that deptno will be the PRIMARY key.
3. Add a column named, ‘Grade’ (which holds grade of the employees) with CHAR(1) to the existing emp_new table.
4. Modyfy emp_new table to add a constraint ‘emp_noPri’ as PRIMARY key on empno attribute.
5. Add constraints REFERENCES to deptno of emp_new table referring deptno of dept_new table.
6. Modify the emp_new table so that we can’t store the salary of the employee which is less than 700.
7. Modify the sal column of emp_new table to NOT NULL and increase its size to 10.
8. Modify the ename column of emp_new table to increase its width to VARCHAR(35).
9. Drop the PRIMARY key constraint from emp_new table.
10. Drop the primary key constraint of dept_new table so that it will also dropped the foreign key constraint on emp_new_deptno.
11. Display all column name and constraint name of emp_new table.
12. Disable the primary key constraint of dept_new table.
13. Create table emp_new1 and dept_new1 from emp and dept respectively (also consider that there is a referential integrity between the tables using deptno attribute).
14. Now try to drop the dept_new1 table and give a comment on your output.
15. Add the comment ‘Employee Information of XYZ Company’ on emp table.
16. Add the comment ‘Unique depart of XYZ Company’ to deptno column of dept table.
17. How to show the comments of a particular column of a table?
18. How to show the comments on a particular a table?
19. Remove the comment on emp table.
20. Change the name of the emp table as emp_change table.
21. Drop the emp_new1 table so that the table structure will remain there in the database.
22. Drop the dept_new1 table permanently so the table structure wills no longer present in the database.
23. Drop the Gade column from emp_new table.
24. Make the comm. column of emp_new table as unused
25. How can we display the marked unsued columns of a emp_new table.
26. Drop the unused columns of emp_new table.
27. Rename the comm. column of emp_new table to commission.