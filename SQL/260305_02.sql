-- 과거 DVD 렌탈 사업 모델, 가상저장 데이터
USE sakila;
SHOW TABLES;

-- 문자열 함수 : LENGTH(), UPPER(), LOWER(), CONCAT(), SUBSTRING()
-- 함수내부에 또다른 함수 : Callback Function

SELECT
	title,
    LENGTH(title) title_length
FROM film
LIMIT 10;

SELECT
	title,
    UPPER(title) uppercased_title
FROM film
LIMIT 10;

SELECT
	title,
    LENGTH(UPPER(LOWER(title))) title_test
FROM film
LIMIT 10;

SELECT
	first_name, last_name,
    CONCAT(first_name, " ", last_name) full_name
FROM actor
LIMIT 10;

SELECT
	description,
    SUBSTRING(description, 3, 10) short_description
FROM film
LIMIT 10;

-- film 테이블에서 영화제목의 길이가 15자인 영화들을 찾아주세요!
SELECT COUNT(*)
FROM film
WHERE LENGTH(title) = 15;

-- actor 테이블에서 first_name이 소문자로 john인 배우들의 전체이름을 대문자로 변환해서 출력
-- 전체이름 = first + last

SELECT
	UPPER(CONCAT(first_name, " ", last_name)) full_name
FROM actor
WHERE LOWER(first_name) = "john";

-- film 테이블에서 description 컬럼 안에 텍스트 > 3번째 문자열부터 이후 6글자가 Action인
-- 영화 제목을 찾아서 출력해주세요!

SELECT title
FROM film
WHERE SUBSTRING(description, 3, 6) = "Action";


