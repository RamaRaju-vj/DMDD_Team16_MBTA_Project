-- Create Ticket_Sales_By_Line_Category View
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'TICKET_SALES_BY_LINE_CATEGORY';

    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW TICKET_SALES_BY_LINE_CATEGORY';
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
    CREATE VIEW TICKET_SALES_BY_LINE_CATEGORY AS
    SELECT 
        t.transit_line,
        u.user_category,
        COUNT(t.ticket_id_pk) AS ticket_count
    FROM 
        MBTA_ADMIN.ticket t
        JOIN MBTA_ADMIN.user_table u ON t.user_id_fk = u.user_id_pk
    GROUP BY 
        t.transit_line, u.user_category';
    DBMS_OUTPUT.PUT_LINE('Ticket_Sales_By_Line_Category view created successfully.');
END;
/