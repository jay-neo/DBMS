CREATE TABLE product_master(
      Product_no VARCHAR2(6) PRIMARY KEY CHECK (Product_no LIKE 'P%'),
      Description VARCHAR2(40) NOT NULL,
      Profit_percent NUMBER(4,2) NOT NULL,
      Unit_measure VARCHAR2(10) NOT NULL,
      Qty_on_hand NUMBER(8) NOT NULL,
      Reorder_level NUMBER(8) NOT NULL,     
      Sell_price NUMBER(8,2) NOT NULL CHECK (Sell_price > 0),
      Cost_price NUMBER(8,2) NOT NULL, CHECK (Cost_PRICE > 0)
);
