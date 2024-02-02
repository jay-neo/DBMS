CREATE TABLE IF NOT EXISTS client_master (
    Client_no VERCHAR2(6),
    Name VERCHAR2(30),
    Address1 VERCHAR2(30),
    Address2 VERCHAR2(30),
    City VERCHAR2(15),
    State VERCHAR2(15),
    Pincode INT(6),
    Balance_due DECIMAL(10,2)
);
