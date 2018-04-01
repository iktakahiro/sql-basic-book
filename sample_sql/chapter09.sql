/* リスト9-1 平均価格よりも安い書籍を取得（サブクエリ未使用） */
-- 平均値を求める
SELECT ROUND(AVG(price))
  FROM book;
-- 結果、1899 が得られる

-- 求めた平均値から目的の行を取得
SELECT isbn,
       title,
       price
  FROM book
 WHERE price < 1899;

/* リスト9-2 平均価格よりも安い書籍を取得（サブクエリ使用） */
SELECT isbn,
       title,
       price
  FROM book
 WHERE price < (SELECT ROUND(AVG(price)) FROM book);

/* リスト9-3 FROM句にサブクエリを使用 */
SELECT sub.id,
       sub.title
  FROM (SELECT 1 AS id,
               'データベースの本' AS title
       ) AS sub;

/* リスト9-4 リスト9-3からサブクエリ部分を抽出 */
SELECT 1 AS id,
       'データベースの本' AS title;

/* リスト9-8 サブジャンルごとの平均価格を求める */
SELECT sub_genre_id,
       ROUND(AVG(price)) AS avg_price
  FROM book GROUP BY sub_genre_id;

/* リスト9-9 書籍情報とサブジャンルの平均価格を取得 */
SELECT b.title,
       b.sub_genre_id,
       b.price,
       sub.avg_price
  FROM book b
  LEFT JOIN
       (SELECT sub_genre_id,
               ROUND(AVG(price)) AS avg_price
          FROM book GROUP BY sub_genre_id) AS sub
    ON b.sub_genre_id = sub.sub_genre_id
 ORDER BY b.isbn
 LIMIT 5;

/* リスト9-11 WHERE句にサブクエリを利用 */
SELECT isbn,
       title
  FROM book
 WHERE isbn = (SELECT '9784774142296');

/* リスト9-12 平均価格よりも安い書籍を取得 */
SELECT isbn,
       title,
       price
  FROM book
 WHERE price < (SELECT ROUND(AVG(price)) FROM book)
 ORDER BY price DESC, isbn ASC
 LIMIT 5;

SELECT isbn,
       title,
       price
  FROM book
 WHERE price < AVG(price)
 ORDER BY price DESC, isbn ASC
 LIMIT 5;

/* リスト9-14 WHERE INで複数の条件を指定 */
SELECT id,
       name
  FROM sub_genre
 WHERE id IN ('0601', '0603')
 ORDER BY id;

/* リスト9-16 ジャンルID「06」に所属するサブジャンルIDを取得 */
SELECT genre_id,
       id AS sub_genre_id
  FROM sub_genre
 WHERE genre_id = '06'
 ORDER BY id
 LIMIT 5;

/* リスト9-18 ジャンルID「06」の書籍一覧を取得 */
SELECT title,
       sub_genre_id
  FROM book
 WHERE sub_genre_id IN
       (SELECT id
          FROM sub_genre
         WHERE genre_id = '06')
 ORDER BY isbn
 LIMIT 5;

/* リスト9-20 ジャンルID「06」以外の書籍一覧を取得 */
SELECT title,
       sub_genre_id
  FROM book
 WHERE sub_genre_id NOT IN
       (SELECT id
          FROM sub_genre
         WHERE genre_id = '06')
 ORDER BY isbn
 LIMIT 5;

/* リスト9-22 EXISTS句を使って、ジャンルID「06」の書籍一覧を取得 */
SELECT title,
       sub_genre_id
  FROM book AS b
 WHERE EXISTS
       (SELECT 1
          FROM sub_genre AS s
         WHERE genre_id = '06'
           AND b.sub_genre_id = s.id)
 ORDER BY isbn
 LIMIT 5;

/* リスト9-25 NOT EXISTS句を使ってジャンルID「06」以外の書籍一覧を取得 */
SELECT title,
       sub_genre_id
  FROM book AS b
 WHERE NOT EXISTS
       (SELECT 1
          FROM sub_genre AS s
         WHERE genre_id = '06'
           AND b.sub_genre_id = s.id)
 ORDER BY isbn
 LIMIT 5;

/* リスト9-27 b3テーブルを確認 */
SELECT *
  FROM b3;


/* リスト9-29 bookテーブルの取得結果をb3テーブルに挿入 */
INSERT INTO b3 (isbn, title, published_at)
SELECT isbn,
       title, -- VALUES を使用せず、サブクエリを使用
       published_at
  FROM book
 WHERE sub_genre_id IN ('0602', '0603')
 ORDER BY published_at DESC
 LIMIT 3;

-- INSERT文 実行後の結果を確認
SELECT *
  FROM b3
 ORDER BY isbn ASC;

/* リスト9-31 サブクエリと列数の一致しないINSERT文 */
INSERT INTO b3 (isbn, title)
SELECT *
  FROM book
 WHERE sub_genre_id = '0701'
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト9-32 更新後の値となるはずの行を確認 */
SELECT isbn,
       title,
       published_at
  FROM book
 WHERE sub_genre_id = '0701'
 ORDER BY published_at DESC
 LIMIT 1;

/* リスト9-34 更新対象となるはずの行を確認 */
SELECT *
  FROM b3
 ORDER BY published_at DESC
 LIMIT 1;

/* リスト9-36 bookテーブルのデータを利用しb3テーブルを更新 */
UPDATE b3
   SET isbn = b.isbn,
       title = b.title,
       published_at = b.published_at
  FROM (SELECT isbn,
               title,
               published_at
          FROM book
         WHERE sub_genre_id = '0701'
         ORDER BY published_at DESC
         LIMIT 1) AS b
 WHERE b3.isbn = (SELECT isbn
                    FROM b3
                   ORDER BY published_at DESC
                   LIMIT 1);

-- INSERT文 実行後の結果を確認
SELECT *
FROM b3
ORDER BY isbn ASC;

/* リスト9-38 サブジャンルID「0701」に該当する行の確認 */
SELECT isbn,
       title
  FROM b3
 WHERE EXISTS
       (SELECT 1
          FROM book AS b
         WHERE sub_genre_id = '0701'
           AND b.isbn = b3.isbn)
 ORDER BY isbn ASC;

/* リスト9-40 サブジャンルID「0701」に該当する行を削除 */
DELETE FROM b3
 WHERE EXISTS
       (SELECT 1
          FROM book AS b
         WHERE sub_genre_id = '0701'
           AND b.isbn = b3.isbn);

-- INSERT文 実行後の結果を確認
SELECT *
  FROM b3
 ORDER BY isbn ASC;

/* リスト9-42 NOT INの実行計画 */
EXPLAIN ANALYZE
SELECT title,
       sub_genre_id
  FROM book
 WHERE sub_genre_id NOT IN
       (SELECT id
          FROM sub_genre
         WHERE genre_id = '06');

/* リスト9-44 EXISTSの実行計画 */
EXPLAIN ANALYZE
SELECT title, sub_genre_id
  FROM book AS b
 WHERE NOT EXISTS
       (SELECT 1
          FROM sub_genre AS s
         WHERE genre_id = '06'
           AND b.sub_genre_id = s.id);

/* リスト9-46 NOT EXISTSをJOINで書き換え */
SELECT title,
       sub_genre_id
  FROM book b
  LEFT JOIN sub_genre s
    ON b.sub_genre_id = s.id
 WHERE s.genre_id != '06';
