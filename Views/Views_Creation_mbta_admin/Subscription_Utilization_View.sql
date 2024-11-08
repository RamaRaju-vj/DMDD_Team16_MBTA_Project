-- Create Subscription_Utilization View
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'SUBSCRIPTION_UTILIZATION';

    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW SUBSCRIPTION_UTILIZATION';
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
    CREATE VIEW SUBSCRIPTION_UTILIZATION AS
    SELECT 
        s.subscription_id_pk AS subscription_id,
        s.user_id_fk AS user_id,
        s.subscription_type,
        s.start_date,
        s.end_date,
        s.subscription_status
    FROM 
        MBTA_ADMIN.subscription s';
    DBMS_OUTPUT.PUT_LINE('Subscription_Utilization view created successfully.');
END;
/
