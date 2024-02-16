CREATE TABLE salesman_master (
    Salesman_no VARCHAR2(6) PRIMARY KEY CHECK (Salesman_no LIKE 'S%'),
    Salesman_name VARCHAR2(30) NOT NULL,
    Address1 VARCHAR2(30) NOT NULL,
    Address2 VARCHAR2(30),
    City VARCHAR2(20),
    Pincode NUMBER(8),
    State VARCHAR2(20),
    Sal_amt NUMBER(8,2) NOT NULL CHECK (Sal_amt > 0)
);
