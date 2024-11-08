-- Create Customer_Summary View
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'CUSTOMER_SUMMARY';

    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW CUSTOMER_SUMMARY';
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
    CREATE VIEW CUSTOMER_SUMMARY AS
    SELECT 
        u.user_id_pk AS user_id,
        u.username,
        u.user_category,
        SUM(r.total_spend) AS total_spend,
        s.subscription_status
    FROM 
        MBTA_ADMIN.user_table u
        LEFT JOIN MBTA_ADMIN.rides r ON u.user_id_pk = r.user_id_fk
        LEFT JOIN MBTA_ADMIN.subscription s ON u.user_id_pk = s.user_id_fk
    GROUP BY 
        u.user_id_pk, u.username, u.user_category, s.subscription_status';
    DBMS_OUTPUT.PUT_LINE('Customer_Summary view created successfully.');
END;
/
