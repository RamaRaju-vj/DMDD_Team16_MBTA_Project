# DMDD_Team16_MBTA_Project.


> [!IMPORTANT]  
> Please Go through the documentation uploaded in the canvas for detailed instructions and ignore the readme file as it will be updated after phase 3 review .


DMDD Phase 3 Team16
Step 1: Create MBTA_Admin user using oracle admin File Name: Roles/Mbta_Admin_User_Creation_1.sql

Login to Mbta_admin and then start creating tables
Step 2(DDL) : Create Tables in the order mentioned using MBTA_Admin to avoid foreign Key constraints
- Discount Table script: DDL/Create_Discounts_Table.sql
 
 - User Table Script: DDL/Create_User_Table.sql as mbta admin
 - Group Booking table script: DDL/Create_Group_Booking_Table.sql as mbta admin

 - Rides Table script: DDL/ Create_Rides_Table.sql using mbta_admin
- subcription table: DDL/ Create_Subscription_Table.sql using mbta_admin
 
 - DDL/Create_Ticket_Table.sql using mbta_admin
 - DDL/ Create_Transaction_Table.sql using mbta_admin

 Step 3 : Execute sequence function only once to generate primary key for each table when insertion happens (use mbta admin)
File path: Functions/ Func_Sequence_PK.sql
 Step 4: CREATE Synonym for all the tables using mbta admin

File Path: Roles/Mbta_Table_Synonym_MBTA_Admin.sql
 STEP 5(DML): Insert Data Into Tables using mbta admin *** Insert data in the order mentioned
- File Path: DML/ Insert_Discount_Table.sql:
 - File Path: DML/ Insert_User_Table.sql

 - File Path: DML/ Insert_Ticket_Table.sql
 - File Path: DML/ Insert_Transcation_Table.sql

 - File Path: DML/ Insert_Group_Bookings_Table.sql
 - File Path: DML/ Insert_Rides_Table.sql
 
File Path: DML/ Insert_Subscription_Table.sql

Step 6: Drop users and roles
File Path: Role/ Drop_User_Creation_and_Grant_Roles.sql

 Step 7: Create Users and Roles (login as mbta admin)
File Path: Role/ User_Creation_and_Grant_Roles.sql
 
Step 8: Create Views (Login as Mbta admin) (exec all views as admin) File Path : Views/Views_Creation_mbta_admin/

Step 9: Execute VIEWS related permissions (LOGIN AS MBTA ADMIN)
File Path: Role/ Views_permission_mbta_admin.sql

Step 10:Execute the Functions
Step 11:Execute the Packages
Step 12: Execute the Procedure
