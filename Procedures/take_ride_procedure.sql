CREATE OR REPLACE PROCEDURE MBTA_ADMIN.take_ride(
    user_id IN NUMBER,
    ticket_id IN NUMBER
) AS
    ticket_price NUMBER;
BEGIN
    -- Validate the ticket using the function
    IF NOT validate_ticket(ticket_id, user_id) THEN
        DBMS_OUTPUT.PUT_LINE('Error: Ticket is not valid for a ride.');
        RETURN;
    END IF;

    -- Check if the ride exists using the function
    IF check_ride_exists(ticket_id, user_id) THEN
        DBMS_OUTPUT.PUT_LINE('Error: Ticket has already been used for a ride.');
        RETURN;
    END IF;

    -- Fetch the ticket price
    SELECT price
    INTO ticket_price
    FROM TICKET
    WHERE ticket_id_pk = ticket_id;

    -- Record the ride using the package
    ride_management_pkg.record_ride(user_id, ticket_id, ticket_price);

    -- Update the transaction table using the package
    ride_management_pkg.update_transaction_status(ticket_id, user_id);

    -- Update the ticket status
    UPDATE TICKET
    SET ticket_status = 'Used'
    WHERE ticket_id_pk = ticket_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Ride recorded successfully for User ID: ' || user_id || ' using Ticket ID: ' || ticket_id);
END;
/

BEGIN
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.validate_ticket TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.check_ride_exists TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.ride_management_pkg TO CUSTOMER_USER';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON MBTA_ADMIN.take_ride TO CUSTOMER_USER';
    DBMS_OUTPUT.PUT_LINE('Execute privileges granted to CUSTOMER_USER.');
END;
/