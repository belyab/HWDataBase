CREATE VIEW employee_id_check
AS SELECT * from employee
WHERE employee_id = 1
WITH LOCAL CHECK OPTION;