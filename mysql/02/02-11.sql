SELECT 
    DATE_FORMAT(delivery_date, '%d-%M-%y') AS formatted_delivery_date
FROM sales_order;
