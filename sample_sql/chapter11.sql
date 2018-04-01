/* リスト11-3 データベースmy_dbを作成 */
CREATE DATABASE my_db;

/* リスト11-5 データベースをmy_dbに切り替え */
\c my_db

/* リスト11-6 データベースmy_dbを削除(Error) */
DROP DATABASE my_db;

/* リスト11-7 データベースpostgresに切り替え */
\c postgres

DROP DATABASE my_db;

/* リスト11-9 IF EXISTSを使用 */
\c postgres

-- データベースの有無に関わらず、DROP DATABASE はエラーにならない
DROP DATABASE IF EXISTS my_db; 
CREATE DATABASE my_db;

/* リスト11-10 my_dbの作成 */
\c postgres
DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db;
\c my_db

/* リスト11-11 my_bookテーブルを作成 */
CREATE TABLE my_book (
  isbn  VARCHAR(13) PRIMARY KEY,
  title VARCHAR(191),
  price INT
);

/* リスト11-15 my_bookテーブルにSELECT文を実行 */
SELECT *
  FROM my_book;

/* リスト11-17 my_bookテーブルを削除 */
DROP TABLE my_book;

/* リスト11-18 IF (NOT) EXISTS を指定してテーブル作成 */
DROP TABLE IF EXISTS my_book;

CREATE TABLE IF NOT EXISTS my_book (
  isbn  VARCHAR(13) PRIMARY KEY,
  title VARCHAR(191)
);

/* リスト11-19 title列に初期値を指定 */
DROP TABLE IF EXISTS my_book;

CREATE TABLE IF NOT EXISTS my_book (
  isbn  VARCHAR(13) PRIMARY KEY,
  title VARCHAR(191) DEFAULT 'タイトル未定' -- 初期値を指定
);

/* リスト11-20 NOT NULL制約を付与する */
DROP TABLE IF EXISTS my_book;

CREATE TABLE my_book (
  id INT NOT NULL
);

/* リスト11-21 NOT NULL制約に対しNULLをINSERT */
INSERT INTO my_book (id)
VALUES (NULL);

/* リスト11-23 UNIQUE制約を付与する */
DROP TABLE IF EXISTS my_book;

CREATE TABLE my_book (
  id INT UNIQUE
);

/* リスト11-24 UNIQUE制約に対し重複した値をINSERT */
INSERT INTO my_book (id)
VALUES (1),
       (1);

/* リスト11-26 UNIQUE制約に対しNULLをINSERT */
INSERT INTO my_book (id)
VALUES (NULL),
       (NULL);

/* リスト11-27 UNIQUE制約とNOT NULL制約を同時に付与 */
DROP TABLE IF EXISTS my_book;

CREATE TABLE my_book (
  id INT UNIQUE NOT NULL
);

/* リスト11-28 PRIMARY KEY列を持つテーブルを作成 */
DROP TABLE IF EXISTS my_book;

CREATE TABLE my_book (
  isbn VARCHAR(13) PRIMARY KEY
);

/* リスト11-29 PRIMARY KEY 列に重複データをINSERT */
INSERT INTO my_book (isbn)
VALUES (1),
       (1);

/* リスト11-31 PRAIMARY KEYの列に空文字を登録 */
INSERT INTO my_book (isbn)
VALUES ('');

/* リスト11-32 FOREIGN KEY列を持つテーブルを作成 */
-- ジャンルマスタを作成
DROP TABLE IF EXISTS my_genre;

CREATE TABLE my_genre (
  id   VARCHAR(2) PRIMARY KEY,
  name VARCHAR(191) NOT NULL
);

/* 書籍マスタを作成 */
DROP TABLE IF EXISTS my_book;

CREATE TABLE my_book (
  id       VARCHAR(8) PRIMARY KEY,
  genre_id VARCHAR(2),
           FOREIGN KEY (genre_id) REFERENCES my_genre (id)
);

/* リスト11-33 my_genreテーブルに存在しないgenre_idを含む行をINSERT */
INSERT INTO my_book (id, genre_id)
VALUES ('ABC', '01');

/* リスト11-35 my_genreテーブルとmy_bookテーブルにINSERT */
-- 先に my_genre テーブルに行を挿入
INSERT INTO my_genre (id, name)
VALUES ('01', 'パソコン');

