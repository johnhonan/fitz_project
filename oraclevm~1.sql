-- jhonan@gmail.com 31-Oct-2017 v1.0
-- This code outputs the employee firstname
-- when you input an employee_id
SET SERVEROUTPUT ON
ACCEPT empno PROMPT 'Please enter an employee_id';
SET AUTOPRINT ON;

DECLARE
    TYPE emp_record_type IS RECORD
        (first_name VARCHAR(20),
        last_name VARCHAR(25),
        job_id VARCHAR(10),
        salary NUMBER(8,2));
        
    emp_record emp_record_type;
    empno NUMBER(6):=&empno; -- This prompts a user to enter an employeeid

BEGIN
-- If the empno entered is less than 100
-- Then output a 'sorry' message and exit
-- Otherwise run our SELECT statement
    IF empno > 99 AND empno < 206
        THEN
            SELECT first_name,
                last_name,
                job_id,
                salary
            INTO emp_record
            FROM hr.employees
            WHERE employee_id=empno; -- This runs our SELECT query, returns one record
        
            -- This outputs the result to the screen
            DBMS_OUTPUT.PUT_LINE('The first name of employee_id ' || empno || ' is ' || emp_record.first_name);
            DBMS_OUTPUT.PUT_LINE('The last name is ' || emp_record.last_name);
            DBMS_OUTPUT.PUT_LINE('The job_id is ' || emp_record.job_id);
            DBMS_OUTPUT.PUT_LINE('The salary is ' || emp_record.salary);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Sorry, employee_id must be between 100 and 206');
    END IF;
END;


