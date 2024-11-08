SET SERVEROUTPUT ON;

-- Create RIDES table if it does not already exist
DECLARE
    table_count INTEGER;
BEGIN
    -- Check if the table exists
    SELECT COUNT(*) INTO table_count FROM all_tables WHERE table_name = 'RIDES';

    IF table_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE rides (
                ride_id INTEGER PRIMARY KEY,          -- Primary key for rides
                user_id_fk INTEGER,                   -- Foreign key reference to user_table
                ride_timestamp DATE,                  -- Timestamp of the ride
                total_spend INTEGER,                  -- Total amount spent on the ride
                CONSTRAINT fk_user_id_rides FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk)
            )';
        DBMS_OUTPUT.PUT_LINE('Table "RIDES" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "RIDES" already exists. Skipping creation...');
    END IF;
END;
/








