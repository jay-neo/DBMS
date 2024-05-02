CREATE TABLE t2 (ID NUMBER(4));

INSERT INTO
    t2 (ID)
VALUES
    (1111);

-- Oracle issued the following error: 
-- ORA-01950: no privileges on tablespace 'USERS' 
-- This is because the user john has a quota of zero on the USERS tablespace. 
ALTER USER Test1_100 QUOTA UNLIMITED ON USERS;

-- Now, the user Test1_100 should be able to insert a row into the t2 table: 
INSERT INTO
    t2 (ID)
VALUES
    (1111);
