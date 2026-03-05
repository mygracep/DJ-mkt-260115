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
*/

SELECT ABS(-1) abs_num;

SELECT
	amount,
	CEIL(ABS(amount)),
    FLOOR(ABS(amount)),
    ROUND(amount, 1)
FROM payment
LIMIT 10;

SELECT SQRT(4);

-- payment 테이블에서 결제금액(amount)이 5이하인 모든 결제건에 대해서 해당 결제금액을 절대값 적용.출력
SELECT ABS(amount)
FROM payment
WHERE amount <= 5;

/*
film 테이블에서 영화상영시간(길이)가 120분 이상인 모든 영화에 대해서
영화상영시간의 제곱근을 계산해서 출력해주세요.
9 = 3^2 => 3제곱근
*/

SELECT ROUND(SQRT(length),2) sqrt_number
FROM film
WHERE length >= 120;

