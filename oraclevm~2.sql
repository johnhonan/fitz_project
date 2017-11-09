-- jhonan@gmail.com 31-Oct-2017 v1.0
-- This code outputs a list of employees
-- who are paid more than a given salary
SET SERVEROUTPUT ON
ACCEPT sal PROMPT 'Please enter a salary';
SET AUTOPRINT ON;

DECLARE
    TYPE emp_record_type IS RECORD
        (first_name VARCHAR(20),
        last_name VARCHAR(25),
        job_id VARCHAR(10),
        salary NUMBER(8,2));
        
    TYPE emp_list IS TABLE OF
        emp_record_type
        INDEX BY PLS_INTEGER;
    
    emp_list_values emp_list;  
    emp_record emp_record_type;
    sal NUMBER(6):=&sal; -- This prompts a user to enter a salary

BEGIN
    FOR emp_record IN (
        SELECT first_name,
        last_name,
        job_id,
        salary
        FROM hr.employees
        WHERE salary>=sal
        ORDER BY salary ASC
        )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_record.job_id || ' Salary: ' || emp_record.salary);
    END LOOP;
    
    -- This outputs the result to the screen
--    DBMS_OUTPUT.PUT_LINE('The first name of employee_id ' || empno || ' is ' || emp_record.first_name);
--    DBMS_OUTPUT.PUT_LINE('The last name is ' || emp_record.last_name);
--    DBMS_OUTPUT.PUT_LINE('The job_id is ' || emp_record.job_id);
--    DBMS_OUTPUT.PUT_LINE('The salary is ' || emp_record.salary);
END;


