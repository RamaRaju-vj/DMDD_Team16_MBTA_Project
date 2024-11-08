-- exec as group booking manager

SET SERVEROUTPUT ON;

-- Group_Booking_Overview View
DECLARE
    CURSOR cur_group_booking IS 
        SELECT * FROM MBTA_ADMIN.Group_Booking_Overview;
    rec_group_booking cur_group_booking%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Group_Booking_Overview View ---');
    OPEN cur_group_booking;
    LOOP
        FETCH cur_group_booking INTO rec_group_booking;
        EXIT WHEN cur_group_booking%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Booking ID: ' || rec_group_booking.booking_id || 
                             ', Number of Passengers: ' || rec_group_booking.num_passengers || 
                             ', Booking Date: ' || rec_group_booking.booking_date || 
                             ', Transit Line: ' || rec_group_booking.transit_line || 
                             ', Booking Status: ' || rec_group_booking.booking_status);
    END LOOP;
    CLOSE cur_group_booking;
END;
/
