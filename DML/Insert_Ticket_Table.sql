SET SERVEROUTPUT ON;

-- Insert data into TICKET table using global_seq_pk sequence for primary key
DECLARE
    ticket_exists INTEGER;
BEGIN
    -- Insert Ticket 1
    SELECT COUNT(*) INTO ticket_exists FROM ticket WHERE user_id_fk = 1 AND purchase_date = SYSDATE - 1;
    IF ticket_exists = 0 THEN
        INSERT INTO ticket (ticket_id_pk, user_id_fk, purchase_date, price, transit_line, ticket_status)
        VALUES (ticket_seq_pk.NEXTVAL, 1, SYSDATE - 1, 2.40, 'Red Line', 'Valid');
        DBMS_OUTPUT.PUT_LINE('Ticket 1 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ticket 1 already exists. Skipping insertion...');
    END IF;

    -- Insert Ticket 2
    SELECT COUNT(*) INTO ticket_exists FROM ticket WHERE user_id_fk = 2 AND purchase_date = SYSDATE - 2;
    IF ticket_exists = 0 THEN
        INSERT INTO ticket (ticket_id_pk, user_id_fk, purchase_date, price, transit_line, ticket_status)
        VALUES (ticket_seq_pk.NEXTVAL, 2, SYSDATE - 2, 2.40, 'Green Line', 'Cancelled');
        DBMS_OUTPUT.PUT_LINE('Ticket 2 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ticket 2 already exists. Skipping insertion...');
    END IF;

    -- Insert Ticket 3
    SELECT COUNT(*) INTO ticket_exists FROM ticket WHERE user_id_fk = 3 AND purchase_date = SYSDATE - 3;
    IF ticket_exists = 0 THEN
        INSERT INTO ticket (ticket_id_pk, user_id_fk, purchase_date, price, transit_line, ticket_status)
        VALUES (ticket_seq_pk.NEXTVAL, 3, SYSDATE - 3, 2.40, 'Blue Line', 'Valid');
        DBMS_OUTPUT.PUT_LINE('Ticket 3 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ticket 3 already exists. Skipping insertion...');
    END IF;

    -- Insert Ticket 4
    SELECT COUNT(*) INTO ticket_exists FROM ticket WHERE user_id_fk = 4 AND purchase_date = SYSDATE - 4;
    IF ticket_exists = 0 THEN
        INSERT INTO ticket (ticket_id_pk, user_id_fk, purchase_date, price, transit_line, ticket_status)
        VALUES (ticket_seq_pk.NEXTVAL, 4, SYSDATE - 4, 2.40, 'Orange Line', 'Valid');
        DBMS_OUTPUT.PUT_LINE('Ticket 4 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ticket 4 already exists. Skipping insertion...');
    END IF;

    -- Insert Ticket 5
    SELECT COUNT(*) INTO ticket_exists FROM ticket WHERE user_id_fk = 5 AND purchase_date = SYSDATE - 5;
    IF ticket_exists = 0 THEN
        INSERT INTO ticket (ticket_id_pk, user_id_fk, purchase_date, price, transit_line, ticket_status)
        VALUES (ticket_seq_pk.NEXTVAL, 5, SYSDATE - 5, 2.40, 'Green Line', 'Cancelled');
        DBMS_OUTPUT.PUT_LINE('Ticket 5 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ticket 5 already exists. Skipping insertion...');
    END IF;

END;
/
