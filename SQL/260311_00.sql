/*
MySQL(DBMS) : 데이터베이스(DB)를 관리하는 시스템 프로그램
- DB > TABLE > DATA
- TABLE간 관계를 맺을 수 있도록 -> RDBMS
- SQL : DDL / DML / DCL
- SELECT / FROM / WHERE / GROUP BY / HAVING / ORDER BY
- JOIN = INNER / LEFT & RIGHT
- INDEX
- SubQuery
- 상관 SubQuery
- 숫자형 / 문자열 / 날짜데이터 / 집합 / 트랜잭션
- 가상쿼리 (VIEW / WITH)
- CASE WHEN
> 본격적인 101문제 실전예시풀이

NoSQL
- MongoDB
- 3S Studio

SQLD
- 시험내용에 입각한 문제풀이 + 데이터 이론
*/

/* 마케팅 + 데이터 */
/*
데이터직무.직군 -> 석사 중심 졸업생 유리 취업, 학사단계
데이터 VS 마케팅 -> 데이터를 활용 마케팅
데이터 => 파이썬 / SQL
수집 / 저장 / 시각화 / 분류 / 관리...
*/

/* TRANSACTION => 거래, 중요한 데이터를 다루는 경우 실수로 데이터 삭제, 편집 -> 되돌릴 수 있도록 해주는 장치기능 */

USE sakila;
SHOW TABLES;
SELECT * FROM customer LIMIT 10;


UPDATE customer SET first_name = "DAVE"




