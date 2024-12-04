CREATE OR REPLACE PACKAGE MBTA_ADMIN.ride_management_pkg IS
    PROCEDURE record_ride(
        user_id IN NUMBER,
        ticket_id IN NUMBER,
        ticket_price IN NUMBER
    );

    PROCEDURE update_transaction_status(
        ticket_id IN NUMBER,
        user_id IN NUMBER
    );
END ride_management_pkg;
/

CREATE OR REPLACE PACKAGE BODY MBTA_ADMIN.ride_management_pkg IS
    PROCEDURE record_ride(
        user_id IN NUMBER,
        ticket_id IN NUMBER,
        ticket_price IN NUMBER
    ) IS
    BEGIN
        INSERT INTO RIDES (ride_id, user_id_fk, ride_timestamp, ticket_id_fk, total_spend)
        VALUES (RIDES_SEQ_PK.NEXTVAL, user_id, SYSTIMESTAMP, ticket_id, ticket_price);
    END record_ride;

    PROCEDURE update_transaction_status(
        ticket_id IN NUMBER,
        user_id IN NUMBER
    ) IS
    BEGIN
        UPDATE TRANSACTION_TABLE
        SET refund_status = 'Not Eligible',
            refund_request = 'Not Eligible'
        WHERE ticket_id_fk = ticket_id AND user_id_fk = user_id;

        COMMIT;
    END update_transaction_status;
END ride_management_pkg;
/