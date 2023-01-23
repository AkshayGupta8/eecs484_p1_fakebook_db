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