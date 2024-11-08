SET SERVEROUTPUT ON;


-- Create a global sequence to be used by all tables
BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE user_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "user_seq_pk" created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Sequence "user_seq_pk" already exists. Skipping...');
        ELSE
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE transaction_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "transaction_seq_pk" created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Sequence "transaction_seq_pk" already exists. Skipping...');
        ELSE
            RAISE;
        END IF;
END;
/


BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE rides_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "rides_seq_pk" created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Sequence "rides_seq_pk" already exists. Skipping...');
        ELSE
            RAISE;
        END IF;
END;
/


BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE subscription_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "subscription_seq_pk" created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Sequence "subscription_seq_pk" already exists. Skipping...');
        ELSE
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE ticket_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "ticket_seq_pk" created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Sequence "ticket_seq_pk" already exists. Skipping...');
        ELSE
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE groupBooking_seq_pk START WITH 1 INCREMENT BY 1';
    DBMS_OUTPUT.PUT_LINE('Sequence "groupBooking_seq_pk" created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Sequence "groupBooking_seq_pk" already exists. Skipping...');
        ELSE
            RAISE;
        END IF;
END;
/