SET SERVEROUTPUT ON;
-- Grant Permissions on Views Based on Target Users
BEGIN
    -- Grant SELECT on Customer_Summary to ADMIN_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Customer_Summary TO ADMIN_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Customer_Summary to ADMIN_ROLE.');

    -- Grant SELECT on Group_Booking_Overview to GROUP_BOOKING_MANAGER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Group_Booking_Overview TO GROUP_BOOKING_MANAGER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Group_Booking_Overview to GROUP_BOOKING_MANAGER_ROLE.');

    -- Grant SELECT on Subscription_Utilization to ADMIN_ROLE and SUBSCRIPTION_MANAGER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Subscription_Utilization TO ADMIN_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Subscription_Utilization to ADMIN_ROLE.');
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Subscription_Utilization TO SUBSCRIPTION_MANAGER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Subscription_Utilization to SUBSCRIPTION_MANAGER_ROLE.');

    -- Grant SELECT on Transaction_Summary to ADMIN_ROLE and CASHIER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Transaction_Summary TO ADMIN_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Transaction_Summary to ADMIN_ROLE.');
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Transaction_Summary TO CASHIER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Transaction_Summary to CASHIER_ROLE.');

    -- Grant SELECT on Ticket_Sales_By_Line_Category to ADMIN_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Ticket_Sales_By_Line_Category TO ADMIN_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Ticket_Sales_By_Line_Category to ADMIN_ROLE.');

    -- Grant SELECT on Refunds_Cancellation_Summary to CASHIER_ROLE and ADMIN_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Refunds_Cancellation_Summary TO CASHIER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Refunds_Cancellation_Summary to CASHIER_ROLE.');
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Refunds_Cancellation_Summary TO ADMIN_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Refunds_Cancellation_Summary to ADMIN_ROLE.');

    -- Grant SELECT on Customer_Tickets to CUSTOMER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Customer_Tickets TO CUSTOMER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Customer_Tickets to CUSTOMER_ROLE.');

    -- Grant SELECT on Customer_Subscriptions to CUSTOMER_ROLE
    EXECUTE IMMEDIATE 'GRANT SELECT ON MBTA_ADMIN.Customer_Subscriptions TO CUSTOMER_ROLE';
    DBMS_OUTPUT.PUT_LINE('Granted SELECT on Customer_Subscriptions to CUSTOMER_ROLE.');
END;
/
