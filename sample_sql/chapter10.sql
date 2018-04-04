/* リスト10-1 ratingテーブルの内容を確認 */
SELECT *
  FROM rating
 ORDER BY id ASC
 LIMIT 5;

/* リスト10-3 DISTINCTを使ってスコアを重複なく取得 */
SELECT DISTINCT score
  FROM rating
 ORDER BY score DESC;

/* リスト10-5 sub_genre_idとpriceを取得 */
SELECT sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id IN ('1301', '0301')
 ORDER BY price ASC
 LIMIT 8;

/* リスト10-7 sub_genre_idとpriceを重複なく取得 */
SELECT DISTINCT sub_genre_id,
       price
       FROM book
 WHERE sub_genre_id IN ('1301', '0301')
 ORDER BY price ASC
 LIMIT 8;

/* リスト10-9 UNION句でSELECT文を組み合わせ */
SELECT id,
       title
  FROM b1
 UNION -- 上下の SELECT文 を組み合わせる
SELECT '0' AS id,
       'UNION句 入門' AS title
 ORDER BY id -- この ORDER BY句 によるソート は UNION 後の結果に対して行われる
 LIMIT 3; --このLIMIT句も UNION後の結果に対して適用される

/* リスト10-11 UNION前のSELECT文にORDER BY句を指定（実行不可）(Error) */
SELECT id,
       title
  FROM b1
 ORDER BY id -- ここではORDER BY句は指定できない
 UNION
SELECT '1' AS id,
       'UNION句 入門' AS title;

/* リスト10-12 UNIONと重複データ */
SELECT 'japan' AS country
 UNION
SELECT 'japan';

/* リスト10-14 UNION ALLと重複データ */
SELECT 'japan' AS country
 UNION ALL
SELECT 'japan';

/* リスト10-16 文字列の完全一致検索 */
SELECT isbn,
       title
  FROM book
 WHERE title = 'Pythonスタートブック';

/* リスト10-17 文字列の部分一致検索 */
SELECT isbn,
       title
  FROM book
 WHERE title LIKE 'Python%'
 ORDER BY isbn;

/* リスト10-19 文字列の部分一致検索 その2 */
SELECT isbn,
       title
  FROM book
 WHERE title LIKE '%ポケットリファレンス%'
 ORDER BY isbn
 LIMIT 5;

/* リスト10-20 タイトルの文字数が3文字よりも少ない書籍を取得する */
SELECT isbn,
       title
  FROM book
 WHERE LENGTH(title) < 3 -- WHERE句 の中で関数を利用
 ORDER BY isbn;

/* リスト10-22 UNIONを利用してTRUE／FALSEを在庫あり／なしに変換 */
SELECT isbn,
       is_stock,
       '在庫あり' AS stock
  FROM book
 WHERE is_stock IS TRUE
 UNION
SELECT isbn,
       is_stock,
       '在庫なし' AS stock
  FROM book
 WHERE is_stock IS FALSE
 ORDER BY isbn ASC
 LIMIT 7;

/* リスト10-24 在庫のTRUE／FALSEに基づいて表現を変更する */
SELECT isbn,
       is_stock, -- 確認のために元の列の値を取得
  CASE WHEN is_stock IS TRUE THEN '在庫あり'
       WHEN is_stock IS FALSE THEN '在庫なし'
       ELSE '不明'
   END AS stock
  FROM book
 ORDER BY isbn ASC
 LIMIT 7;

/* リスト10-27 スコアの値に基づいてテキストを変更する */
SELECT score,
  CASE WHEN score > 4.4 THEN '大満足'
       WHEN score BETWEEN 4.0 AND 4.4 THEN '満足'
       WHEN score IS NULL THEN '未評価'
       ELSE '普通'
   END AS satisfaction
  FROM rating
 ORDER BY isbn DESC
 LIMIT 5;

/* リスト10-29 価格の高い書籍上位3件の取得 */
SELECT isbn,
       sub_genre_id,
       price
  FROM book
 ORDER BY price DESC
 LIMIT 3;

/* リスト10-31 サブジャンルごとの価格の高い書籍上位3件の取得 */
SELECT isbn,
       sub_genre_id,
       price,
       rank
  FROM (SELECT *,
               RANK() OVER
               (PARTITION BY sub_genre_id ORDER BY price DESC) AS rank
          FROM book) as t
 WHERE rank <= 3
 LIMIT 15;

