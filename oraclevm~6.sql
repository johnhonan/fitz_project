-- Create a procedure which accepts
-- salary as a value
-- and lists all employees paid more than that

SET SERVEROUTPUT ON
SET AUTOPRINT ON;
ACCEPT sal PROMPT 'Please enter a salary amount';

DECLARE
    sal NUMBER(6):=&sal;

BEGIN
    FOR emp_record IN(
        SELECT
            employee_id,
            first_name,
            last_name,
            job_id,
            salary
        FROM hr.employees
        WHERE salary>=sal
        ORDER BY salary ASC)
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.last_name || ' ' || emp_record.salary);
    END LOOP;
END;
        
