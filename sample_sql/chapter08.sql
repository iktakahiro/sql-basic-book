/* リスト8-1 book テーブルの sub_genre_id を確認 */
SELECT isbn,
       sub_genre_id
  FROM book
 ORDER BY published_at DESC
 LIMIT 5;

/* リスト8-4 sub_genreテーブルの行を取得 */
SELECT id,
       name
  FROM sub_genre
 ORDER BY id ASC
 LIMIT 7;

/* リスト8-6 bookテーブルとsub_genreテーブルを結合 */
SELECT book.title,
       book.sub_genre_id,
       sub_genre.name
  FROM book
  LEFT OUTER JOIN sub_genre
    ON book.sub_genre_id = sub_genre.id
 ORDER BY book.published_at
 LIMIT 5;

/* リスト8-9 サブジャンルID 0307の名称取得 */
SELECT id,
       name
  FROM sub_genre
 WHERE id = '0307';

/* リスト8-11 サブジャンルID 0307の件数を取得 */
SELECT COUNT(isbn)
  FROM book
 WHERE sub_genre_id = '0307';

/* リスト8-13 存在しないsub_genre_idを登録 (Error) */
INSERT INTO book (isbn, title, sub_genre_id, price, url, published_at, created_at, updated_at)
VALUES ('0', '書籍名', '9999', 1000, '-', '2020-07-07', NOW(), NOW());

/* リスト8-15 LEFT OUTER JOINの例 その1 */
SELECT book.title,
       book.sub_genre_id,
       sub_genre.name
  FROM book
  LEFT OUTER JOIN sub_genre -- JOIN句
    ON book.sub_genre_id = sub_genre.id -- ON句（結合条件）
 ORDER BY book.published_at ASC
 LIMIT 5;

/* リスト8-16 テーブル名を指定せずに列を指定 (Error) */
SELECT title,
       name,
       created_at
  FROM book
  LEFT OUTER JOIN sub_genre
    ON book.sub_genre_id = sub_genre.id
 ORDER BY book.published_at ASC
 LIMIT 5;

/* リスト8-18 LEFT JOINの例 その2 */
SELECT b.title, -- book テーブルのエイリアス b を付与した列名
       b.sub_genre_id,
       s.name AS sub_genre_name -- 列にわかりやすいエイリアスを付与
  FROM book AS b -- テーブルにエイリアスを付与
  LEFT JOIN sub_genre AS s -- テーブルにエイリアスを付与
    ON b.sub_genre_id = s.id
 ORDER BY b.published_at ASC
 LIMIT 5;

/* リスト8-19 LEFT JOINの例（ASの省略） */
SELECT b.title,
       b.sub_genre_id,
       s.name sub_genre_name
  FROM book b -- テーブルにエイリアスを付与 (AS省略)
  LEFT JOIN sub_genre s -- テーブルにエイリアスを付与 (AS省略)
    ON b.sub_genre_id = s.id
 ORDER BY b.published_at ASC
 LIMIT 5;

/* リスト8-20 ISBNコードごとの平均スコアを取得 */
SELECT isbn,
       ROUND(AVG(score), 2) AS average
  FROM rating
 GROUP BY isbn
 ORDER BY isbn ASC
 LIMIT 5;

/* リスト8-22 bookとratingをLEFT JOIN */
SELECT b.isbn,
       b.title,
       ROUND(AVG(score), 2) AS average
  FROM book AS b
  LEFT JOIN rating AS r
 USING (isbn)
 GROUP BY b.isbn
 ORDER BY b.isbn ASC
 LIMIT 5;

/* リスト8-24 bookとratingをRIGHT JOIN */
SELECT b.isbn,
       b.title,
       ROUND(AVG(score), 2) AS average
  FROM book AS b
 RIGHT JOIN rating AS r -- RIGHT OUTER JOIN を使用
 USING (isbn)
 GROUP BY b.isbn
 ORDER BY b.isbn ASC
 LIMIT 5;

/* リスト8-26 bookとratingをFULL JOIN */
SELECT b.isbn,
       b.title,
       ROUND(AVG(score), 2) AS average
  FROM book AS b
  FULL JOIN rating AS r -- FULL OUTER JOIN を使用
 USING (isbn)
 GROUP BY b.isbn
 ORDER BY b.isbn ASC
 LIMIT 5;

/* リスト8-28 一致しない結合条件を指定 */
SELECT b.isbn,
       b.title,
       ROUND(AVG(score), 2) AS average
  FROM book AS b
  LEFT JOIN rating AS r
    ON b.title = r.isbn
 GROUP BY b.isbn
 ORDER BY b.isbn ASC
 LIMIT 5;

