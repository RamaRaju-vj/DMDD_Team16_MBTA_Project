-- Create Group_Booking_Overview View
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'GROUP_BOOKING_OVERVIEW';

    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW GROUP_BOOKING_OVERVIEW';
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
    CREATE VIEW GROUP_BOOKING_OVERVIEW AS
    SELECT 
        gb.group_booking_id_pk AS booking_id,
        gb.num_passengers,
        gb.booking_date,
        gb.transit_line,
        gb.transaction_status AS booking_status
    FROM 
        MBTA_ADMIN.group_booking gb';
    DBMS_OUTPUT.PUT_LINE('Group_Booking_Overview view created successfully.');
END;
/
