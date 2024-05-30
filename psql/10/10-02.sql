CREATE OR REPLACE FUNCTION REVIEW_EMP(empno INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    current_salary NUMERIC;
    increment NUMERIC;
BEGIN
    -- Retrieve current salary
    SELECT sal INTO current_salary
    FROM emp
    WHERE empno = empno;

    -- Check salary range and determine increment
    IF current_salary IS NULL THEN
        RAISE EXCEPTION 'Salary Missing: This Employee has NULL salary';
    ELSIF current_salary <= 15000 THEN
        increment := current_salary * 0.20;
    ELSIF current_salary > 15000 AND current_salary <= 30000 THEN
        increment := current_salary * 0.30;
    ELSE
        increment := current_salary * 0.40;
    END IF;

    RETURN increment;
END;
$$;

DO $$
DECLARE
    emp_increment NUMERIC;
BEGIN
    emp_increment := REVIEW_EMP(7698);
    RAISE NOTICE 'The increment for employee 7698 is: %', emp_increment;
END $$;

