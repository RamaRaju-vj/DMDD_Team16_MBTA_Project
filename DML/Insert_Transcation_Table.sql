DECLARE
    transaction_exists INTEGER;
BEGIN
    -- Insert Transaction 1: Completed with Not Eligible refund
    SELECT COUNT(*) INTO transaction_exists FROM transaction_table WHERE ticket_id_fk = 1 AND transaction_date = SYSDATE - 1;
    IF transaction_exists = 0 THEN
        INSERT INTO transaction_table (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
        VALUES (transaction_seq_pk.NEXTVAL, 1, 'Completed', 2.40, SYSDATE - 1, 'Not Refunded', 'Not Requested', 1);
        DBMS_OUTPUT.PUT_LINE('Transaction 1 inserted: Completed, Not Eligible refund.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Transaction 1 already exists. Skipping insertion...');
    END IF;

    -- Insert Transaction 2: Pending, refund request is not eligible by default
    SELECT COUNT(*) INTO transaction_exists FROM transaction_table WHERE ticket_id_fk = 2 AND transaction_date = SYSDATE - 2;
    IF transaction_exists = 0 THEN
        INSERT INTO transaction_table (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
        VALUES (transaction_seq_pk.NEXTVAL, 2, 'Pending', 2.40, SYSDATE - 2, 'Not Eligible', 'Not Requested', 2);
        DBMS_OUTPUT.PUT_LINE('Transaction 2 inserted: Pending, Not Eligible for refund.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Transaction 2 already exists. Skipping insertion...');
    END IF;

    -- Insert Transaction 3: Completed with Refunded status and refund request
    SELECT COUNT(*) INTO transaction_exists FROM transaction_table WHERE ticket_id_fk = 3 AND transaction_date = SYSDATE - 3;
    IF transaction_exists = 0 THEN
        INSERT INTO transaction_table (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
        VALUES (transaction_seq_pk.NEXTVAL, 3, 'Completed', 2.40, SYSDATE - 3, 'Refunded', 'Requested', 3);
        DBMS_OUTPUT.PUT_LINE('Transaction 3 inserted: Completed with refund processed.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Transaction 3 already exists. Skipping insertion...');
    END IF;

    -- Insert Transaction 4: Cancelled with auto refund request
    SELECT COUNT(*) INTO transaction_exists FROM transaction_table WHERE ticket_id_fk = 4 AND transaction_date = SYSDATE - 4;
    IF transaction_exists = 0 THEN
        INSERT INTO transaction_table (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
        VALUES (transaction_seq_pk.NEXTVAL, 4, 'Cancelled', 2.40, SYSDATE - 4, 'Eligible', 'Requested', 4);
        DBMS_OUTPUT.PUT_LINE('Transaction 4 inserted: Cancelled with auto refund request.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Transaction 4 already exists. Skipping insertion...');
    END IF;

    -- Insert Transaction 5: Completed with Eligible refund due to no ride within 1 hour
    SELECT COUNT(*) INTO transaction_exists FROM transaction_table WHERE ticket_id_fk = 5 AND transaction_date = SYSDATE - 5;
    IF transaction_exists = 0 THEN
        INSERT INTO transaction_table (transaction_id_pk, ticket_id_fk, transaction_status, amount, transaction_date, refund_status, refund_request, user_id_fk)
        VALUES (transaction_seq_pk.NEXTVAL, 5, 'Completed', 2.40, SYSDATE - 5, 'Eligible', 'Requested', 5);
        DBMS_OUTPUT.PUT_LINE('Transaction 5 inserted: Completed with Eligible refund.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Transaction 5 already exists. Skipping insertion...');
    END IF;
END;
/
