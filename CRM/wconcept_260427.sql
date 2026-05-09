USE wconcept_db_260423;

SELECT * FROM brands;
SELECT * FROM products;
SELECT * FROM product_metrics;
SELECT * FROM product_reviews;

SELECT COUNT(*) AS total_product_count
FROM products; # 197

SELECT COUNT(*) AS total_brand_count
FROM brands; # 106

SELECT COUNT(*) AS total_review_count
FROM product_reviews; # 5728

# JOIN : SQL -> 개발
SELECT
	B.brand_name,
	P.product_name,
    P.product_url
FROM products P
JOIN brands B ON P.brand_id = B.brand_id;

SELECT
	P.product_name,
    M.original_price,
    M.sale_price,
    M.discount_rate
FROM products P
JOIN product_metrics M ON P.product_id = M.product_id;

SELECT
	P.product_name,
    M.sale_price
FROM products P
JOIN product_metrics M ON P.product_id = M.product_id
ORDER BY M.sale_price ASC;

SELECT
	P.product_name,
    M.original_price,
    M.sale_price,
    M.discount_rate
FROM products P
JOIN product_metrics M ON P.product_id = M.product_id
ORDER BY M.discount_rate DESC;

SELECT
	P.product_name,
    M.rating,
    M.review_count
FROM products P
JOIN product_metrics M ON P.product_id = M.product_id
ORDER BY M.rating DESC
LIMIT 20;

SELECT
	P.product_name,
    M.rating,
    M.review_count
FROM products P
JOIN product_metrics M ON P.product_id = M.product_id
ORDER BY M.review_count DESC
LIMIT 20;

# 단독상품 -> 단독상품 입점유도.설득 // 쿠쿠 & 단독
# 단독 -> 우리 wconcept 플랫폼
# 인기 여성패션 브랜드 -> 단독? -> 문제인식 -> funnel
# wconcept 플랫폼 전문성, 정체성 -> 인기 브랜드

SELECT
	P.product_name,
    M.like_count,
    M.rating
FROM products P
JOIN product_metrics M ON P.product_id = M.product_id
ORDER BY M.like_count DESC
LIMIT 40;

SELECT
	B.brand_name,
    COUNT(P.product_id) AS product_count
FROM brands B
JOIN products P ON B.brand_id = P.brand_id
GROUP BY B.brand_name
ORDER BY product_count DESC;

SELECT
	B.brand_name,
    ROUND(AVG(M.sale_price)) AS avg_sale_price
FROM brands B
JOIN products P ON B.brand_id = P.brand_id
JOIN product_metrics M ON P.product_id = M.product_id
GROUP BY B.brand_name
ORDER BY avg_sale_price DESC;

SELECT
	B.brand_name,
    ROUND(AVG(M.discount_rate)) AS avg_discount_rate
FROM brands B
JOIN products P ON B.brand_id = P.brand_id
JOIN product_metrics M ON P.product_id = M.product_id
GROUP BY B.brand_name
ORDER BY avg_discount_rate DESC;

# 할인하지 않아도 인기 -> 브랜드 선호 충성고객
# 파레토 법칙 : 2:8 -> 20 > 80%
# 모든 상품이 다 미끼x, 어떤 상품은 자주 판매 x, 마진 & 영업이익!

SELECT
	B.brand_name,
    ROUND(AVG(M.rating)) AS avg_rating
FROM brands B
JOIN products P ON B.brand_id = P.brand_id
JOIN product_metrics M ON P.product_id = M.product_id
GROUP BY B.brand_name
ORDER BY avg_rating DESC;

SELECT
	P.product_name,
    COUNT(R.review_id) AS collected_review_count
FROM products P
JOIN product_reviews R ON P.product_id = R.product_id
GROUP BY P.product_id
ORDER BY collected_review_count DESC;

# CRM MKT => 고객 평소 관심사

SELECT
	P.product_name,
	R.review_text
FROM product_reviews R
JOIN products P ON R.product_id = P.product_id
WHERE R.review_text LIKE "%기념일%"
	OR R.review_text LIKE "%여행%";



