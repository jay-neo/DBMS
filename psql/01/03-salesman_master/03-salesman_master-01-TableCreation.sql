CREATE TABLE IF NOT EXISTS salesman_master (
    Salesman_no VARCHAR(6) PRIMARY KEY CHECK (Salesman_no LIKE 'S%'),
    Salesman_name VARCHAR(30) NOT NULL,
    Address1 VARCHAR(30) NOT NULL,
    Address2 VARCHAR(30),
    City VARCHAR(20),
    Pincode INT,
    State VARCHAR(20),
    Sal_amt DECIMAL(8,2) NOT NULL CHECK (Sal_amt > 0)
);
