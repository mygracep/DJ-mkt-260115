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
5. 상관서브쿼리
> 서브쿼리 처럼 내.외부 서브쿼리 문장을 작성하긴 하나, 내부 쿼리문을 작성 할 때, 외부 쿼리문에서 값을 의존하는 방식
6. 집합 : UNION (중복된 값을 1번만 사용하는 구문), UNION ALL (중복된 값을 모두 사용하는 구문),
		INTERSECT (교집합의 역할), EXCEPT (차집합의 역할)
MySQL 버전
*/

SELECT film_id FROM film
INTERSECT
SELECT film_id FROM inventory;

SELECT DISTINCT F.film_id
FROM film F
JOIN inventory I ON F.film_id = I.film_id;

SELECT F.film_id
FROM film F
WHERE film_id IN (
	SELECT film_id
    FROM inventory
);

SELECT film_id FROM film
EXCEPT
SELECT film_id FROM inventory;

SELECT F.film_id
FROM film F
LEFT JOIN inventory I ON F.film_id = I.film_id
WHERE I.film_id IS NULL;




