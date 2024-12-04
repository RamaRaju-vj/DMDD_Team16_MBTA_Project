SET SERVEROUTPUT ON;

-- Delete data from all tables
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM txn_tbl';
    EXECUTE IMMEDIATE 'DELETE FROM rds';
    EXECUTE IMMEDIATE 'DELETE FROM subs';
    EXECUTE IMMEDIATE 'DELETE FROM grp_bkg';
    EXECUTE IMMEDIATE 'DELETE FROM tkt';
    EXECUTE IMMEDIATE 'DELETE FROM usr_tbl';
    DBMS_OUTPUT.PUT_LINE('All data deleted from tables successfully.');
END;
/

-- Drop existing sequences
DECLARE
    seq_count NUMBER;
BEGIN
    FOR seq_name IN (
        SELECT sequence_name
        FROM user_sequences
        WHERE sequence_name IN (
            'USER_SEQ_PK', 'TRANSACTION_SEQ_PK', 'RIDES_SEQ_PK', 'SUBSCRIPTION_SEQ_PK', 'TICKET_SEQ_PK', 'GROUPBOOKING_SEQ_PK'
        )
    ) LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || seq_name.sequence_name;
        DBMS_OUTPUT.PUT_LINE('Sequence "' || seq_name.sequence_name || '" dropped successfully.');
    END LOOP;
END;
/

-- Recreate sequences
DECLARE
    seq_names SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
        'USER_SEQ_PK', 'TRANSACTION_SEQ_PK', 'RIDES_SEQ_PK', 'SUBSCRIPTION_SEQ_PK', 'TICKET_SEQ_PK', 'GROUPBOOKING_SEQ_PK'
    );
BEGIN
    FOR i IN 1..seq_names.COUNT LOOP
        EXECUTE IMMEDIATE 'CREATE SEQUENCE ' || seq_names(i) || ' START WITH 1 INCREMENT BY 1';
        DBMS_OUTPUT.PUT_LINE('Sequence "' || seq_names(i) || '" created successfully.');
    END LOOP;
END;
/




-- Step 1: Delete data from the discounts table
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM disc';
    DBMS_OUTPUT.PUT_LINE('All data deleted from discounts table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting data from discounts table.');
END;
/

-- Step 2: Insert data into the discounts table
BEGIN
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (0, 'Regular', 0);
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (1, 'Student', 5.00);
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (2, 'Senior', 10.00);
    INSERT INTO disc (discount_id_pk, discount_type, discount_rate) VALUES (3, 'Group Booking', 5.00);
    DBMS_OUTPUT.PUT_LINE('Data inserted into discounts table successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting data into discounts table.');
END;
/

