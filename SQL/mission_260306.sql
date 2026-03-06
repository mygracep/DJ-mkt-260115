-- 어떤 지식이든 처음에는 누구나 낯설다!!!
-- 수업 이해 // 혼자 x

-- bestproducts DB > 판매자별 랭킹이 높은 상품을 찾아라!
USE bestproducts;
SELECT * FROM items LIMIT 10; # 판매자가 존재하는 테이블
SELECT * FROM ranking LIMIT 10; # 아이템 랭킹이 존재하는 테이블
-- 2개의 테이블을 하나로 연결해주는 FK = item_code
-- 초.중반 개발수업 => 수학 x, 언어 ㅇ

SELECT
	y.provider,
    t.title,
    y.item_ranking
FROM (
	SELECT
		i.provider,
		r.item_ranking,
		MIN(i.item_code) min_item_code
	FROM ranking r
	JOIN items i ON r.item_code = i.item_code
	JOIN (
		SELECT
			i.provider,
			MIN(r.item_ranking) best_ranking
		FROM items i
		JOIN ranking r ON i.item_code = r.item_code
		WHERE i.provider <> ""
		GROUP BY i.provider
	) x
		ON x.provider = i.provider
        AND x.best_ranking = r.item_ranking
	WHERE i.provider <> ""
	GROUP BY i.provider, r.item_ranking
) y
JOIN items t ON y.min_item_code = t.item_code
ORDER BY y.item_ranking ASC;

/*
1) 판매자별 가장 높은 랭킹 순위 (MIN, JOIN, Subquery)
2) 판매자별 가장 작은 아이템코드 (MIN, JOIN, Subquery)
3) 판매자별 가장 높은 랭킹 이면서 동시에 가장 작은 아이템코드 가진 상품 (JOIN, Subquery)
4) 해당 상품들을 찾아서 랭킹별 내림차순 (GROUP BY)
*/