INSERT INTO my_book (id, genre_id)
VALUES ('ABC', '01');

/* リスト11-36 my_bookが外部キー参照している行を削除 */
DELETE FROM my_genre
 WHERE id = '01';

/* リスト11-38 ON DELETEとON UPDATEを指定 */
DROP TABLE IF EXISTS my_book;

CREATE TABLE my_book (
  id       VARCHAR(8) PRIMARY KEY,
  genre_id VARCHAR(2) NOT NULL,
           FOREIGN KEY (genre_id) REFERENCES my_genre (id)
           ON DELETE CASCADE
           ON UPDATE RESTRICT
);

-- データを挿入
INSERT INTO my_book (id, genre_id)
VALUES ('ABC', '01');

/* リスト11-39 ON DELETEとON UPDATEオプションを指定した後のDELETE */
DELETE FROM my_genre
 WHERE id = '01';

-- 削除後のテーブルを確認
SELECT *
  FROM my_book;

/* リスト11-41 CHECK制約を指定して0より大きい値に制限 */
DROP TABLE IF EXISTS my_book;
CREATE TABLE my_book (
  price INT NOT NULL CHECK (price > 0)
);

INSERT INTO my_book (price)
VALUES (-1200); -- 0 より大きい値ではないため、INSERT できない

/* リスト11-43 ratingテーブルのisbn列にインデックスを作成 */
\c learning_sql
CREATE INDEX idx_rating__user_id
    ON rating(user_id);

/* リスト11-45 インデックスが付与されたuser_idを検索条件に指定 */
SELECT *
  FROM rating
 WHERE user_id = '1ca34a7a'
 ORDER BY created_at DESC
 LIMIT 5;

/* リスト11-46 実行計画を確認するEXPLAINの利用例 */
EXPLAIN
SELECT *
  FROM rating
 WHERE id = 1;

/* リスト11-48 リスト11-45の実行結果の確認 */
EXPLAIN
SELECT *
  FROM rating
 WHERE user_id = '1d109c51'
 ORDER BY created_at DESC;

/* リスト11-50 実行計画と実測値の確認 */
EXPLAIN ANALYZE SELECT *
FROM rating
WHERE user_id = '1d109c51'
ORDER BY created_at DESC;

/* リスト11-50 実行計画と実測値の確認 */
EXPLAIN ANALYZE
SELECT *
  FROM rating
 WHERE user_id = '1d109c51'
 ORDER BY created_at DESC;

/* リスト11-52 created_atにインデックスがない状態でのソートの実行計画 */
EXPLAIN ANALYZE
SELECT *
  FROM rating
 ORDER BY created_at
 DESC LIMIT 5;

/* リスト11-54 created_atにインデックスがある状態でのソートの実行計画 */
CREATE INDEX idx_rating__created_at
    ON rating(created_at);

EXPLAIN ANALYZE
SELECT *
FROM rating
ORDER BY created_at
DESC LIMIT 5;

/* リスト11-56 インデックス「idx_rating__user_id」の削除 */
DROP INDEX idx_rating__user_id;

/* リスト11-57 インデックスrating_pkeyの削除 */
DROP INDEX rating_pkey;


/* リスト11-59 usre_idとisbnで絞り込み */
SELECT *
  FROM rating
 WHERE user_id = '1d109c51'
   AND isbn > '9784774145587';

/* リスト11-60 複合インデックスの作成 */
CREATE INDEX idx_rating__user_id__isbn
    ON rating (user_id, isbn);

/* リスト11-61 データベースとテーブルの準備 */
\c postgres
DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db;

\c my_db
CREATE TABLE my_book (
  id VARCHAR(10)
);

/* リスト11-63 テーブル名を変更する */
ALTER TABLE my_book RENAME TO favorite_book;

/* リスト11-66 列を追加する */
ALTER TABLE favorite_book
  ADD COLUMN created_at BIGINT NOT NULL;

/* リスト11-68 列を削除する */
ALTER TABLE favorite_book
DROP COLUMN created_at;

/* リスト11-70 列名の変更 */
ALTER TABLE favorite_book RENAME COLUMN id TO isbn;

