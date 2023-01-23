-- View_User_Information
CREATE VIEW View_User_Information AS
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.year_of_birth,
    u.month_of_birth,
    u.day_of_birth,
    u.gender,
    c1.city_name AS current_city,
    c1.state_name AS current_state, 
    c1.country_name AS current_country,
    c2.city_name AS hometown_city,
    c2.state_name AS hometown_state,
    c2.country_name AS hometown_country,
    p.institution,
    e.program_year,
    p.concentration,
    p.degree
FROM Users u
LEFT JOIN User_Current_Cities cur on u.user_id=cur.user_id
LEFT JOIN Cities c1 on current_city_id=c1.city_id
LEFT JOIN User_Hometown_Cities hom on u.user_id=hom.user_id
LEFT JOIN Cities c2 on c2.city_id=hometown_city_id
LEFT JOIN Education e on u.user_id = e.user_id
LEFT JOIN Programs p on p.program_id=e.program_id;

-- View_Are_Friends
CREATE VIEW View_Are_Friends AS
SELECT user1_id, user2_id
FROM Friends;

-- View_Photo_Information
CREATE VIEW View_Photo_Information AS
SELECT p.album_id, a.album_owner_id, a.cover_photo_id, a.album_name,
a.album_created_time, a.album_modified_time, a.album_link, a.album_visibility,
p.photo_id, p.photo_caption, p.photo_created_time, p.photo_modified_time,
p.photo_link
FROM Albums a
JOIN Photos p ON a.album_id = p.album_id
WHERE a.album_modified_time IS NOT NULL
AND p.photo_modified_time IS NOT NULL;

-- Event View
CREATE VIEW View_Event_Information AS
SELECT event_id, event_creator_id, event_name, event_tagline, event_description, event_host,
event_type, event_subtype, event_address, city_name, state_name, country_name, event_start_time, event_end_time
FROM User_Events u
JOIN Cities c
ON u.event_city_id = c.city_id
WHERE event_host IS NOT NULL
AND event_type IS NOT NULL
AND event_subtype IS NOT NULL
AND event_address IS NOT NULL
AND event_start_time IS NOT NULL
AND event_end_time IS NOT NULL;


-- Tag View
CREATE VIEW View_Tag_Information AS
SELECT tag_photo_id, tag_subject_id, tag_created_time, tag_x, tag_y
FROM Tags;


/* 
Test Queries for Views -> ALL Should return 
    'no rows selected'

View_User_Information
SELECT * FROM project1.Public_User_Information MINUS SELECT * FROM View_User_Information;

View_Are_Friends
1. SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id) FROM project1.Public_Are_Friends MINUS SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id) FROM View_Are_Friends;
2. SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id) FROM View_Are_Friends MINUS SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id) FROM project1.Public_Are_Friends;

View_Photo_Information
SELECT * FROM project1.Public_Photo_Information MINUS SELECT * FROM View_Photo_Information;

View_Event_Information
SELECT * FROM project1.Public_Event_Information MINUS SELECT * FROM View_Event_Information;

View_Tag_Information:
SELECT * FROM project1.Public_Tag_Information MINUS SELECT * FROM View_Tag_Information;

*/