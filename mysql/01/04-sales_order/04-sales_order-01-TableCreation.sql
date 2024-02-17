CREATE TABLE IF NOT EXISTS sales_order (
   Order_no VARCHAR(6) PRIMARY KEY CHECK(Order_no LIKE 'O%'),
   Order_date DATE,
   Client_no VARCHAR(6),
   Salesman_no VARCHAR(6),
   Delivery_type CHAR(1) DEFAULT 'F' CHECK (Delivery_type IN('P','F')),
   Bill_y_n CHAR(1),      
   Delivery_date DATE,
   Order_status VARCHAR(10) CHECK (Order_status IN ('InProcess', 'Fulfilled', 'BackOrder', 'Cancelled')),
   CONSTRAINT fk_client_master FOREIGN KEY (Client_no) REFERENCES client_master(Client_no),
   CONSTRAINT fk_salesman_master FOREIGN KEY (Salesman_no) REFERENCES salesman_master(Salesman_no),
   CHECK(Delivery_date >= Order_date)
);
