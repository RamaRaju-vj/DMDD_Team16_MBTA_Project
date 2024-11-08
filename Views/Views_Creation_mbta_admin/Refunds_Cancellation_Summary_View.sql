-- Create Refunds_Cancellation_Summary View
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'REFUNDS_CANCELLATION_SUMMARY';

    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW REFUNDS_CANCELLATION_SUMMARY';
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
    CREATE VIEW REFUNDS_CANCELLATION_SUMMARY AS
    SELECT 
        t.transaction_id_pk AS transaction_id,
        t.ticket_id_fk AS ticket_id,
        t.amount AS refunded_amount,
        t.refund_status,
        t.transaction_date
    FROM 
        MBTA_ADMIN.transaction_table t
    WHERE 
        t.refund_status = ''Refunded'' OR t.transaction_status = ''Cancelled''';
    DBMS_OUTPUT.PUT_LINE('Refunds_Cancellation_Summary view created successfully.');
END;
/