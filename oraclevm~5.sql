-- Use a CURSOR to print all the employees
-- in location 1700
-- You'll be joining hr.employees and hr.departments on department_id
-- WHERE location_id = 1700

-- Don't forget this part!
SET SERVEROUTPUT ON

DECLARE

    CURSOR emp_cursor IS -- This is our select statement
        SELECT
            e.employee_id,
            e.last_name,
            e.first_name,
            e.salary
        FROM hr.employees e
        JOIN hr.departments d
        ON e.department_id = d.department_id
        WHERE d.location_id=1700;
    
    -- create a RECORD to contain the returned values
    emp_record emp_cursor%ROWTYPE;
    
BEGIN
    OPEN emp_cursor;
    DBMS_OUTPUT.PUT_LINE(emp_cursor%ROWCOUNT);
    CLOSE emp_cursor;
    FOR emp_record IN emp_cursor -- OPEN the cursor and does the FETCH
    LOOP
        -- Retrieve a record from the active set
        -- Print it out
        DBMS_OUTPUT.PUT_LINE(emp_record.employee_id);
        DBMS_OUTPUT.PUT_LINE(emp_record.last_name);
        DBMS_OUTPUT.PUT_LINE(emp_record.first_name);
        DBMS_OUTPUT.PUT_LINE(emp_record.salary);
    END LOOP; -- drop out of loop and CLOSE cursor
END;

