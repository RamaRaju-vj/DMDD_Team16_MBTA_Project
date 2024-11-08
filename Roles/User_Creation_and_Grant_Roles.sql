-- Enable server output to display messages
SET SERVEROUTPUT ON;

-- Create Roles
DECLARE
    role_name VARCHAR2(30);
BEGIN
    -- Customer Role
    role_name := 'CUSTOMER_ROLE';
    BEGIN
        EXECUTE IMMEDIATE 'CREATE ROLE ' || role_name;
        DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' created successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1921 THEN
                DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' already exists. Skipping...');
            ELSE
                RAISE;
            END IF;
    END;

    -- Cashier Role
    role_name := 'CASHIER_ROLE';
    BEGIN
        EXECUTE IMMEDIATE 'CREATE ROLE ' || role_name;
        DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' created successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1921 THEN
                DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' already exists. Skipping...');
            ELSE
                RAISE;
            END IF;
    END;

    -- Group Booking Manager Role
    role_name := 'GROUP_BOOKING_MANAGER_ROLE';
    BEGIN
        EXECUTE IMMEDIATE 'CREATE ROLE ' || role_name;
        DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' created successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1921 THEN
                DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' already exists. Skipping...');
            ELSE
                RAISE;
            END IF;
    END;

    -- Subscription Manager Role
    role_name := 'SUBSCRIPTION_MANAGER_ROLE';
    BEGIN
        EXECUTE IMMEDIATE 'CREATE ROLE ' || role_name;
        DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' created successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1921 THEN
                DBMS_OUTPUT.PUT_LINE('Role ' || role_name || ' already exists. Skipping...');
            ELSE
                RAISE;
            END IF;
    END;
END;
/

-- Grant Permissions to Roles
BEGIN
    -- Customer Role Permissions
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.ticket TO CUSTOMER_ROLE';
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.subscription TO CUSTOMER_ROLE';
    EXECUTE IMMEDIATE 'GRANT INSERT ON MBTA_ADMIN.ticket TO CUSTOMER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on ticket and subscription, INSERT on ticket to CUSTOMER_ROLE.');

    -- Cashier Role Permissions
    EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE ON MBTA_ADMIN.transaction_table TO CASHIER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT and UPDATE on transaction_table to CASHIER_ROLE.');

    -- Group Booking Manager Role Permissions
    EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE ON MBTA_ADMIN.group_booking TO GROUP_BOOKING_MANAGER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT and UPDATE on group_booking to GROUP_BOOKING_MANAGER_ROLE.');

    -- Subscription Manager Role Permissions
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.subscription TO SUBSCRIPTION_MANAGER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on subscription to SUBSCRIPTION_MANAGER_ROLE.');
END;
/

-- Create Users, Assign Roles, Grant CREATE SESSION, and UNLIMITED TABLESPACE
DECLARE
    user_count NUMBER;
BEGIN
    -- Create Customer User
    SELECT COUNT(*) INTO user_count FROM all_users WHERE username = 'CUSTOMER_USER';
    IF user_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER customer_user IDENTIFIED BY "CustomerUser@12345"';
        EXECUTE IMMEDIATE 'GRANT CUSTOMER_ROLE TO customer_user';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, UNLIMITED TABLESPACE TO customer_user';
        DBMS_OUTPUT.PUT_LINE('User "customer_user" created and assigned CUSTOMER_ROLE with CREATE SESSION and UNLIMITED TABLESPACE privileges.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User "customer_user" already exists. Skipping password update...');
    END IF;

    -- Create Cashier User
    SELECT COUNT(*) INTO user_count FROM all_users WHERE username = 'CASHIER_USER';
    IF user_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER cashier_user IDENTIFIED BY "CashierUser@12345"';
        EXECUTE IMMEDIATE 'GRANT CASHIER_ROLE TO cashier_user';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, UNLIMITED TABLESPACE TO cashier_user';
        DBMS_OUTPUT.PUT_LINE('User "cashier_user" created and assigned CASHIER_ROLE with CREATE SESSION and UNLIMITED TABLESPACE privileges.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User "cashier_user" already exists. Skipping password update...');
    END IF;

    -- Create Group Booking Manager User
    SELECT COUNT(*) INTO user_count FROM all_users WHERE username = 'GROUP_BOOKING_MANAGER_USER';
    IF user_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER group_booking_manager_user IDENTIFIED BY "GroupBookingManager@12345"';
        EXECUTE IMMEDIATE 'GRANT GROUP_BOOKING_MANAGER_ROLE TO group_booking_manager_user';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, UNLIMITED TABLESPACE TO group_booking_manager_user';
        DBMS_OUTPUT.PUT_LINE('User "group_booking_manager_user" created and assigned GROUP_BOOKING_MANAGER_ROLE with CREATE SESSION and UNLIMITED TABLESPACE privileges.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User "group_booking_manager_user" already exists. Skipping password update...');
    END IF;

    -- Create Subscription Manager User
    SELECT COUNT(*) INTO user_count FROM all_users WHERE username = 'SUBSCRIPTION_MANAGER_USER';
    IF user_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER subscription_manager_user IDENTIFIED BY "SubscriptionManager@12345"';
        EXECUTE IMMEDIATE 'GRANT SUBSCRIPTION_MANAGER_ROLE TO subscription_manager_user';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, UNLIMITED TABLESPACE TO subscription_manager_user';
        DBMS_OUTPUT.PUT_LINE('User "subscription_manager_user" created and assigned SUBSCRIPTION_MANAGER_ROLE with CREATE SESSION and UNLIMITED TABLESPACE privileges.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User "subscription_manager_user" already exists. Skipping password update...');
    END IF;
END;
/