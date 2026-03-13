/*
8. Comedy, Sports, Family 카테고리에 해당되는 영화들의 렌탈 횟수를 조회.출력
(출력 시, 카테고리이름, 렌탈횟수 출력되어야 함)
*/

USE sakila;
SHOW TABLES;

SELECT
	C.name, COUNT(*) category_count
FROM category C
JOIN film_category F USING(category_id)
JOIN inventory I USING(film_id)
JOIN rental R USING(inventory_id)
WHERE name IN ("Comedy", "Sports", "Family")
GROUP BY C.category_id
ORDER BY category_count DESC;

SELECT * FROM film_category LIMIT 10; -- category_id, film_id
SELECT * FROM inventory LIMIT 10; -- film_id, inventory_id
SELECT * FROM rental LIMIT 10; -- inventory_id

-- 9. Comedy 카테고리 영화들의 렌탈 횟수 조회.출력 (단, 서브쿼리 해결)
SELECT
	COUNT(*) comedy_rental_count
FROM rental
WHERE inventory_id IN (
	SELECT inventory_id FROM inventory
	WHERE film_id IN (
		SELECT film_id FROM film_category
		WHERE category_id IN (
			SELECT category_id FROM category
			WHERE name = "Comedy"
		)
	)
);

-- 서브쿼리 (SELECT > SELECT) 구문
-- 어떤 조건안에서 특정 값을 찾아와야 하는 경우, JOIN vs SubQuery
-- JOIN : 컬럼의 갯수가 무한정 늘어나는 단점, 직관적으로 테이블 연결
-- SubQuery : 먼저 특정 조건과 관련한 쿼리문을 실행시킨 후, 외부쿼리문을 통해서 서로 다른 테이블
-- 연결고리를 찾는 과정을 거치기 때문에 데이터 조회하는데, 시간이 그렇게 많이 걸리지 장점, 드릴링이
-- 많아질수록 구문의 가독성이 나빠진다. 단점

-- 10. Comedy 카테고리 영화의 갯수를 조회.출력해주세요. (단, INNER JOIN으로 사용하세요!)
SELECT * FROM film_category LIMIT 10;
SELECT * FROM category WHERE name = "Comedy";

SELECT COUNT(*) comedy_films
FROM film_category F
JOIN category C USING(category_id)
WHERE name = "Comedy";

-- 11. address 테이블에는 address_id가 존재하지만, customer 테이블에는 address_id가 존재하지 않는
-- 데이터의 갯수를 출력해주세요!
SELECT * FROM address LIMIT 10;
SELECT * FROM customer LIMIT 10;

SELECT
	COUNT(*)
FROM customer C
RIGHT JOIN address A USING(address_id)
WHERE customer_id IS NULL;

-- 12. 캐나다 고객들에게 이메일을 활용한 CRM마케팅을 진행하려고 합니다.
-- 따라서 캐나다 지역 고객들의 이름, email주소가 필요합니다. 각 테이블을 조회, 출력!

SELECT
    CONCAT(first_name, " ", last_name) full_name,
    email
FROM customer CU
JOIN address AD USING(address_id)
JOIN city CI USING(city_id)
JOIN country CO USING(country_id)
WHERE CO.country = "Canada";

SHOW TABLES;

SELECT * FROM customer LIMIT 10; -- customer_id, address_id
SELECT * FROM address LIMIT 10; -- address_id, city_id
SELECT * FROM city LIMIT 10; -- city_id, country_id
SELECT * FROM country WHERE country = "Canada"; -- country_id





