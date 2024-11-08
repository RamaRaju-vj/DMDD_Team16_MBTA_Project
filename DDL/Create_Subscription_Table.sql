SET SERVEROUTPUT ON;

-- Create SUBSCRIPTION table if it does not already exist using mbta admin
DECLARE
    table_count INTEGER;
BEGIN
    -- Check if the table exists
    SELECT COUNT(*) INTO table_count FROM all_tables WHERE table_name = 'SUBSCRIPTION';

    IF table_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE subscription (
                subscription_id_pk INTEGER PRIMARY KEY, -- Primary key for subscriptions
                user_id_fk INTEGER,                    -- Foreign key reference to user_table
                subscription_type VARCHAR2(50),        -- Type of subscription (e.g., Monthly, Yearly)
                start_date DATE,                       -- Start date of the subscription
                end_date DATE,                         -- End date of the subscription
                subscription_status VARCHAR2(50),      -- Status of the subscription (e.g., Active, Expired)
                CONSTRAINT fk_user_id_subscription FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk)
            )';
        DBMS_OUTPUT.PUT_LINE('Table "SUBSCRIPTION" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "SUBSCRIPTION" already exists. Skipping creation...');
    END IF;
END;
/



