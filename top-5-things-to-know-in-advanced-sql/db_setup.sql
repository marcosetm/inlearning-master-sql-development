-- PostgreSQL version
-- Add Primary Key Constraints

--- SET PK FOR ONLINE RETAIL SALES
-- First, set types and Make cols Non-Nullable
ALTER TABLE online_retail_sales
ALTER COLUMN order_num TYPE decimal,
ALTER COLUMN order_num SET NOT NULL;

-- Identify OrderNum as the Primary Key of this table
ALTER TABLE online_retail_sales ADD PRIMARY KEY (order_num); 

--- SET PK FOR SESSION INFO 
-- First, set types and Make cols Non-Nullable
ALTER TABLE conference_session_info
ALTER COLUMN start_date TYPE datetime,
ALTER COLUMN start_date SET NOT NULL;

ALTER TABLE conference_session_info
ALTER COLUMN end_date TYPE datetime,
ALTER COLUMN end_date SET NOT NULL;

ALTER TABLE conference_session_info
ALTER COLUMN session_name TYPE nvarchar(255),
ALTER COLUMN session_name SET NOT NULL;

-- Identify Start Date, End Date, and Session name as the Primary Key of this table
ALTER TABLE conference_session_info ADD PRIMARY KEY (start_date, end_date, session_name) 

--- SET PK FOR SPEAKER INFO
-- First, set types and Make cols Non-Nullable
ALTER TABLE speaker_info
ALTER COLUMN name SET varchar(255),
ALTER COLUMN name SET NOT NULL;

ALTER TABLE speaker_info
ALTER COLUMN session_name TYPE varchar(255),
ALTER COLUMN session_name SET NOT NULL;


-- Identify Name and Session Name as the Primary Key of this table
-- Some session topics are duplicates of each other but they are delivered by different speakers
ALTER TABLE speaker_info ADD PRIMARY KEY (name, session_name);

--- SET PK FOR CONFERENCE ATTENDEES
-- First, set types and Make cols Non-Nullable
ALTER TABLE convention_attendees
ALTER COLUMN email TYPE varchar(255),
ALTER COLUMN email SET NOT NULL;

-- Identify Email as the Primary Key of this table
ALTER TABLE convention_attendees ADD PRIMARY KEY (email);

--- SET PK FOR INVENTORY
-- First, set types and Make cols Non-Nullable
ALTER TABLE inventory
ALTER COLUMN prod_number TYPE varchar(255),
ALTER COLUMN prod_number set NOT NULL;

ALTER TABLE inventory
ALTER COLUMN prod_name TYPE varchar(255) ,
ALTER COLUMN prod_name SET NOT NULL;

-- Identify ProdNumber and prod_name as the composite Primary Key of this table
ALTER TABLE inventory ADD PRIMARY KEY (prod_number,prod_name);

--- SET PK FOR EMPLOYEE DIRECTORY
-- First, set types and Make cols Non-Nullable
ALTER TABLE employee_directory
ALTER COLUMN employee_id TYPE nvarchar(255),
ALTER COLUMN employee_id SET NOT NULL;

-- Identify employee_id as the composite Primary Key of this table
ALTER TABLE employee_directory ADD PRIMARY KEY (employee_id);