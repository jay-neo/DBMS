<div align="center"><h1>Assignment 10</h1></div>


1. Create a Procedure INCR_OF_EMP in which you will pas empno and amount of increment. If the salary of the specified employee is NULL in Employee table raised the exception ‘Salary Missing’ and display the message ‘This Employee has NULL salary’ else update the salary of the employee. Invoke the INCR_OF_EMP procedure from SQL prompt with some empno and increment amount and follow the consequences.
2. Create a function REVIEW_EMP in which we will pass empno as parameter and return the incremented values of salary based on the following condition:
    If salary <= 15000 then increment will be 20%,
    If salary >15000 and salary <= 30000 then increment will be 30%
    Else increment will be 40%.
Call the REVIEW_EMP function from a PL/SQL Block with empno = 7698 and display the result on the screen.

3. Create a trigger UPPER_STRING for the employee table, which makes the entry in ENAME column in UPPER CASE.
4. Write a trigger TOTAL_SALARY to maintain a derived column TOTSAL of Dept table that stores total salary of all employees in a department.
5. Create a INSTEAD OF TRIGGER in which, if a delete statement is fired on a VIEW, say V1 for an employee Name, then the corresponding employee’s records gets deleted from Employee table.
6. Write a SQL query by which you will see the code that defines the TOTAL_SALARY trigger.
7. Drop the TOTAL_SALARY trigger from the database.
