-- exec as Subscription manager to view Subscription_Utilization

SET SERVEROUTPUT ON;

-- Subscription_Utilization View
DECLARE
    CURSOR cur_subscription_utilization IS 
        SELECT * FROM MBTA_ADMIN.Subscription_Utilization;
    rec_subscription cur_subscription_utilization%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Subscription_Utilization View ---');
    OPEN cur_subscription_utilization;
    LOOP
        FETCH cur_subscription_utilization INTO rec_subscription;
        EXIT WHEN cur_subscription_utilization%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Subscription ID: ' || rec_subscription.subscription_id || 
                             ', User ID: ' || rec_subscription.user_id || 
                             ', Subscription Type: ' || rec_subscription.subscription_type || 
                             ', Start Date: ' || rec_subscription.start_date || 
                             ', End Date: ' || rec_subscription.end_date || 
                             ', Subscription Status: ' || rec_subscription.subscription_status);
    END LOOP;
    CLOSE cur_subscription_utilization;
END;
/
