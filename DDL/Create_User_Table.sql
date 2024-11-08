SET SERVEROUTPUT ON;
-------------------------------------------------------------------------------------------------------------------------------------
-- Create USER_TABLE if it does not already exist using mbta_admin
DECLARE
    table_count INTEGER;
BEGIN
    -- Check if the table exists
    SELECT COUNT(*) INTO table_count FROM all_tables WHERE table_name = 'USER_TABLE';

    IF table_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE user_table (
                user_id_pk INTEGER PRIMARY KEY,       -- Primary key for users
                username VARCHAR2(55),                -- Username of the user
                password VARCHAR2(55),                -- Password of the user
                email_uniq VARCHAR2(100) UNIQUE,      -- Unique email of the user
                user_category VARCHAR2(55),           -- Category of the user (e.g., Admin, Customer)
                created_at DATE,                      -- Date the user was created
                discount_id_fk INTEGER,                -- Foreign key reference to discounts table (to be added later)
                CONSTRAINT discount_id_fk FOREIGN KEY (discount_id_fk) REFERENCES discounts(discount_id_pk)
            )';
        DBMS_OUTPUT.PUT_LINE('Table "USER_TABLE" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "USER_TABLE" already exists. Skipping creation...');
    END IF;
END;
/

