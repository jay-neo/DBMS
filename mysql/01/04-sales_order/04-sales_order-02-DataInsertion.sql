INSERT INTO Sales_Order VALUES
('O19001', STR_TO_DATE('12-Jan-96', '%d-%b-%y'), 'C001', 'S001', 'F', 'N', STR_TO_DATE('20-Jan-96', '%d-%b-%y'), 'InProcess'),
('O19002', STR_TO_DATE('25-Jan-96', '%d-%b-%y'), 'C002', 'S002', 'P', 'N', STR_TO_DATE('27-Jan-96', '%d-%b-%y'), 'BackOrder'),
('O46865', STR_TO_DATE('18-Feb-96', '%d-%b-%y'), 'C003', 'S003', 'F', 'Y', STR_TO_DATE('20-Feb-96', '%d-%b-%y'), 'Fulfilled'),
('O19003', STR_TO_DATE('03-Apr-96', '%d-%b-%y'), 'C001', 'S001', 'F', 'Y', STR_TO_DATE('07-Apr-96', '%d-%b-%y'), 'Fulfilled'),
('O46866', STR_TO_DATE('20-May-96', '%d-%b-%y'), 'C004', 'S002', 'P', 'N', STR_TO_DATE('22-May-96', '%d-%b-%y'), 'Cancelled'),
('O19008', STR_TO_DATE('24-May-96', '%d-%b-%y'), 'C005', 'S004', 'F', 'N', STR_TO_DATE('26-May-96', '%d-%b-%y'), 'InProcess');

SELECT * FROM sales_order;
