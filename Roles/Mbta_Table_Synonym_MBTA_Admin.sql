SET SERVEROUTPUT ON;
-- Create Public Synonyms if they do not exist using mbta admin
DECLARE
    synonym_count INTEGER;
BEGIN
    -- Synonym for user_table
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'USR_TBL' AND owner = 'PUBLIC';
    IF synonym_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM usr_tbl FOR MBTA_ADMIN.user_table';
        DBMS_OUTPUT.PUT_LINE('Public synonym "USR_TBL" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Public synonym "USR_TBL" already exists. Skipping creation...');
    END IF;




    -- Synonym for discounts
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'DISC' AND owner = 'PUBLIC';
    IF synonym_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM disc FOR MBTA_ADMIN.discounts';
        DBMS_OUTPUT.PUT_LINE('Public synonym "DISC" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Public synonym "DISC" already exists. Skipping creation...');
    END IF;




    -- Synonym for ticket
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'TKT' AND owner = 'PUBLIC';
    IF synonym_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM tkt FOR MBTA_ADMIN.ticket';
        DBMS_OUTPUT.PUT_LINE('Public synonym "TKT" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Public synonym "TKT" already exists. Skipping creation...');
    END IF;




    -- Synonym for transaction_table
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'TXN_TBL' AND owner = 'PUBLIC';
    IF synonym_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM txn_tbl FOR MBTA_ADMIN.transaction_table';
        DBMS_OUTPUT.PUT_LINE('Public synonym "TXN_TBL" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Public synonym "TXN_TBL" already exists. Skipping creation...');
    END IF;



    -- Synonym for rides
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'RDS' AND owner = 'PUBLIC';
    IF synonym_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM rds FOR MBTA_ADMIN.rides';
        DBMS_OUTPUT.PUT_LINE('Public synonym "RDS" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Public synonym "RDS" already exists. Skipping creation...');
    END IF;



    -- Synonym for subscription
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'SUBS' AND owner = 'PUBLIC';
    IF synonym_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM subs FOR MBTA_ADMIN.subscription';
        DBMS_OUTPUT.PUT_LINE('Public synonym "SUBS" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Public synonym "SUBS" already exists. Skipping creation...');
    END IF;



    -- Synonym for group_booking
    SELECT COUNT(*) INTO synonym_count FROM all_synonyms WHERE synonym_name = 'GRP_BKG' AND owner = 'PUBLIC';
    IF synonym_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE PUBLIC SYNONYM grp_bkg FOR MBTA_ADMIN.group_booking';
        DBMS_OUTPUT.PUT_LINE('Public synonym "GRP_BKG" created successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Public synonym "GRP_BKG" already exists. Skipping creation...');
    END IF;
END;
/