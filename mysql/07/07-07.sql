CREATE TABLE Client_Master (
    Client_no VARCHAR2(8) PRIMARY KEY,
    Name VARCHAR2(20) NOT NULL,
    Address1 VARCHAR2(20) NOT NULL,
    Address2 VARCHAR2(20),
    City VARCHAR2(15),
    State VARCHAR2(15),
    Pincode VARCHAR2(8),
    Bal_due NUMBER(8, 3)
);