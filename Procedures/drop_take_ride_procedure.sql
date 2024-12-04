SET SERVEROUTPUT ON;

BEGIN
    -- Drop the functions if they exist
    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.validate_ticket';
        DBMS_OUTPUT.PUT_LINE('Function "validate_ticket" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "validate_ticket" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "validate_ticket": ' || SQLERRM);
            END IF;
    END;

    BEGIN
        EXECUTE IMMEDIATE 'DROP FUNCTION MBTA_ADMIN.check_ride_exists';
        DBMS_OUTPUT.PUT_LINE('Function "check_ride_exists" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Function "check_ride_exists" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping function "check_ride_exists": ' || SQLERRM);
            END IF;
    END;

    -- Drop the package if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PACKAGE MBTA_ADMIN.ride_management_pkg';
        DBMS_OUTPUT.PUT_LINE('Package "ride_management_pkg" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Package "ride_management_pkg" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping package "ride_management_pkg": ' || SQLERRM);
            END IF;
    END;

    -- Drop the procedure if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP PROCEDURE MBTA_ADMIN.take_ride';
        DBMS_OUTPUT.PUT_LINE('Procedure "take_ride" dropped successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -4043 THEN
                DBMS_OUTPUT.PUT_LINE('Procedure "take_ride" does not exist. Skipping drop...');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Error while dropping procedure "take_ride": ' || SQLERRM);
            END IF;
    END;
END;
/