/* リスト8-30 FULL JOINの例 */
SELECT g.id AS genre_id,
       s.id AS sub_genre_id
  FROM genre g
  FULL JOIN sub_genre s ON g.id = s.id -- この条件では 1行も一致しない
 ORDER BY g.id ASC, s.id ASC
 LIMIT 6
OFFSET 9;

/* リスト8-32 FULL JOINをLEFT JOINに変更 */
SELECT g.id AS genre_id,
       s.id AS sub_genre_id
  FROM genre g
  LEFT JOIN sub_genre s ON g.id = s.id -- この条件では 1行も一致しない
 ORDER BY g.id ASC, s.id ASC
 LIMIT 6
OFFSET 9;

/* リスト8-34 sub_genreテーブルの確認 */
SELECT id,
       genre_id
  FROM sub_genre
 ORDER BY genre_id, id ASC
 LIMIT 5;

/* リスト8-36 genreテーブルの確認 */
SELECT id,
       name
  FROM genre
 ORDER BY id
 LIMIT 5;

/* リスト8-38 3テーブルの結合 */
SELECT b.isbn, -- book テーブルから取得
       g.name AS genre_name, -- genre テーブルから取得
       s.name AS sub_genre_name -- sub_genre テーブルから取得
  FROM book AS b
  LEFT JOIN sub_genre AS s
    ON b.sub_genre_id = s.id
  LEFT JOIN genre AS g -- 2つ目の JOIN句
    ON s.genre_id = g.id -- 2つ目の JOIN句 の結合条件
 ORDER BY b.published_at ASC
 LIMIT 5;

/* リスト8-40 genreテーブルとsub_genreテーブルを外部結合 */
SELECT g.id AS genre_id,
       g.name AS genre_name,
       s.id AS sub_genre_id,
       s.name AS sub_genre_name
  FROM genre AS g
  LEFT JOIN sub_genre AS s
    ON g.id = s.genre_id
 ORDER BY sub_genre_id ASC, genre_id ASC
 LIMIT 3;

/* リスト8-42 JOIN句とWHERE句を併用 */
SELECT g.id AS genre_id,
       g.name AS genre_name,
       s.id AS sub_genre_id,
       s.name AS sub_genre_name
  FROM genre AS g
  LEFT JOIN sub_genre AS s
    ON g.id = s.genre_id
 WHERE s.id = '0101' -- WHERE句 を追加
 ORDER BY sub_genre_id ASC, genre_id ASC
 LIMIT 3;

/* リスト8-44 JOIN句に絞り込み条件を付与 */
SELECT g.id AS genre_id,
       g.name AS genre_name,
       s.id AS sub_genre_id,
       s.name AS sub_genre_name
  FROM genre AS g
  LEFT JOIN sub_genre AS s
    ON g.id = s.genre_id
   AND s.id = '0101' -- AND句 を追加
 ORDER BY sub_genre_id ASC, genre_id ASC
 LIMIT 3;

/* リスト8-46 INNER JOINを使ってbookとratingを結合 */
SELECT b.isbn,
       b.title,
       ROUND(AVG(score), 2) AS average
  FROM book AS b
 INNER JOIN rating AS r
 USING (isbn)
 GROUP BY b.isbn
 ORDER BY b.isbn ASC
 LIMIT 5;

/* リスト8-48 genreテーブルとsub_genreテーブルを内部結合 */
SELECT g.id AS genre_id,
       g.name AS genre_name,
       s.id AS sub_genre_id,
       s.name AS sub_genre_name
  FROM genre AS g
 INNER JOIN sub_genre AS s on g.id = s.genre_id
 ORDER BY g.id ASC, s.id ASC
 LIMIT 5;

/* リスト8-50 条件に一致しないINNER JOIN */
SELECT g.id AS genre_id,
       g.name AS genre_name,
       s.id AS sub_genre_id,
       s.name AS sub_genre_name
  FROM genre AS g
 INNER JOIN sub_genre AS s on g.id = s.name -- この条件では 1行も一致しない
 ORDER BY g.id ASC, s.id ASC
 LIMIT 5;

/* リスト8-52 INNER JOIN を使わない内部結合 */
SELECT g.id AS genre_id,
       g.name AS genre_name,
       s.id AS sub_genre_id,
       s.name AS sub_genre_name
  FROM genre AS g,
       sub_genre AS S
 WHERE g.id = s.genre_id
 ORDER BY g.id ASC, s.id ASC
 LIMIT 5;

/* リスト8-54 自己内部結合を利用した組み合わせの取得 */
SELECT t1.id AS id_1,
       t1.title AS title_1,
       t2.id AS id_2,
       t2.title AS title_2
  FROM b1 AS t1
 INNER JOIN b1 AS t2
    ON t1.id != t2.id
 ORDER BY t1.id ASC, t2.id ASC
 LIMIT 8;
