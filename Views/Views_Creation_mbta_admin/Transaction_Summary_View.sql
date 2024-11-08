-- Create Transaction_Summary View
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'TRANSACTION_SUMMARY';

    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW TRANSACTION_SUMMARY';
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
    CREATE VIEW TRANSACTION_SUMMARY AS
    SELECT 
        t.transaction_id_pk AS transaction_id,
        t.ticket_id_fk AS ticket_id,
        t.transaction_status,
        t.amount,
        t.transaction_date,
        t.refund_status,
        t.refund_request,
        t.user_id_fk AS user_id
    FROM 
        MBTA_ADMIN.transaction_table t';
    DBMS_OUTPUT.PUT_LINE('Transaction_Summary view created successfully.');
END;
/