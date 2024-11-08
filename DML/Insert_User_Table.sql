-- Insert 10 records into USER_TABLE using public synonym USR_TBL and sequence global_seq

DECLARE
    user_exists INTEGER;
BEGIN
    -- Insert User 1
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user1@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_1', 'password_1', 'user1@example.com', 'Senior', SYSDATE - 1, 2);
        DBMS_OUTPUT.PUT_LINE('User 1 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 1 already exists. Skipping insertion...');
    END IF;

    -- Insert User 2
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user2@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_2', 'password_2', 'user2@example.com', 'Student', SYSDATE - 2, 1);
        DBMS_OUTPUT.PUT_LINE('User 2 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 2 already exists. Skipping insertion...');
    END IF;

    -- Insert User 3
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user3@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_3', 'password_3', 'user3@example.com', 'Regular', SYSDATE - 3, 0);
        DBMS_OUTPUT.PUT_LINE('User 3 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 3 already exists. Skipping insertion...');
    END IF;

    -- Insert User 4
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user4@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_4', 'password_4', 'user4@example.com', 'Senior', SYSDATE - 4, 2);
        DBMS_OUTPUT.PUT_LINE('User 4 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 4 already exists. Skipping insertion...');
    END IF;

    -- Insert User 5
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user5@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_5', 'password_5', 'user5@example.com', 'Student', SYSDATE - 5, 1);
        DBMS_OUTPUT.PUT_LINE('User 5 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 5 already exists. Skipping insertion...');
    END IF;

    -- Insert User 6
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user6@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_6', 'password_6', 'user6@example.com', 'Regular', SYSDATE - 6, 0);
        DBMS_OUTPUT.PUT_LINE('User 6 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 6 already exists. Skipping insertion...');
    END IF;

    -- Insert User 7
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user7@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_7', 'password_7', 'user7@example.com', 'Senior', SYSDATE - 7, 2);
        DBMS_OUTPUT.PUT_LINE('User 7 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 7 already exists. Skipping insertion...');
    END IF;

    -- Insert User 8
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user8@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_8', 'password_8', 'user8@example.com', 'Student', SYSDATE - 8, 1);
        DBMS_OUTPUT.PUT_LINE('User 8 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 8 already exists. Skipping insertion...');
    END IF;

    -- Insert User 9
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user9@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_9', 'password_9', 'user9@example.com', 'Regular', SYSDATE - 9, 0);
        DBMS_OUTPUT.PUT_LINE('User 9 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 9 already exists. Skipping insertion...');
    END IF;

    -- Insert User 10
    SELECT COUNT(*) INTO user_exists FROM usr_tbl WHERE email_uniq = 'user10@example.com';
    IF user_exists = 0 THEN
        INSERT INTO usr_tbl (user_id_pk, username, password, email_uniq, user_category, created_at, discount_id_fk)
        VALUES (user_seq_pk.NEXTVAL, 'user_10', 'password_10', 'user10@example.com', 'Senior', SYSDATE - 10, 2);
        DBMS_OUTPUT.PUT_LINE('User 10 inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User 10 already exists. Skipping insertion...');
    END IF;
END;
/




