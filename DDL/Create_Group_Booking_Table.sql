SET SERVEROUTPUT ON;

-- Create GROUP_BOOKING table if it does not already exist using mbta admin
DECLARE
    table_count INTEGER;
BEGIN
    -- Check if the table exists
    SELECT COUNT(*) INTO table_count FROM all_tables WHERE table_name = 'GROUP_BOOKING';

    IF table_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE group_booking (
                group_booking_id_pk INTEGER PRIMARY KEY, -- Primary key for group bookings
                user_id_fk INTEGER,                      -- Foreign key reference to user_table
                num_passengers INTEGER,                  -- Number of passengers in the group
                booking_date DATE,                       -- Date of the booking
                transit_line VARCHAR2(50),               -- Name of the transit line for group booking
                transaction_status VARCHAR2(55),         -- Status of the transaction (e.g., Approved, Denied)
                discounts_discount_id_pk INTEGER,        -- Foreign key reference to discounts table
                CONSTRAINT fk_user_id_group_booking FOREIGN KEY (user_id_fk) REFERENCES user_table(user_id_pk),
                CONSTRAINT fk_discount_id_group_booking FOREIGN KEY (discounts_discount_id_pk) REFERENCES discounts(discount_id_pk)
            )';
        DBMS_OUTPUT.PUT_LINE('Table "GROUP_BOOKING" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "GROUP_BOOKING" already exists. Skipping creation...');
    END IF;
END;
/
