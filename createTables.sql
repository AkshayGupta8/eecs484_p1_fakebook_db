CREATE TABLE Users (
    user_id INTEGER NOT NULL,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    year_of_birth INTEGER,
    month_of_birth INTEGER,
    day_of_birth INTEGER,
    gender VARCHAR2(100),
    PRIMARY KEY (user_id)
);

-- -- done
-- CREATE TABLE Friends(
--     user1_id INTEGER NOT NULL,
--     user2_id INTEGER NOT NULL,
--     FOREIGN KEY (user1_id) REFERENCES Users (user_id)
--     FOREIGN KEY (user2_id) REFERENCES Users (user_id)
    
--     -- friends trigger constraint
--     PRIMARY KEY (user1_id, user2_id)
-- );

-- done
CREATE TABLE Cities(
    city_id INTEGER NOT NULL,
    city_name VARCHAR2(100) NOT NULL,
    state_name VARCHAR2(100) NOT NULL,
    country_name VARCHAR2(100) NOT NULL,
    PRIMARY KEY (city_id)
);

-- done
CREATE TABLE User_Current_Cities(
    user_id INTEGER NOT NULL,
    current_city_id INTEGER NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
    FOREIGN KEY (current_city_id) REFERENCES Cities (city_id)
);

-- done
CREATE TABLE User_Hometown_Cities(
    user_id INTEGER NOT NULL,
    hometown_city_id INTEGER NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
    FOREIGN KEY (hometown_city_id) REFERENCES Cities(city_id)
);

-- done
CREATE TABLE Messages(
    message_id INTEGER NOT NULL,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    message_content VARCHAR2(2000) NOT NULL,
    sent_time TIMESTAMP NOT NULL,
    PRIMARY KEY (message_id),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

-- done
CREATE TABLE Programs(
    program_id INTEGER NOT NULL,
    institution VARCHAR2(100) NOT NULL,
    concentration VARCHAR2(100) NOT NULL,
    degree VARCHAR2(100) NOT NULL,
    UNIQUE (institution, concentration, degree)
    PRIMARY KEY (program_id)
);

-- done
CREATE TABLE Education(
    user_id INTEGER NOT NULL,
    program_id INTEGER NOT NULL,
    program_year INTEGER NOT NULL,
    PRIMARY KEY (user_id, program_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- TODO
CREATE TABLE User_Events(
    event_id INTEGER NOT NULL,
    event_creator_id INTEGER NOT NULL,
    event_name VARCHAR2(100) NOT NULL,
    event_tagline VARCHAR2(100),
    event_description VARCHAR2(100),
    event_host VARCHAR2(100),
    event_type VARCHAR2(100),
    event_subtype VARCHAR2(100),
    event_address VARCHAR2(2000),
    event_city_id INTEGER NOT NULL,
    event_start_time TIMESTAMP,
    event_end_time TIMESTAMP,
    PRIMARY KEY (event_id),
    FOREIGN KEY (event_creator_id) REFERENCES Users(user_id)
);

-- TODO
CREATE TABLE Participants(
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    confirmation VARCHAR2(100) NOT NULL,
    CHECK (confirmation in ('Attending','Unsure','Decline', 'Not_Replied')),
    
--     -- No user can participate more than once:
--     PRIMARY KEY (event_id, user_id),
--     FOREIGN KEY (user_id) REFERENCES Users(user_id)
-- );

-- -- TODO
-- CREATE TABLE Albums(
--     album_id INTEGER NOT NULL,
--     album_owner_id INTEGER NOT NULL,
--     album_name VARCHAR2(100) NOT NULL,
--     album_created_time TIMESTAMP NOT NULL,
--     album_modified_time TIMESTAMP,
--     album_link VARCHAR(2000) NOT NULL,
--     album_visibility VARCHAR(100) NOT NULL,
--     cover_photo_id INTEGER NOT NULL,
--     FOREIGN KEY album_owner_id REFERENCES Users (user_id)
--     FOREIGN KEY cover_photo_id REFERENCES Photos (photo_id)
--     PRIMARY KEY (album_id)
--     CHECK (album_visibility in ('Everyone','Friends','Friends_Of_Friends', 'Myself')),
-- );

-- TODO
CREATE TABLE Albums(
    album_id INTEGER NOT NULL,
    album_owner_id INTEGER NOT NULL,
    album_name VARCHAR2(100) NOT NULL,
    album_created_time TIMESTAMP NOT NULL,
    album_modified_time TIMESTAMP,
    album_link VARCHAR(2000) NOT NULL,
    album_visibility VARCHAR(100) NOT NULL,
    cover_photo_id INTEGER NOT NULL,
    FOREIGN KEY album_owner_id REFERENCES Users (user_id)
    FOREIGN KEY cover_photo_id REFERENCES Photos (photo_id)
    PRIMARY KEY (album_id)
    CHECK (album_visibility in ('Everyone','Friends','Friends_Of_Friends', 'Myself')),
);

-- -- TODO
-- CREATE TABLE Tags (
--     tag_photo_id INTEGER NOT NULL,
--     tag_subject_id INTEGER NOT NULL,
--     tag_created_time TIMESTAMP NOT NULL,
--     tag_x NUMBER NOT NULL,
--     tag_y NUMBER REQUIRED,
--     PRIMARY KEY (tag_photo_id)
-- );

-- CREATE SEQUENCE Friend_Sequence
--     START WITH 1
--     INCREMENT BY 1;

-- CREATE TRIGGER Order_Friend_Pairs
--     BEFORE INSERT ON Friends
--     FOR EACH ROW
--         DECLARE temp INTEGER;
--         BEGIN
--             IF :NEW.user1_id > :NEW.user2_id THEN
--                 temp := :NEW.user2_id;
--                 :NEW.user2_id := :NEW.user1_id;
--                 :NEW.user1_id := temp;
--             END IF;
--         END;
-- /