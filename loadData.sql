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
-- INSERT INTO Cities(city_id, city_name, state_name, country_name) 
-- SELECT DISTINCT event_city, event_state, event_country FROM project1.Public_Event_Information

-- User_Current_Cities
    -- user_id INTEGER NOT NULL,
    -- current_city_id INTEGER NOT NULL,
-- TODO: Not sure how to do this yet, need to figure out inner join as well as city_id for cities

