SET SERVEROUTPUT ON;

DECLARE
    subscription_exists INTEGER;
BEGIN
    -- Insert Subscription for User 1
    SELECT COUNT(*) INTO subscription_exists FROM subscription WHERE user_id_fk = 5 AND subscription_type = 'Monthly';
    IF subscription_exists = 0 THEN
        INSERT INTO subscription (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
        VALUES (subscription_seq_pk.NEXTVAL, 5, 'Monthly', SYSDATE - 30, SYSDATE, 'Active');
        DBMS_OUTPUT.PUT_LINE('Subscription for User 1 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Subscription for User 1 already exists. Skipping insertion...');
    END IF;

    -- Insert Subscription for User 2
    SELECT COUNT(*) INTO subscription_exists FROM subscription WHERE user_id_fk = 6 AND subscription_type = 'Yearly';
    IF subscription_exists = 0 THEN
        INSERT INTO subscription (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
        VALUES (subscription_seq_pk.NEXTVAL, 6, 'Yearly', SYSDATE - 365, SYSDATE + 365, 'Active');
        DBMS_OUTPUT.PUT_LINE('Subscription for User 2 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Subscription for User 2 already exists. Skipping insertion...');
    END IF;

    -- Insert Subscription for User 3
    SELECT COUNT(*) INTO subscription_exists FROM subscription WHERE user_id_fk = 7 AND subscription_type = 'Monthly';
    IF subscription_exists = 0 THEN
        INSERT INTO subscription (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
        VALUES (subscription_seq_pk.NEXTVAL, 7, 'Monthly', SYSDATE - 15, SYSDATE + 15, 'Expired');
        DBMS_OUTPUT.PUT_LINE('Subscription for User 3 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Subscription for User 3 already exists. Skipping insertion...');
    END IF;

    -- Insert Subscription for User 4
    SELECT COUNT(*) INTO subscription_exists FROM subscription WHERE user_id_fk = 7 AND subscription_type = 'None';
    IF subscription_exists = 0 THEN
        INSERT INTO subscription (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
        VALUES (subscription_seq_pk.NEXTVAL, 7, 'Weekly', SYSDATE - 7, SYSDATE, 'Active');
        DBMS_OUTPUT.PUT_LINE('Subscription for User 4 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Subscription for User 4 already exists. Skipping insertion...');
    END IF;

    -- Insert Subscription for User 5
    SELECT COUNT(*) INTO subscription_exists FROM subscription WHERE user_id_fk = 8 AND subscription_type = 'Monthly';
    IF subscription_exists = 0 THEN
        INSERT INTO subscription (subscription_id_pk, user_id_fk, subscription_type, start_date, end_date, subscription_status)
        VALUES (subscription_seq_pk.NEXTVAL, 8, 'Monthly', SYSDATE - 45, SYSDATE - 15, 'Expired');
        DBMS_OUTPUT.PUT_LINE('Subscription for User 5 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Subscription for User 5 already exists. Skipping insertion...');
    END IF;
END;
/
