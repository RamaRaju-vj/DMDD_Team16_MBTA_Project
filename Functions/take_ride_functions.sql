CREATE OR REPLACE FUNCTION MBTA_ADMIN.validate_ticket(
    ticket_id NUMBER,
    user_id NUMBER
) RETURN BOOLEAN IS
    ticket_status VARCHAR2(50);
BEGIN
    SELECT ticket_status
    INTO ticket_status
    FROM TICKET
    WHERE ticket_id_pk = ticket_id AND user_id_fk = user_id;

    RETURN ticket_status = 'Valid';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/


CREATE OR REPLACE FUNCTION check_ride_exists(
    ticket_id IN NUMBER,
    user_id IN NUMBER
) RETURN BOOLEAN AS
    ride_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO ride_count
    FROM RIDES
    WHERE ticket_id_fk = ticket_id AND user_id_fk = user_id;

    RETURN ride_count > 0;
END;
/