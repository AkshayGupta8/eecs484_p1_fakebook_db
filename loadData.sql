/* Users Table
    user_id INTEGER NOT NULL,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    year_of_birth INTEGER,
    month_of_birth INTEGER,
    day_of_birth INTEGER,
    gender VARCHAR2(100),
    PRIMARY KEY (user_id) */
INSERT INTO Users(user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender FROM project1.Public_User_Information;


/* Friends Table
    user1_id INTEGER NOT NULL,
    user2_id INTEGER NOT NULL,
    PRIMARY KEY (user1_id, user2_id),
    FOREIGN KEY (user1_id) REFERENCES Users (user_id),
    FOREIGN KEY (user2_id) REFERENCES Users (user_id)*/
INSERT INTO Friends(user1_id, user2_id) SELECT user1_id, user2_id FROM project1.Public_Are_Friends;

/* Cities 
    city_id INTEGER NOT NULL,
    city_name VARCHAR2(100) NOT NULL,
    state_name VARCHAR2(100) NOT NULL,
    country_name VARCHAR2(100) NOT NULL,
    PRIMARY KEY (city_id)
TODO: Couldn't figure out what to do with the city_id field
Probably should also add from the users table */
INSERT INTO Cities(city_name, state_name, country_name)
SELECT DISTINCT event_city, event_state, event_country FROM project1.Public_Event_Information
UNION 
SELECT DISTINCT current_city, current_state, current_country FROM project1.Public_User_Information
UNION
SELECT DISTINCT hometown_city, hometown_state, hometown_country FROM project1.Public_User_Information;

/* User_Current_Cities
    user_id INTEGER NOT NULL,
    current_city_id INTEGER NOT NULL, */
INSERT INTO User_Current_Cities(user_id, current_city_id)
SELECT DISTINCT user_id, city_id
FROM project1.Public_User_Information p
INNER JOIN Cities c
ON p.current_city = c.city_name AND p.current_state = c.state_name AND p.current_country = c.country_name;

/* User_Hometown_Cities
    user_id INTEGER NOT NULL,
    hometown_city_id INTEGER NOT NULL */
INSERT INTO User_Hometown_Cities(user_id, hometown_city_id)
SELECT DISTINCT user_id, city_id
FROM project1.Public_User_Information p
INNER JOIN Cities c
ON p.hometown_city = c.city_name AND p.hometown_state = c.state_name AND p.hometown_country = c.country_name;

/* Messages
There are no messages from public dataset to insert
*/

/* Programs
    program_id INTEGER NOT NULL,
    institution VARCHAR2(100) NOT NULL,
    concentration VARCHAR2(100) NOT NULL,
    degree VARCHAR2(100) NOT NULL,
*/
INSERT INTO Programs(institution, concentration, degree)
SELECT DISTINCT institution_name, program_concentration, program_degree FROM project1.Public_User_Information
WHERE institution_name IS NOT NULL 
AND program_concentration IS NOT NULL 
AND program_degree IS NOT NULL;

/* Education
    user_id INTEGER NOT NULL,
    program_id INTEGER NOT NULL,
    program_year INTEGER NOT NULL,
TODO: why 1646 rows? too much? */
INSERT INTO Education
SELECT DISTINCT user_id, program_id, program_year
FROM project1.Public_User_Information pub
INNER JOIN Programs prog
ON pub.institution_name = prog.institution 
AND pub.program_degree = prog.degree 
AND pub.program_concentration = prog.concentration;

/* CREATE TABLE User_Events(
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
*/
INSERT INTO User_Events
SELECT DISTINCT event_id, event_creator_id, event_name, event_tagline, event_description, event_host, event_type, event_subtype, event_address, city_id, event_start_time, event_end_time
FROM project1.Public_Event_Information p
INNER JOIN Cities c
ON p.event_city = c.city_name 
AND p.event_state = c.state_name 
AND p.event_country = c.country_name
WHERE event_id IS NOT NULL
AND event_creator_id IS NOT NULL
AND event_name IS NOT NULL
AND city_id IS NOT NULL;

/* Participants
No public data for participants. */

/* CREATE TABLE Albums(
    album_id INTEGER NOT NULL,
    album_owner_id INTEGER NOT NULL,
    album_name VARCHAR2(100) NOT NULL,
    album_created_time TIMESTAMP NOT NULL,
    album_modified_time TIMESTAMP,
    album_link VARCHAR2(2000) NOT NULL,
    album_visibility VARCHAR2(100) NOT NULL,
    cover_photo_id INTEGER NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (album_owner_id) REFERENCES Users(user_id),
    CHECK (album_visibility in ('Everyone','Friends','Friends_Of_Friends', 'Myself'))
);

*/

/* CREATE TABLE Photos(
    photo_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    photo_caption VARCHAR2(2000),
    photo_created_time TIMESTAMP NOT NULL,
    photo_modified_time TIMESTAMP,
    photo_link VARCHAR2(2000) NOT NULL,
    PRIMARY KEY (photo_id)
);
*/