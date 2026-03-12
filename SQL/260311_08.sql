/*
1. comedy, sports, family 카테고리의 카테고리 아이디를 찾아서 카테고리명과 아이디를 같이 출력!
*/

SELECT name, category_id
FROM category
WHERE
	name = "Comedy" OR
    name = "Sports" OR
    name = "Family";
    
SELECT name, category_id FROM category
WHERE name IN ("Comedy", "Sports", "Family");

/*
2. film_category 테이블 안에서 film_id가 2인 영화의 카테고리 아이디를 조회해서 출력해주세요.
*/

SELECT category_id FROM film_category
WHERE film_id = 2;

/*
3. film_category 테이블에서 카테고리 ID별 영화 수 조회 및 출력
*/

SELECT
	category_id, COUNT(*) category_count
FROM film_category
GROUP BY category_id;

/*
4. 카테고리가 코메디인 영화 갯수 조회.출력
*/

SELECT COUNT(*) comedy_count
FROM category C
JOIN film_category F ON C.category_id = F.category_id
WHERE name = "Comedy";

SELECT COUNT(*) comedy_count
FROM category C
JOIN film_category F USING(category_id)
WHERE name = "Comedy";

SELECT * FROM film LIMIT 10; -- film_id
SELECT * FROM film_category LIMIT 10;

SHOW TABLES;

SELECT COUNT(*) comedy_count
FROM film_category
WHERE category_id IN (
	SELECT category_id FROM category
	WHERE name = "Comedy"
);

/*
5. Comedy, Sports, Family 각각의 카테고리별 영화 갯수 조회.출력
*/

SELECT
	C.name, COUNT(*) category_count
FROM category C
JOIN film_category F ON C.category_id = F.category_id
WHERE C.name IN ("Comedy", "Sports", "Family")
GROUP BY C.category_id;

SELECT
	C.name, COUNT(*) category_count
FROM category C
JOIN film_category F USING(category_id)
WHERE C.name IN ("Comedy", "Sports", "Family")
GROUP BY C.category_id;

SELECT
	C.name,
    COUNT(*) film_count
FROM (
	SELECT category_id, name
	FROM category
	WHERE name IN ("Comedy", "Sports", "Family")
) C
JOIN film_category F USING(category_id)
GROUP BY C.category_id, C.name;

SELECT C.name,
	(
		SELECT COUNT(*)
        FROM film_category F
        WHERE C.category_id = F.category_id
    ) film_count
FROM category C
WHERE C.name IN ("Comedy", "Sports", "Family");

-- 코딩테스트 시험 : 골방 / 노트북 / 문제 해결 / 시간 / 10사람
-- 코드 퀄리티 = 코드 문제 해결 걸리는 로딩 시간
-- 빅오 표기법 = 가장 짧은 시간안에 코드가 되는 여부
-- 반복문 (최소화) -> 문제를 해결하는 방법


/*
6. 각 카테고리별 영화의 갯수가 70개 이상인 카테고리명을 조회.출력
*/

SELECT
	C.name, COUNT(*) category_count
FROM category C
JOIN film_category F USING(category_id)
GROUP BY C.category_id
HAVING category_count >= 70;

-- 한 번에 모두 다 해결 // 부분으로 나눠서 부분 단위로 해결하는 습관 // 하나로 연결?

/*
7. 각 카테고리별 영화들의 렌탈 횟수 조회.출력
*/
SHOW TABLES;
SELECT * FROM category LIMIT 10; -- category_id
SELECT * FROM film_category LIMIT 10; -- category_id, film_id
SELECT * FROM inventory LIMIT 10; -- film_id, inventory_id
SELECT * FROM rental LIMIT 10; -- inventory_id

SELECT
	C.name, COUNT(*) rental_count
FROM category C
JOIN film_category F USING(category_id)
JOIN inventory I USING(film_id)
JOIN rental R USING(inventory_id)
GROUP BY C.category_id
ORDER BY rental_count DESC;




