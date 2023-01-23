-- Akshay createViews
-- CREATE VIEW View_User_Information AS 
-- SELECT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender FROM Users

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

-- ERROR: 1942 Rows are Missing in the View

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

-- CREATE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;



/* 
Test Queries for Views -> ALL Should return 
    'no rows selected'

View_User_Information

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