/* リスト11-72 列のデータ型を変更する */
ALTER TABLE favorite_book
ALTER COLUMN isbn TYPE VARCHAR(13);

/* リスト11-73 不整合の生じるデータ型の変更を行う */
-- 13文字 からなる文字列を登録
INSERT INTO favorite_book (isbn)
VALUES ('9784774191690');

-- VARCHAR(10) に変更
ALTER TABLE favorite_book
ALTER COLUMN isbn TYPE VARCHAR(10);

/* リスト11-75 UNIQUE制約の追加 */
ALTER TABLE favorite_book
  ADD CONSTRAINT unique_favorite_book__isbn UNIQUE(isbn);

/* リスト11-76 CHECK制約の追加 */
ALTER TABLE favorite_book
  ADD CONSTRAINT check_favorite_book__isbn CHECK (isbn <> '');

/* リスト11-77 NOT NULL制約の追加 */
ALTER TABLE favorite_book
ALTER COLUMN isbn SET NOT NULL;

/* リスト11-78 UNIQUE制約の削除 */
ALTER TABLE favorite_book
 DROP CONSTRAINT unique_favorite_book__isbn;

/* リスト11-80 CHECK制約の削除 */
ALTER TABLE favorite_book
 DROP CONSTRAINT check_favorite_book__isbn;

/* リスト11-81 NOT NULL制約の削除 */
ALTER TABLE favorite_book
ALTER COLUMN isbn DROP NOT NULL;

/* リスト11-82 制約の変更と列の追加を同時に行う */
ALTER TABLE favorite_book
ALTER COLUMN isbn SET NOT NULL,
  ADD COLUMN created_at BIGINT;

/* リスト11-83 VIEWの作成 */
\c learning_sql
CREATE VIEW book_genre_view AS
SELECT b.isbn,
       b.title,
       g.id AS genre_id,
       g.name AS genre_name
  FROM book AS b
  LEFT JOIN sub_genre AS s
    ON b.sub_genre_id = s.id
  LEFT JOIN genre AS g
    ON s.genre_id = g.id
 ORDER BY b.isbn ASC;

/* リスト11-84 VIEWの参照 */
SELECT *
  FROM book_genre_view
 LIMIT 5;

/* リスト11-86 VIEWに対してWHERE句を使用 */
SELECT *
  FROM book_genre_view
 WHERE genre_id = '03'
 ORDER BY isbn
 LIMIT 5;

/* リスト11-88 VIEWを利用したSELECT文の実行計画を確認 */
EXPLAIN
SELECT *
  FROM book_genre_view;

/* リスト11-90 VIEWを変更するために再度CREATE VIEWを実行 (Error) */
CREATE VIEW book_genre_view AS
SELECT b.isbn,
       b.title,
       g.id AS genre_id,
       g.name AS genre_name
  FROM book AS b
  LEFT JOIN sub_genre AS s
    ON b.sub_genre_id = s.id
  LEFT JOIN genre AS g
    ON s.genre_id = g.id
 WHERE g.id IN ('03', '06')
 ORDER BY b.isbn ASC;

/* リスト11-92 既存のVIEWを変更 */
CREATE OR REPLACE VIEW book_genre_view AS
SELECT b.isbn,
       b.title,
       g.id AS genre_id,
       g.name AS genre_name
  FROM book AS b
  LEFT JOIN sub_genre AS s
    ON b.sub_genre_id = s.id
  LEFT JOIN genre AS g
    ON s.genre_id = g.id
 WHERE g.id IN ('03', '06')
 ORDER BY b.isbn ASC;

/* リスト11-93 VIEW「book_genre_view」を削除 */
DROP VIEW book_genre_view;

/* リスト11-94 テーブル名や列名に日本語を利用 */
CREATE TABLE "書籍マスタ" (
  "ISBNコード" VARCHAR(13) PRIMARY KEY
);
SELECT "ISBNコード"
  FROM "書籍マスタ";

/* リスト11-95 かなによる命名 */
CREATE TABLE shoseki (
  isbn VARCHAR(13) PRIMARY KEY
  namae VARCHAR(191),
  kakaku INT
);
