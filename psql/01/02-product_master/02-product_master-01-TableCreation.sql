CREATE TABLE IF NOT EXISTS product_master(
      Product_no VARCHAR(6) PRIMARY KEY CHECK (Product_no LIKE 'P%'),
      Description VARCHAR(40) NOT NULL,
      Profit_percent DECIMAL(4,2) NOT NULL,
      Unit_measure VARCHAR(10) NOT NULL,
      Qty_on_hand INT NOT NULL,
      Reorder_level INT NOT NULL,     
      Sell_price DECIMAL(8,2) NOT NULL CHECK (Sell_price > 0),
      Cost_price DECIMAL(8,2) NOT NULL CHECK (Cost_price > 0)
);
