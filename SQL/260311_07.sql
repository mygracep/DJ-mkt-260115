USE bestproducts;
SELECT * FROM items;
SELECT * FROM ranking;

SELECT
  t.provider,
  t.title,
  t.item_ranking
FROM (
  SELECT
    i.provider,
    r.item_ranking,
    MIN(i.item_code) AS min_item_code
  FROM ranking r
  JOIN items i ON i.item_code = r.item_code
  JOIN (
    SELECT
      i.provider,
      MIN(r.item_ranking) AS best_ranking
    FROM ranking r
    JOIN items i ON i.item_code = r.item_code
    GROUP BY i.provider
  ) x
    ON x.provider = i.provider
   AND x.best_ranking = r.item_ranking
  GROUP BY i.provider, r.item_ranking
) y
JOIN items t
  ON t.item_code = y.min_item_code
JOIN ranking r
  ON r.item_code = t.item_code
 AND r.item_ranking = y.item_ranking
ORDER BY y.item_ranking ASC, y.provider;


SELECT
	i.provider,
	r.item_ranking,
	MIN(i.item_code) AS min_item_code
FROM ranking r
JOIN items i ON i.item_code = r.item_code
GROUP BY i.provider;

SELECT
  i.provider,
  MIN(r.item_ranking) AS best_ranking
FROM ranking r
JOIN items i ON i.item_code = r.item_code
WHERE i.provider IS NOT NULL
  AND i.provider <> ''
GROUP BY i.provider;

SELECT
  y.provider,
  t.title,
  y.item_ranking
FROM (
  SELECT
    i.provider,
    r.item_ranking,
    MIN(i.item_code) AS min_item_code
  FROM ranking r
  JOIN items i ON i.item_code = r.item_code
  JOIN (
    SELECT
      i.provider,
      MIN(r.item_ranking) AS best_ranking
    FROM ranking r
    JOIN items i ON i.item_code = r.item_code
    GROUP BY i.provider
  ) x
    ON x.provider = i.provider
   AND x.best_ranking = r.item_ranking
  GROUP BY i.provider, r.item_ranking
) y
JOIN items t
  ON t.item_code = y.min_item_code
ORDER BY y.item_ranking ASC, y.provider;


SELECT
  y.provider,
  t.title,
  y.item_ranking
FROM (
  SELECT
    i.provider,
    r.item_ranking,
    MIN(i.item_code) AS min_item_code
  FROM ranking r
  JOIN items i ON i.item_code = r.item_code
  JOIN (
    SELECT
      i.provider,
      MIN(r.item_ranking) AS best_ranking
    FROM ranking r
    JOIN items i ON i.item_code = r.item_code
    WHERE TRIM(i.provider) <> ''
    GROUP BY i.provider
  ) x
    ON x.provider = i.provider
   AND x.best_ranking = r.item_ranking
  WHERE TRIM(i.provider) <> ''
  GROUP BY i.provider, r.item_ranking
) y
JOIN items t
  ON t.item_code = y.min_item_code
ORDER BY y.item_ranking ASC, y.provider;