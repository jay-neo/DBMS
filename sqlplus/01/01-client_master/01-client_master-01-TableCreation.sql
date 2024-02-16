CREATE TABLE client_master (
    Client_no VARCHAR2(6) PRIMARY KEY CHECK (Client_no LIKE 'C%'),
    Name VARCHAR2(30) NOT NULL,
    Address1 VARCHAR2(30),
    Address2 VARCHAR2(30),
    City VARCHAR2(15),
    State VARCHAR2(15),
    Pincode NUMBER(6),
    Balance_due NUMBER(10,2)
);
