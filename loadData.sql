-- Users Table
    -- user_id INTEGER NOT NULL,
    -- first_name VARCHAR2(100) NOT NULL,
    -- last_name VARCHAR2(100) NOT NULL,
    -- year_of_birth INTEGER,
    -- month_of_birth INTEGER,
    -- day_of_birth INTEGER,
    -- gender VARCHAR2(100),
    -- PRIMARY KEY (user_id)
INSERT INTO Users(user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender FROM project1.Public_User_Information;


-- Friends Table
    -- user1_id INTEGER NOT NULL,
    -- user2_id INTEGER NOT NULL,
    -- PRIMARY KEY (user1_id, user2_id),
    -- FOREIGN KEY (user1_id) REFERENCES Users (user_id),
    -- FOREIGN KEY (user2_id) REFERENCES Users (user_id)
INSERT INTO Friends(user1_id, user2_id) SELECT user1_id, user2_id FROM project1.Public_Are_Friends;

-- Cities 
    -- city_id INTEGER NOT NULL,
    -- city_name VARCHAR2(100) NOT NULL,
    -- state_name VARCHAR2(100) NOT NULL,
    -- country_name VARCHAR2(100) NOT NULL,
    -- PRIMARY KEY (city_id)
-- TODO: Couldn't figure out what to do with the city_id field
-- Probably should also add from the users table
INSERT INTO Cities(city_name, state_name, country_name)
SELECT DISTINCT event_city, event_state, event_country FROM project1.Public_Event_Information
UNION 
SELECT DISTINCT current_city, current_state, current_country FROM project1.Public_User_Information
UNION
SELECT DISTINCT hometown_city, hometown_state, hometown_country FROM project1.Public_User_Information;

-- User_Current_Cities
    -- user_id INTEGER NOT NULL,
    -- current_city_id INTEGER NOT NULL,
-- TODO: Not sure how to do this yet, need to figure out intersect as well as city_id for cities
INSERT INTO User_Current_Cities(user_id, current_city_id)
SELECT DISTINCT user_id, current_city, current_state, current_country FROM project1.Public_User_Information;


-- SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
-- FROM Orders
-- INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


-- City
-- project1.Public_User_Information
-- Join on current_city, current_state, current_country

-- User_Hometown_Cities
    -- user_id INTEGER NOT NULL,
    -- hometown_city_id INTEGER NOT NULL,
-- TODO: Not sure how to do this yet, need to figure out intersect as well as city_id for cities

-- Messages
    -- message_id INTEGER NOT NULL,
    -- sender_id INTEGER NOT NULL,
    -- receiver_id INTEGER NOT NULL,
    -- message_content VARCHAR2(2000) NOT NULL,
    -- sent_time TIMESTAMP NOT NULL,
-- TODO: There are no messages to insert
-- INSERT INTO Messages(message_id, sender_id, receiver_id, message_content)

-- Programs
    -- program_id INTEGER NOT NULL,
    -- institution VARCHAR2(100) NOT NULL,
    -- concentration VARCHAR2(100) NOT NULL,
    -- degree VARCHAR2(100) NOT NULL,
-- TODO: figure out program_id
-- INSERT INTO Programs(program_id, institution, concentration, degree)
-- SELECT DISTINCT ____, institution_name, program_concentration, program_degree FROM project1.Public_User_Information

-- Education
    -- user_id INTEGER NOT NULL,
    -- program_id INTEGER NOT NULL,
    -- program_year INTEGER NOT NULL,
-- TODO: Figure out how iintersect works
-- INSERT INTO Education(user_id, institution, program_year)
-- SELECT DISTINCT 