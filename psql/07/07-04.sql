CREATE VIEW Emp_Restricted AS
SELECT *
FROM emp
WHERE CURRENT_TIME BETWEEN '09:00:00' AND '17:00:00'
  AND CURRENT_DATE IN (SELECT date FROM generate_series(current_date - EXTRACT(DOW FROM current_date)::integer + 1, current_date, '1 day'::interval) AS date
                        WHERE EXTRACT(ISODOW FROM date) < 7); 
