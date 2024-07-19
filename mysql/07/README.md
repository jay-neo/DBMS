<div align="center"><h1>Assignment 7</h1></div>

1. Create a view D_10EMP containing details of employees in department 10.
2. Create a view Dept_Summary containing Dname, MINSal, MAXSal, AVGSal.
3. Create a view Emp_Data which would validate entry of any INSERT/ UPDATE command so that Sal figure would be between 10000 to 20000 and MGR would have to be a valid Empno, and Deptno must exists on Dept table.
4. Create a view which restricts data access to a valid employee’s own details on the Emp table and access time to office hours (09-17 and MON- SAT).
5. Create a view EMPLOYEES from emp table which contains empno, ename, job, depy and validate the deptno that must be in Dept table.
6. Create a READ only view EMP_READ from emp table which contains job, minsal, maxsal.
7. Table Client_master

|Column_Name |Data type |Size |Attributes |
| - | - | - | - |
|Client_no |Varchar2 |8 |Primary Key |
|Name |Varchar2 |20 |Not Null |
|Address1 |Varchar2 |20 |Not Null |
|Address2 |Varchar2 |20 ||
|City |Varchar2 |15 ||
|Pincode |Varchar2 |8 ||
|Bal_due |Number |8,3 ||

```sql
A. Create a view vw_clent_master using Client_no,Name,Address1 and Bal_due
    i. Insert at least 3 records to vw_client_master.
    ii. Update a record to vw_client_master.
    iii. Delete a record from vw_client_master.
And check that the above operation if the base table is affected or not.


B. Create a view Vw_sales_det using Order_no,Order_date, Product_no, Qty_ordered,
and order_status for all order which have already marked as ‘Backorder’
(Using the tables sales_order,sales_order_details).
    i. Insert a record to vw_sales_det.
    ii. Update the client_no for a particular order_no.
    iii. Delete a record.
    iv. Remove the views from database.
    
```