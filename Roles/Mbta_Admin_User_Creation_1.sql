/** 
''' This is done by ADMIN USER to create an mbta_admin for the MBTA project '''
**/

SET SERVEROUTPUT ON;

DECLARE
    user_exists NUMBER;
    grant_error EXCEPTION;
BEGIN
    -- Check if the user already exists
    SELECT COUNT(*)
    INTO user_exists
    FROM all_users
    WHERE username = 'MBTA_ADMIN';

    IF user_exists = 0 THEN
        -- Create the user if it doesn't exist
        EXECUTE IMMEDIATE 'CREATE USER mbta_admin IDENTIFIED BY "AdminRole@1234"';
        DBMS_OUTPUT.PUT_LINE('User "mbta_admin" created successfully.');
    ELSE
        -- User already exists, inform the user
        DBMS_OUTPUT.PUT_LINE('User "mbta_admin" already exists.');
    END IF;

    BEGIN
        -- Grant necessary privileges to mbta_admin
        EXECUTE IMMEDIATE 'GRANT CONNECT TO mbta_admin';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TRIGGER, CREATE VIEW, CREATE PUBLIC SYNONYM, CREATE USER TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CONNECT TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CREATE ROLE TO mbta_admin WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT UNLIMITED TABLESPACE TO mbta_admin';
        
        -- Additional privileges to manage other users and grant privileges
        EXECUTE IMMEDIATE 'GRANT ALTER USER TO mbta_admin WITH ADMIN OPTION';
        
        -- Informational message
        DBMS_OUTPUT.PUT_LINE('All necessary privileges granted to "mbta_admin".');
    EXCEPTION
        WHEN grant_error THEN
            NULL; -- Ignore if the user already has the privilege
    END;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
