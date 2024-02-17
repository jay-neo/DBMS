CREATE TABLE IF NOT EXISTS sales_order_details(
  Order_no VARCHAR(6),
  Product_no VARCHAR(6),
  Qty_ordered INT(8),
  Qty_disp INT(8),
  Product_rate DECIMAL(10,2),
  CONSTRAINT fk_sales_order FOREIGN KEY (Order_no) REFERENCES sales_order(Order_no),
  CONSTRAINT fk_product_master FOREIGN KEY (Product_no) REFERENCES product_master(Product_no)
);
