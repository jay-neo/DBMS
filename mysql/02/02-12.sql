SELECT 
    DATE_FORMAT(Order_date, '%d-%M-%y') AS Formatted_Order_date
FROM sales_order;
