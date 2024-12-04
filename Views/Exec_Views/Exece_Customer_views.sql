SET SERVEROUTPUT ON;

-- Customer_Tickets View for a Specific Customer
DECLARE
    v_user_id NUMBER := 1; -- Replace with the specific user's ID
    CURSOR cur_customer_tickets IS 
        SELECT * 
        FROM MBTA_ADMIN.Customer_Tickets
        WHERE user_id = v_user_id;
    rec_customer_tickets cur_customer_tickets%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Customer_Tickets View for User ID: ' || v_user_id || ' ---');
    OPEN cur_customer_tickets;
    LOOP
        FETCH cur_customer_tickets INTO rec_customer_tickets;
        EXIT WHEN cur_customer_tickets%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Ticket ID: ' || rec_customer_tickets.ticket_id || 
                             ', Purchase Date: ' || rec_customer_tickets.purchase_date || 
                             ', Purchase Time: ' || rec_customer_tickets.purchase_time || 
                             ', Price: ' || rec_customer_tickets.price || 
                             ', Transit Line: ' || rec_customer_tickets.transit_line || 
                             ', Ticket Status: ' || rec_customer_tickets.ticket_status);
    END LOOP;
    CLOSE cur_customer_tickets;
END;
/



-- Customer_Subscriptions View for a Specific Customer
DECLARE
    v_user_id NUMBER := 1; -- Replace with the specific user's ID
    CURSOR cur_customer_subscriptions IS 
        SELECT * 
        FROM MBTA_ADMIN.Customer_Subscriptions
        WHERE user_id = v_user_id;
    rec_customer_subscriptions cur_customer_subscriptions%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Customer_Subscriptions View for User ID: ' || v_user_id || ' ---');
    OPEN cur_customer_subscriptions;
    LOOP
        FETCH cur_customer_subscriptions INTO rec_customer_subscriptions;
        EXIT WHEN cur_customer_subscriptions%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Subscription ID: ' || rec_customer_subscriptions.subscription_id || 
                             ', Subscription Type: ' || rec_customer_subscriptions.subscription_type || 
                             ', Start Date: ' || rec_customer_subscriptions.start_date || 
                             ', End Date: ' || rec_customer_subscriptions.end_date || 
                             ', Subscription Status: ' || rec_customer_subscriptions.subscription_status);
    END LOOP;
    CLOSE cur_customer_subscriptions;
END;
/
