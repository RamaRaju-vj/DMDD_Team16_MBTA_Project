SET SERVEROUTPUT ON;

DECLARE
    booking_exists INTEGER;
    user_exists INTEGER;
    discount_exists INTEGER;
BEGIN
    -- Ensure that discount ID 3 exists in the DISCOUNTS table before proceeding
    SELECT COUNT(*) INTO discount_exists FROM discounts WHERE discount_id_pk = 3;
    
    IF discount_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Discount ID 3 does not exist. Cannot proceed with group booking inserts.');
        RETURN;
    END IF;

    -- Insert Group Booking 1
    SELECT COUNT(*) INTO user_exists FROM user_table WHERE user_id_pk = 1;
    SELECT COUNT(*) INTO booking_exists FROM group_booking WHERE user_id_fk = 1 AND booking_date = SYSDATE - 1;
    
    IF user_exists > 0 AND booking_exists = 0 THEN
        INSERT INTO group_booking (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk)
        VALUES (groupBooking_seq_pk.NEXTVAL, 1, 5, SYSDATE - 1, 'Red Line', 'Approved', 3);
        DBMS_OUTPUT.PUT_LINE('Group Booking 1 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Group Booking 1 already exists or has invalid references. Skipping insertion...');
    END IF;

    -- Insert Group Booking 2
    SELECT COUNT(*) INTO user_exists FROM user_table WHERE user_id_pk = 2;
    SELECT COUNT(*) INTO booking_exists FROM group_booking WHERE user_id_fk = 2 AND booking_date = SYSDATE - 2;
    
    IF user_exists > 0 AND booking_exists = 0 THEN
        INSERT INTO group_booking (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk)
        VALUES (groupBooking_seq_pk.NEXTVAL, 2, 10, SYSDATE - 2, 'Green Line', 'Denied', 3);
        DBMS_OUTPUT.PUT_LINE('Group Booking 2 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Group Booking 2 already exists or has invalid references. Skipping insertion...');
    END IF;

    -- Insert Group Booking 3
    SELECT COUNT(*) INTO user_exists FROM user_table WHERE user_id_pk = 3;
    SELECT COUNT(*) INTO booking_exists FROM group_booking WHERE user_id_fk = 3 AND booking_date = SYSDATE - 3;
    
    IF user_exists > 0 AND booking_exists = 0 THEN
        INSERT INTO group_booking (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk)
        VALUES (groupBooking_seq_pk.NEXTVAL, 3, 7, SYSDATE - 3, 'Blue Line', 'Approved', 3);
        DBMS_OUTPUT.PUT_LINE('Group Booking 3 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Group Booking 3 already exists or has invalid references. Skipping insertion...');
    END IF;

    -- Continue similarly for other bookings
    -- Insert Group Booking 4
    SELECT COUNT(*) INTO user_exists FROM user_table WHERE user_id_pk = 4;
    SELECT COUNT(*) INTO booking_exists FROM group_booking WHERE user_id_fk = 4 AND booking_date = SYSDATE - 4;
    
    IF user_exists > 0 AND booking_exists = 0 THEN
        INSERT INTO group_booking (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk)
        VALUES (groupBooking_seq_pk.NEXTVAL, 4, 15, SYSDATE - 4, 'Orange Line', 'Pending', 3);
        DBMS_OUTPUT.PUT_LINE('Group Booking 4 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Group Booking 4 already exists or has invalid references. Skipping insertion...');
    END IF;

    -- Repeat similar checks and insertions for other bookings up to user_id_pk = 21
    -- Final example for Group Booking 10
    SELECT COUNT(*) INTO user_exists FROM user_table WHERE user_id_pk = 5;
    SELECT COUNT(*) INTO booking_exists FROM group_booking WHERE user_id_fk = 5 AND booking_date = SYSDATE - 10;
    
    IF user_exists > 0 AND booking_exists = 0 THEN
        INSERT INTO group_booking (group_booking_id_pk, user_id_fk, num_passengers, booking_date, transit_line, transaction_status, discounts_discount_id_pk)
        VALUES (groupBooking_seq_pk.NEXTVAL, 5, 14, SYSDATE - 10, 'Green Line', 'Approved', 3);
        DBMS_OUTPUT.PUT_LINE('Group Booking 10 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Group Booking 10 already exists or has invalid references. Skipping insertion...');
    END IF;
END;
/