/* リスト10-34 サブジャンルID「0104」の価格ランキング - ギャップあり */
SELECT isbn,
       sub_genre_id,
       price,
       rank
  FROM (SELECT *,
               RANK() OVER
               (PARTITION BY sub_genre_id ORDER BY price DESC) AS rank
         FROM book) as t
 WHERE rank <= 3
   AND sub_genre_id = '0104'
 LIMIT 4;

/* リスト10-36 サブジャンルID「0104」の価格ランキング - ギャップなし */
SELECT isbn,
       sub_genre_id,
       price,
       rank
  FROM (SELECT *,
               DENSE_RANK() OVER
               (PARTITION BY sub_genre_id ORDER BY price DESC) AS rank
         FROM book) as t
 WHERE rank <= 3
  AND sub_genre_id = '0104'
 LIMIT 4;

/* リスト10-38 ROW_NUMBER()の例 */
SELECT isbn,
       sub_genre_id,
       price,
       row_number
  FROM (SELECT *,
               ROW_NUMBER() OVER
               (PARTITION BY sub_genre_id ORDER BY price DESC) AS row_number
         FROM book) as t
 WHERE row_number <= 3
 LIMIT 12;

/* リスト10-40 WITH句を使って書籍情報とサブジャンルの平均価格を取得 */
WITH sub AS (
  SELECT sub_genre_id,
         ROUND(AVG(price)) AS avg_price
    FROM book
   GROUP BY sub_genre_id
)
SELECT b.title,
       b.sub_genre_id,
       b.price,
       sub.avg_price
  FROM book b
  LEFT JOIN sub
    ON b.sub_genre_id = sub.sub_genre_id
 ORDER BY b.isbn
 LIMIT 5;

/* リスト10-42 INSERT時のデータ重複エラー */
INSERT INTO b2 (id)
VALUES (3),
       (3),
       (4);

/* リスト10-43 ON CONFLICT句を使用して重複エラーを無視 */
INSERT INTO b2 (id)
VALUES (3),
       (3),
       (4)
    ON CONFLICT (id) -- ISBNコードの重複時
    DO NOTHING; -- 何もしない（エラーを無視）

/* リスト10-44 INSERT文実行後の結果を確認 */
SELECT *
  FROM b2
 ORDER BY id ASC;

/* リスト10-46 ON CONFLICT句を使用してUPSERT */
INSERT INTO b2 (id, title)
VALUES (3, '既存行がなければ新規登録')
    ON CONFLICT (id) -- ISBNコードの重複時
    DO UPDATE SET title = '既存行があれば更新'; -- UPDATE を実行

/* リスト10-47 UPSERT実行後の結果を確認 */
SELECT *
  FROM b2
 ORDER BY id ASC;

/* リスト10-49 stockテーブルの初期状態を確認 */
SELECT *
  FROM stock;

START TRANSACTION; -- トランザクションの開始

-- 購買情報の挿入
INSERT INTO purchase_log (isbn, user_id, amount)
VALUES ('1', 'user1', 3240);

-- この時点での purchase_log の状態を確認
SELECT isbn,
       user_id,
       amount
  FROM purchase_log;

-- 在庫情報の更新
UPDATE stock
   SET quantity = quantity - 1,
       updated_at = CURRENT_TIMESTAMP
 WHERE isbn = '1';

-- この時点での stock の状態を確認
SELECT isbn,
       quantity
  FROM stock;

ROLLBACK; -- ロールバックしてトランザクションを終了

/* リスト10-54 ロールバック後のpurchase_logテーブル */
SELECT isbn,
       user_id,
       amount
  FROM purchase_log;

/* リスト10-56 ロールバック後のstockテーブル */
SELECT isbn,
       quantity
  FROM stock;

/* リスト10-58 コミットを行う */
START TRANSACTION;

INSERT INTO purchase_log (isbn, user_id, amount)
VALUES ('1', 'user1', 3240);

-- 在庫情報の更新
UPDATE stock
   SET quantity = quantity - 1,
       updated_at = CURRENT_TIMESTAMP
 WHERE isbn = '1';

COMMIT; -- コミットしてトランザクションを終了

/* リスト10-59 コミット後のpurchase_logテーブル */
SELECT isbn,
       user_id,
       amount
  FROM purchase_log;

/* リスト10-61 コミット後のstockテーブル */
SELECT isbn,
       quantity
  FROM stock;
