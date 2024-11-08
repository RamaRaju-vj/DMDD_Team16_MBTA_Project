SET SERVEROUTPUT ON;

-- Insert required records into the DISCOUNTS table to satisfy foreign key constraints in GROUP_BOOKING
DECLARE
    discount_exists INTEGER;
BEGIN
    -- Insert discount with discount_id_pk = 0 (Regular)
    SELECT COUNT(*) INTO discount_exists FROM discounts WHERE discount_id_pk = 0;
    IF discount_exists = 0 THEN
        INSERT INTO discounts (discount_id_pk, discount_type, discount_rate)
        VALUES (0, 'Regular', 0);
        DBMS_OUTPUT.PUT_LINE('Discount "Regular" with ID 0 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Discount "Regular" with ID 0 already exists.');
    END IF;

    -- Insert discount with discount_id_pk = 1 (Student)
    SELECT COUNT(*) INTO discount_exists FROM discounts WHERE discount_id_pk = 1;
    IF discount_exists = 0 THEN
        INSERT INTO discounts (discount_id_pk, discount_type, discount_rate)
        VALUES (1, 'Student', 5.00);
        DBMS_OUTPUT.PUT_LINE('Discount "Student" with ID 1 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Discount "Student" with ID 1 already exists.');
    END IF;

    -- Insert discount with discount_id_pk = 2 (Senior)
    SELECT COUNT(*) INTO discount_exists FROM discounts WHERE discount_id_pk = 2;
    IF discount_exists = 0 THEN
        INSERT INTO discounts (discount_id_pk, discount_type, discount_rate)
        VALUES (2, 'Senior', 10.00);
        DBMS_OUTPUT.PUT_LINE('Discount "Senior" with ID 2 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Discount "Senior" with ID 2 already exists.');
    END IF;

    -- Insert discount with discount_id_pk = 3 (Group)
    SELECT COUNT(*) INTO discount_exists FROM discounts WHERE discount_id_pk = 3;
    IF discount_exists = 0 THEN
        INSERT INTO discounts (discount_id_pk, discount_type, discount_rate)
        VALUES (3, 'Group', 5.00);
        DBMS_OUTPUT.PUT_LINE('Discount "Group" with ID 3 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Discount "Group" with ID 3 already exists.');
    END IF;
END;
/

