CREATE TABLE IF NOT EXISTS client_master (
    Client_no VARCHAR(6) PRIMARY KEY CHECK (Client_no LIKE 'C%'),
    Name VARCHAR(30) NOT NULL,
    Address1 VARCHAR(30),
    Address2 VARCHAR(30),
    City VARCHAR(15),
    State VARCHAR(15),
    Pincode INT(6),
    Balance_due DECIMAL(10,2)
);
