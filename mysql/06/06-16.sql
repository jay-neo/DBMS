-- COMMENT ON COLUMN dept.deptno IS 'Unique depart of XYZ Company';

ALTER TABLE dept
MODIFY deptno INT COMMENT 'Unique depart of XYZ Company';
