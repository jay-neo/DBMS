<div align="center"><h1>Assignment 11</h1></div>


1. Write a SQL statement to create a new local user named ‘Test1_<roll_no>’ e.g Test1_007 with the password ‘mckvie2024’ and with password expired option.

```sql
CREATE USER Test1_007 IDENTIFIED BY mckvie2024 PASSWORD EXPIRE;
```

2. Find a list of users (username, default_tablespace, profile, authentication_type) with the OPEN status; you query the information from the dba_users.

```sql
SELECT username, default_tablespace, profile, authentication_type
FROM dba_users
WHERE account_status = 'OPEN';
```

3. Try to login to the newly created user using a new window and observe the outcome and comment on it.

```sql
CONNECT Test1_007@mckvie2024
```

4. Write a SQL statement to enable with the login system privilege to the user ‘Test1_<roll_no>’.

```sql
ALTER USER Test1_007 ACCOUNT UNLOCK;
```

5. Write a SQL statement to grant the CREATE TABLE system privilege to the user ‘Test1_<roll_no>’.

```sql
GRANT CREATE TABLE TO Test1_007;
```

6. Write a SQL statement to statement to show the privileges of the current user.

```sql
SELECT * FROM SESSION_PRIVS;
```

7. Create a new table named t2 (ID NUMBER (4)) and allow ‘Test1_<roll_no>’ to insert and update data in it.

```sql
CREATE TABLE t2 (ID NUMBER(4));
GRANT INSERT, UPDATE ON t2 TO Test1_007;
```

8. Write a SQL statement to revoke the object privileges from ‘Test1_<roll_no>’.

```sql
REVOKE INSERT, UPDATE ON t2 FROM Test1_007;
```

