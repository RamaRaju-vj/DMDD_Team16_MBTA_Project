SET SERVEROUTPUT ON;

DECLARE
    ride_exists INTEGER;
BEGIN
    -- Insert Ride 1
    SELECT COUNT(*) INTO ride_exists FROM rides WHERE user_id_fk = 1 AND ride_timestamp = SYSDATE - 1;
    IF ride_exists = 0 THEN
        INSERT INTO rides (ride_id, user_id_fk, ride_timestamp, total_spend)
        VALUES (rides_seq_pk.NEXTVAL, 1, SYSDATE - 1, 20);
        DBMS_OUTPUT.PUT_LINE('Ride 1 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ride 1 already exists. Skipping insertion...');
    END IF;

    -- Insert Ride 2
    SELECT COUNT(*) INTO ride_exists FROM rides WHERE user_id_fk = 2 AND ride_timestamp = SYSDATE - 2;
    IF ride_exists = 0 THEN
        INSERT INTO rides (ride_id, user_id_fk, ride_timestamp, total_spend)
        VALUES (rides_seq_pk.NEXTVAL, 2, SYSDATE - 2, 30);
        DBMS_OUTPUT.PUT_LINE('Ride 2 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ride 2 already exists. Skipping insertion...');
    END IF;

    -- Insert Ride 3
    SELECT COUNT(*) INTO ride_exists FROM rides WHERE user_id_fk = 3 AND ride_timestamp = SYSDATE - 3;
    IF ride_exists = 0 THEN
        INSERT INTO rides (ride_id, user_id_fk, ride_timestamp, total_spend)
        VALUES (rides_seq_pk.NEXTVAL, 3, SYSDATE - 3, 40);
        DBMS_OUTPUT.PUT_LINE('Ride 3 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ride 3 already exists. Skipping insertion...');
    END IF;

    -- Insert Ride 4
    SELECT COUNT(*) INTO ride_exists FROM rides WHERE user_id_fk = 4 AND ride_timestamp = SYSDATE - 4;
    IF ride_exists = 0 THEN
        INSERT INTO rides (ride_id, user_id_fk, ride_timestamp, total_spend)
        VALUES (rides_seq_pk.NEXTVAL, 4, SYSDATE - 4, 25);
        DBMS_OUTPUT.PUT_LINE('Ride 4 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ride 4 already exists. Skipping insertion...');
    END IF;

    -- Insert Ride 5
    SELECT COUNT(*) INTO ride_exists FROM rides WHERE user_id_fk = 5 AND ride_timestamp = SYSDATE - 5;
    IF ride_exists = 0 THEN
        INSERT INTO rides (ride_id, user_id_fk, ride_timestamp, total_spend)
        VALUES (rides_seq_pk.NEXTVAL, 5, SYSDATE - 5, 50);
        DBMS_OUTPUT.PUT_LINE('Ride 5 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ride 5 already exists. Skipping insertion...');
    END IF;

END;
/
