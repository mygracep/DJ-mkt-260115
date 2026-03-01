DROP DATABASE IF EXISTS school;

CREATE DATABASE IF NOT EXISTS school;

USE school;

CREATE TABLE students (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT UNSIGNED,
    grade VARCHAR(10)
);

DESC students;

INSERT INTO students VALUES(1, "홍길동", 15, "9학년");
INSERT INTO students VALUES(DEFAULT, "고길동", 16, "10학년");
INSERT INTO students (name, age, grade) VALUES("신길동", 17, "11학년");

SELECT * FROM students;

TRUNCATE TABLE students;

INSERT INTO students (grade, name, age)
VALUES
	("9학년", "홍길동", 15),
    ("10학년", "고길동", 16),
    ("11학년", "신길동", 17);
    
DESC students;

ALTER TABLE students
	MODIFY age INT UNSIGNED NOT NULL,
    MODIFY grade VARCHAR(10) NOT NULL;
    
ALTER TABLE students
	MODIFY age INT UNSIGNED;

-- 초심자들의 가장 큰 실수
UPDATE students
SET grade = "12학년", age = 18
WHERE id = 3;
-- WHERE grade = "11학년" AND age = 17;

SET SQL_SAFE_UPDATES = 0;

UPDATE students
SET grade = "11학년", age = 17
WHERE grade = "12학년" AND age = 18;

SET SQL_SAFE_UPDATES = 1;

INSERT INTO students (name, age, grade) VALUES("이길동", 14, "8학년");

SELECT * FROM students;

SELECT
	name, age
FROM students;

-- 조건은 where
SELECT *
FROM students
WHERE age = 16;

-- 프로그래밍언어 : == | ===

SELECT *
FROM students
WHERE age <> 16;

SELECT *
FROM students
WHERE age > 16;

SELECT *
FROM students
WHERE age < 16;

SELECT *
FROM students
WHERE age >= 16;

SELECT *
FROM students
WHERE age <= 16;

SELECT *
FROM students
WHERE age != 16;

INSERT INTO students (name, age, grade) VALUES("길동", NULL, "9학년");

SELECT * FROM students;

SELECT * FROM students WHERE age <> 16;
SELECT * FROM students WHERE age != 16;
SELECT * FROM students WHERE NOT age = 16;
-- 부정연산자 종류 : Null 배제

SELECT * FROM students WHERE age NOT IN (16, 17, NULL);

SELECT *
FROM students
WHERE age NOT IN (16, 17)
   OR age IS NULL;
   
-- UNKNOWN -> 조회불가능 상태
-- SELECT * FROM students WHERE age NOT IN (SELECT age FROM students WHERE age IS NOT NULL);

-- USE school;

-- SELECT *
-- FROM students s1
-- WHERE NOT (
--     SELECT 1
--     FROM students s2
--     WHERE s2.age IS NOT NULL
--       AND s1.age = s2.age
-- );


SELECT *
FROM students
WHERE age <> 16 OR age IS NULL;
-- Null 값을 온전하게 인정하게 판단
SELECT * FROM students;
SELECT * FROM students WHERE age IS NOT NULL;

SELECT *
FROM students
WHERE
	age >= 15 AND grade = "10학년";
    
SELECT *
FROM students
WHERE
	(age >= 15) OR (grade = "10학년");

SELECT *
FROM students
WHERE name like "고%";
-- %는 갯수와 무관하게 어떤 값을 받는다

SELECT *
FROM students
WHERE name like "고_";
-- _는 갯수만큼만 값을 받는다

SELECT *
FROM students
WHERE name like "%길%";

SELECT *
FROM students
WHERE name like "___";

SET SQL_SAFE_UPDATES = 0;
DELETE FROM students WHERE name = "길동";
SET SQL_SAFE_UPDATES = 1;
DELETE FROM students WHERE id = 4;

SELECT * FROM students;

SHOW DATABASES;

USE mysql;

SELECT Host, User FROM user;

-- User : 아이디
-- Host : 접근가능한 ip 범위 : 127.0.0.1 = 로컬 컴퓨터

CREATE USER "davidpark"@"localhost"
IDENTIFIED BY "1234567a";

CREATE USER "davidparkall"@"%"
IDENTIFIED BY "1234567a";

SET PASSWORD FOR "davidparkall"@"%" = "1234a";

DROP USER "davidpark"@"localhost";
DROP USER "david7"@"localhost";

DROP USER "davidparkall"@"%";
DROP USER "root1"@"%";

SHOW GRANTS FOR "root"@"localhost";
SHOW GRANTS FOR "davidpark"@"localhost";
SHOW GRANTS FOR "davidparkall"@"%";
-- *.* -> all > all

GRANT SELECT ON school.students TO "davidparkall"@"%";
GRANT UPDATE ON school.students TO "davidpark"@"localhost";

REVOKE UPDATE ON school.students FROM "davidpark"@"localhost";
-- REVOKE ALL PRIVILEGES ON *.* FROM "davidpark"@"localhost";
REVOKE ALL PRIVILEGES, GRANT option from "davidpark"@"localhost";

FLUSH PRIVILEGES;

CREATE USER "davidpark"@"localhost"
IDENTIFIED BY "1234567a";

SELECT Host, User FROM user;

SHOW GRANTS FOR "davidpark"@"localhost";

REVOKE ALL PRIVILEGES, GRANT option from "davidpark"@"localhost";
