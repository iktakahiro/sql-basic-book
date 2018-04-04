/* リスト7-1 価格の最大値を求める */
SELECT MAX(price) AS max_price
  FROM book;

/* リスト7-3 価格の最大値を確認 */
SELECT title,
       price
  FROM book
 ORDER BY price DESC
 LIMIT 3;

/* リスト7-6 特定のサブジャンルの価格の最大値を取得 */
SELECT MAX(price) AS max_price
  FROM book
 WHERE sub_genre_id = '0601';

/* リスト7-7 サブジャンルごとに価格の最大値を求める */
SELECT sub_genre_id,
       MAX(price) AS max_price
  FROM book
 GROUP BY sub_genre_id -- sub_genre_id でグループ化
 ORDER BY sub_genre_id
 LIMIT 5;

/* リスト7-9 サブジャンル0101の価格の最大値を確認 */
SELECT sub_genre_id,
       title,
       price
  FROM book
 WHERE sub_genre_id = '0101'
 ORDER BY price DESC
 LIMIT 3;

/* リスト7-11 サブジャンルIDが0103の価格の最大値を確認 */
SELECT sub_genre_id, price
  FROM book
 WHERE sub_genre_id = '0103'
 ORDER BY price DESC
 LIMIT 3;

/* リスト7-13 bookテーブルの件数を取得 */
SELECT COUNT(isbn)
  FROM book;

/* リスト7-15 在庫の有無ごとの件数を取得 */
SELECT COUNT(isbn),
       is_stock
  FROM book
 GROUP BY is_stock
 ORDER BY is_stock DESC;

/* リスト7-17 MAX()、MIN()、AVG() */
SELECT sub_genre_id,
       MAX(price) AS most_expensive,
       MIN(price) AS cheapest,
       AVG(price) AS average
  FROM book
 GROUP BY sub_genre_id
 ORDER BY sub_genre_id
 LIMIT 5;

/* リスト7-19 AVG()を引数にとるROUND() */
SELECT sub_genre_id,
       ROUND(AVG(price), 1) AS average
  FROM book
 GROUP BY sub_genre_id
 ORDER BY sub_genre_id
 LIMIT 5;

/* リスト7-21 最も古い発行日を調べる */
SELECT MIN(published_at) AS oldest
  FROM book;

/* リスト7-25 サブジャンルごとの価格の最大値 */
SELECT sub_genre_id,
       MAX(price) AS most_expensive
  FROM book
 GROUP BY sub_genre_id
 ORDER BY sub_genre_id
 LIMIT 5;

/* リスト7-27 HAVING句の例 */
SELECT sub_genre_id,
       MAX(price) AS most_expensive
       FROM book
 GROUP BY sub_genre_id
HAVING MAX(price) > 6000
 ORDER BY sub_genre_id; 

/* リスト7-29 サブジャンルごとの価格の平均値を求めHAVING句で絞り込み */
SELECT sub_genre_id,
       ROUND(AVG(price), 1) AS average
  FROM book
 GROUP BY sub_genre_id
HAVING AVG(price) > 2800
 ORDER BY sub_genre_id;

/* リスト7-31 HAVING句とWHERE句の組み合わせ */
SELECT sub_genre_id,
       ROUND(AVG(price), 1) AS average
  FROM book
 WHERE sub_genre_id = '0203'
    OR sub_genre_id = '0605'
    OR sub_genre_id = '0607'
 GROUP BY sub_genre_id
HAVING AVG(price) > 2850
 ORDER BY sub_genre_id;

/* リスト7-33 HAVING句とWHERE句の組み合わせ その2 */
SELECT sub_genre_id,
       ROUND(AVG(price), 1) AS average
  FROM book
 WHERE price > 2000
   AND (sub_genre_id = '0203'
    OR sub_genre_id = '0605'
    OR sub_genre_id = '0607')
 GROUP BY sub_genre_id
HAVING AVG(price) > 2850
 ORDER BY sub_genre_id;
