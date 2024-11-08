SET SERVEROUTPUT ON;
-- Create DISCOUNTS table if it does not already exist using mbta admin
DECLARE
    table_count INTEGER;
BEGIN
    -- Check if the DISCOUNTS table exists
    SELECT COUNT(*) INTO table_count FROM all_tables WHERE table_name = 'DISCOUNTS';

    IF table_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE discounts (
                discount_id_pk INTEGER PRIMARY KEY,   -- Primary key for discounts
                discount_type VARCHAR2(50),           -- Type of discount (e.g., Student, Senior)
                discount_rate NUMBER(5,2)             -- Discount rate as a percentage
            )';
        DBMS_OUTPUT.PUT_LINE('Table "DISCOUNTS" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "DISCOUNTS" already exists. Skipping creation...');
    END IF;
END;
/




