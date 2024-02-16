CREATE TABLE sales_order_details(
  Order_no VARCHAR2(6) REFERENCES sales_order(Order_no),
  Product_no VARCHAR2(6) REFERENCES product_master(Product_no),
  Qty_ordered NUMBER(8),
  Qty_disp NUMBER(8),
  Product_rate NUMBER(10,2)
);
