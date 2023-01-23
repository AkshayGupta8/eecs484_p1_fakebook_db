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



-- SELECT * FROM project1.Public_User_Information WHERE ROWNUM < 2;


-- INSERT INTO Users(user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender) Values (1, 'a', 'b', 2000, 1, 1, 'm');




-- The following examples show various forms of INSERT statement:

-- INSERT INTO bonus SELECT ename, job, sal, comm FROM emp
--    WHERE comm > sal * 0.25;
-- ...
-- INSERT INTO emp (empno, ename, job, sal, comm, deptno)
--    VALUES (4160, 'STURDEVIN', 'SECURITY GUARD', 2045, NULL, 30);
-- ...
-- INSERT INTO dept
--    VALUES (my_deptno, UPPER(my_dname), 'CHICAGO');