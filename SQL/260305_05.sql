/*
1. 문자열 함수 : LENGTH(), UPPER(), LOWER(), CONCAT(), SUBSTRING()
2. 날짜/시간 함수 : NOW(), CURDATE(), CURTIME(), DATE_ADD(date, INTERVAL unit), DATE_SUB(date, INTERVAL unit),
				EXTRACT(field FROM source), YEAR(), MONTH(), DAY(), HOUR(), MINUTE(), SECOND(),
                DAYOFWEEK(), TIMESTAMPDIFF(unit, start_datetime, end_datetime), DATE_FORMAT(date, format)
- INTERVAL unit : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
- DAYOFWEEK : 일요일 = 1, 월요일 = 2...
- TIMESTAMPDIFF : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
- DATE_FORMAT : 날짜 또는 시간 데이터를 특정 양식의 문자열로 반환
- %Y : 4자리 연도수 표기 (2026)
- %y : 2자리 연도수 표기 (26)
- %M : 영문 월 이름 표기 (March)
- %m : 월을 2자리 수 표기 (01 ~ 12)
- %c : 월을 1자리 수 표기 (1~12)
- %D : 일을 2자리 수 + 영문 접미사 표기 (1st, 21st)
- %d : 일을 2자리수 (01~31)
- %H : 시간을 24시간 형식으로 2자리수 (00~23)
- %h : 시간을 12시간 형식으로 2자리수 (01~12)
- %I : 시간을 12시간 형식으로 1자리수 (1~12)
- %i : 분을 2자리수 (00~59)
- %s : 초를 2자리수 (00~59)
3. 숫자 함수 : ABS(number), CEIL(number), FLOOR(number), ROUND(number, decimals), SQRT()
4. (중첩)서브쿼리
> 특정 컬럼 안에 있는 값을 어떤 연산 및 비교를 통해서 새로운 값을 도출하려고 할 때,
연산 및 비교해야할 대상이 필요!! -> 해당 대상을 먼저 생성하고자 할 때
*/

-- 평균 결제 금액보다 더 많은 결제를 한 고객의 전체이름을 찾아서 출력 (customer, payment)

SELECT * FROM customer LIMIT 10;
SELECT * FROM payment LIMIT 10;

-- amount 금액의 평균이 먼저 나와있어야 함
-- 그래야 각각의 amount값을 평균과 비교해볼 수 있음
SELECT
    CONCAT(first_name, " ", last_name) full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
    FROM payment
	WHERE amount > (
		SELECT AVG(amount) FROM payment
	)
);

-- 평균 결제 횟수보다 더 많은 결제를 한 고객을 찾아서 출력해주세요!
USE sakila;

SELECT
    CONCAT(first_name, " ", last_name) full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(*) > (
		SELECT AVG(payment_count)
		FROM (
			SELECT COUNT(*) payment_count
			FROM payment
			GROUP BY customer_id
		) payment_counts
    )
);

-- 위 쿼리문을 통해서 찾은 고객들을 VIP 고객

DESC payment;

-- 가장 많은 결제 횟수를 기록한 고객을 찾아주세요!

SELECT
	CONCAT(first_name, " ", last_name)
FROM customer
WHERE customer_id IN (
	SELECT customer_id
    FROM (
		SELECT customer_id, COUNT(*) payment_count
		FROM payment
		GROUP BY customer_id
        ORDER BY payment_count DESC
        LIMIT 1
    ) payment_counts
);




