DROP TABLE IF EXISTS client_master CASCADE;


CREATE TABLE client_master (
    client_no VARCHAR(8) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    address1 VARCHAR(20) NOT NULL,
    address2 VARCHAR(20),
    city VARCHAR(15),
    pincode VARCHAR(8),
    bal_due NUMERIC(8,3)
);
