CREATE TABLE sales_order (
   Order_no VARCHAR2(6) PRIMARY KEY CHECK(Order_no LIKE 'O%'),
   Order_date DATE,
   Client_no VARCHAR2(6) REFERENCES client_master(Client_no),
   Salesman_no VARCHAR2(6) REFERENCES salesman_master(Salesman_no),
   Delivery_type CHAR(1) DEFAULT 'F' CHECK (Delivery_type IN('P','F')),
   Bill_y_n CHAR(1),      
   Delivery_date DATE, CHECK(Delivery_date >= Order_date),
   Order_status VARCHAR2(10) CHECK (Order_status IN ('InProcess', 'Fulfilled', 'BackOrder', 'Cancelled'))
);
