CREATE TABLE Salgrade (
  grade NUMBER,
  losal NUMBER,
  hisal NUMBER
);

INSERT INTO
  Salgrade (grade, losal, hisal)
VALUES
  (1, 700, 1200),
  (2, 1201, 1400),
  (3, 1401, 2000),
  (4, 2001, 3000),
  (5, 3001, 9999);

SELECT
  *
FROM
  Salgrade;
