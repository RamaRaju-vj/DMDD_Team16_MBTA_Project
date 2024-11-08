SET SERVEROUTPUT ON;

-- Create TICKET table if it does not already exist
DECLARE
    table_count INTEGER;
BEGIN
    -- Check if the table exists
    SELECT COUNT(*) INTO table_count FROM all_tables WHERE table_name = 'TICKET';

    IF table_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE ticket (
                ticket_id_pk INTEGER PRIMARY KEY,       -- Primary key for tickets
                user_id_fk INTEGER,                    -- Foreign key reference to user_table
                purchase_date DATE,                    -- Date of ticket purchase
                price NUMBER(5,2),                     -- Price of the ticket with 2 decimal places
                transit_line VARCHAR2(50),             -- Name of the transit line
                ticket_status VARCHAR2(55),            -- Status of the ticket (e.g., Valid, Cancelled)
                CONSTRAINT fk_user_id_ticket FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk)
            )';
        DBMS_OUTPUT.PUT_LINE('Table "TICKET" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "TICKET" already exists. Skipping creation...');
    END IF;
END;
/







