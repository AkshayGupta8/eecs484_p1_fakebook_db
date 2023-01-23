-- Akshay createViews
-- CREATE VIEW View_User_Information AS 
-- SELECT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender FROM Users

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
View_Photo_Information
View_Event_Information

View_Tag_Information:
SELECT * FROM project1.Public_Tag_Information MINUS SELECT * FROM View_Tag_Information;

*/