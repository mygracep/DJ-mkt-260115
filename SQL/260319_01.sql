USE sakila;

/*
18. 영화 Alone Trip에 출연한 배우들의 이름을 모두 출력해주세요.
단, 서브쿼리로 문제를 해결해주세요.
*/

SHOW TABLES;
SELECT * FROM actor LIMIT 3; -- actor_id
SELECT * FROM film_actor LIMIT 3; -- actor_id, film_id
SELECT * FROM film LIMIT 3; -- film_id

SELECT
	CONCAT(first_name, " ", last_name) actor_name
FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM film_actor WHERE film_id IN (
		SELECT film_id FROM film WHERE title = "Alone Trip"
	)
);

/*
19. 2005년 8월 한 달간 발생된 매출에 한해서, 매출을 발생시킨 스텝의 이름과 해당 스텝이
발생시킨 매출의 데이터를 조회해서 출력해주세요.
JOIN
*/

SHOW TABLES;

SELECT * FROM payment LIMIT 10; -- payment, staff
SELECT * FROM staff LIMIT 10; -- staff

SELECT
	CONCAT(S.first_name, " ", S.last_name) staff_member,
    SUM(P.amount) total_amount
FROM staff S
JOIN payment P USING(staff_id)
WHERE
	YEAR(payment_date) = 2005 AND
    MONTH(payment_date) = 8
GROUP BY P.staff_id
ORDER BY total_amount DESC;

/*
20. 각 영화 장르별 평균 러닝타임(상영시간) 존재
해당 장르별 평균 상영시간이 모든 장르를 통합했을 때의 평균 상영시간보다 큰 경우에
한해서 해당 장르와 평균상영시간을 조회 및 출력
*/

SELECT * FROM category; -- category_id
SELECT * FROM film_category LIMIT 10; -- category_id, film_id
SELECT * FROM film LIMIT 10; -- film_id

SELECT
	C.name, AVG(F.length) category_runtime
FROM category C
JOIN film_category FC USING(category_id)
JOIN film F USING(film_id)
GROUP BY C.name
HAVING category_runtime > (
	SELECT AVG(length) FROM film
)
ORDER BY category_runtime DESC;

/*
21
*/





