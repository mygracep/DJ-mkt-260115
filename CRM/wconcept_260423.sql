CREATE DATABASE IF NOT EXISTS wconcept_db_260423
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE wconcept_db_260423;

# 4개의 테이블 생성
# 1. brands : 브랜드 목록 (brand_id)
# 2. products : 상품 정보 - 1 (brand_id, product_id, 상품에 대한 큰 정보 = 상품명, 상품상세url)
# 3. products_metrics : 상품 정보 - 2 (product_id, 판매가, 할인가, 할인률, 평점, 리뷰수)
# 4. products_reviews : 상품 정보 - 3 (product_id, 리뷰텍스트)

CREATE TABLE brands (
	brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_no VARCHAR(20) NOT NULL UNIQUE,
    brand_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_url VARCHAR(500) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_products_brand FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

CREATE TABLE product_metrics (
	metric_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    crawl_at DATETIME NOT NULL,
    original_price INT DEFAULT 0,
    sale_price INT DEFAULT 0,
    discount_rate INT DEFAULT 0,
    rating DECIMAL(3, 1) DEFAULT 0.0,
    review_count INT DEFAULT 0,
    like_count INT DEFAULT 0,
    CONSTRAINT fk_metrics_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE product_reviews (
	review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    review_seq INT NOT NULL,
    review_text TEXT NOT NULL,
    crawl_at DATETIME NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reviews_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT uq_product_review UNIQUE (product_id, review_seq, crawl_at)
);

SHOW TABLES;
DESC brands;
DESC products;
DESC product_metrics;
DESC product_reviews;


