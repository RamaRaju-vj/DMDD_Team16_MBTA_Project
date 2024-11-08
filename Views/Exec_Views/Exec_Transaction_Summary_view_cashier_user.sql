-- exec as cashier user to view Transaction_Summary & Refunds_Cancellation_Summary

SET SERVEROUTPUT ON;

-- Transaction_Summary View
DECLARE
    CURSOR cur_transaction_summary IS 
        SELECT * FROM MBTA_ADMIN.Transaction_Summary;
    rec_transaction_summary cur_transaction_summary%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Transaction_Summary View ---');
    OPEN cur_transaction_summary;
    LOOP
        FETCH cur_transaction_summary INTO rec_transaction_summary;
        EXIT WHEN cur_transaction_summary%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || rec_transaction_summary.transaction_id || 
                             ', Ticket ID: ' || rec_transaction_summary.ticket_id || 
                             ', Transaction Status: ' || rec_transaction_summary.transaction_status || 
                             ', Amount: ' || rec_transaction_summary.amount || 
                             ', Transaction Date: ' || rec_transaction_summary.transaction_date || 
                             ', Refund Status: ' || rec_transaction_summary.refund_status || 
                             ', Refund Request: ' || rec_transaction_summary.refund_request || 
                             ', User ID: ' || rec_transaction_summary.user_id);
    END LOOP;
    CLOSE cur_transaction_summary;
END;
/

-- Refunds_Cancellation_Summary View
DECLARE
    CURSOR cur_refunds_cancellation IS 
        SELECT * FROM MBTA_ADMIN.Refunds_Cancellation_Summary;
    rec_refunds_cancellation cur_refunds_cancellation%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Refunds_Cancellation_Summary View ---');
    OPEN cur_refunds_cancellation;
    LOOP
        FETCH cur_refunds_cancellation INTO rec_refunds_cancellation;
        EXIT WHEN cur_refunds_cancellation%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || rec_refunds_cancellation.transaction_id || 
                             ', Ticket ID: ' || rec_refunds_cancellation.ticket_id || 
                             ', Refunded Amount: ' || rec_refunds_cancellation.refunded_amount || 
                             ', Refund Status: ' || rec_refunds_cancellation.refund_status || 
                             ', Transaction Date: ' || rec_refunds_cancellation.transaction_date);
    END LOOP;
    CLOSE cur_refunds_cancellation;
END;
/
