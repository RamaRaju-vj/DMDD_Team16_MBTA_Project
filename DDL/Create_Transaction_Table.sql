SET SERVEROUTPUT ON;
-- Create TRANSACTION_TABLE if it does not already exist
DECLARE
    table_count INTEGER;
BEGIN
    -- Check if the table exists
    SELECT COUNT(*) INTO table_count FROM all_tables WHERE table_name = 'TRANSACTION_TABLE';

    IF table_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE transaction_table (
                transaction_id_pk INTEGER PRIMARY KEY,                -- Primary key for transactions
                ticket_id_fk INTEGER,                                 -- Foreign key reference to ticket table
                transaction_status VARCHAR2(50),                      -- Status of the transaction (e.g., Completed, Pending)
                amount NUMBER(3,2),                                   -- Transaction amount with 2 decimal places
                transaction_date DATE,                                -- Date of the transaction
                refund_status VARCHAR2(50),                           -- Refund status (e.g., Refunded, Not Refunded)
                refund_request VARCHAR2(50),                          -- Tracks if a refund is requested (e.g., Requested, Not Requested)
                user_id_fk INTEGER,                                   -- Foreign key reference to user_table
                CONSTRAINT fk_ticket_id FOREIGN KEY (ticket_id_fk) REFERENCES ticket(ticket_id_pk),
                CONSTRAINT fk_user_id FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk)
            )';
        DBMS_OUTPUT.PUT_LINE('Table "TRANSACTION_TABLE" created successfully with refund_request column.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "TRANSACTION_TABLE" already exists. Skipping creation...');
    END IF;
END;
/
