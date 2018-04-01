/* 3-2 */

SELECT id
  FROM b1;

/* 3-4 */

SELECT title
  FROM b1;

/* 3-6 */

SELECT id,
       title
  FROM b1;

/* 3-8 */

SELECT id,
       title, -- このカンマは不要
  FROM b1;

/* 3-10 */

SELECT title,
       id
  FROM b1;

/* 3-12 */

SELECT *
  FROM b1;

/* 3-14 */

SELECT id
  FROM b1;

/* 3-15 */

SELECT id
  FROM b1
 LIMIT 3;

/* 3-18 */

SELECT id
  FROM b1
 LIMIT 1;

/* 3-20 */

SELECT id
  FROM b1
 LIMIT 99;

/* 3-22 */

SELECT isbn,
       title,
       published_at
  FROM book
 ORDER BY published_at
 LIMIT 3;

/* 3-24 */

SELECT isbn,
       title,
       published_at
  FROM book
 ORDER BY published_at DESC
 LIMIT 3;

/* 3-26 */

SELECT isbn,
       title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 3;

/* 3-27 */

SELECT title,
       price,
       published_at
  FROM book
 ORDER BY price ASC
 LIMIT 5;

/* 3-29 */

SELECT title,
       price,
       published_at
  FROM book
 ORDER BY price ASC,
          published_at DESC
 LIMIT 5;

/* 3-34 */

SELECT isbn,
       title
  FROM book
 WHERE isbn = '9784774183671';

/* 3-35 */

SELECT isbn,
       title,
       price
  FROM book
 WHERE price > 1000
 ORDER BY price ASC
 LIMIT 3;

/* 3-41 */

SELECT isbn,
       title,
       price
  FROM book
 ORDER BY price ASC
 LIMIT 3; 

/* 3-43 */

SELECT title,
       price
  FROM book
 WHERE price >= 398
 ORDER BY price ASC
 LIMIT 3;

/* 3-45 */

SELECT title,
       price
  FROM book
 WHERE price < 400
 ORDER BY price ASC
 LIMIT 3;

/* 3-47 */

SELECT title,
       price
  FROM book
 WHERE price <= 400
 ORDER BY price ASC
 LIMIT 3;

/* 3-49 */

SELECT title,
       price
  FROM book
 WHERE price != 400
 ORDER BY price ASC
 LIMIT 3;

/* 3-51 */

SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE price > 1000
   AND sub_genre_id = '0603'
 ORDER BY price ASC
 LIMIT 3;

/* 3-55 */

SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id = '0603'
    OR sub_genre_id = '0601'
 ORDER BY price ASC
 LIMIT 3;

/* 3-60 */

SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id = '0603'
    OR sub_genre_id = '0601'
    OR sub_genre_id = '0501'
 ORDER BY price ASC
 LIMIT 3;

/* 3-61 */

SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id = '0603'
    OR sub_genre_id = '0601'
   AND price = 2000
 ORDER BY published_at DESC
 LIMIT 3;

/* 3-66 */

SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE (sub_genre_id = '0603' OR sub_genre_id = '0601')
   AND price = 2000
 ORDER BY published_at DESC
 LIMIT 3;

/* 3-68 */

SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id = '0603'
   AND price = 2180
    OR sub_genre_id = '0601'
   AND price = 2000
 ORDER BY published_at DESC
 LIMIT 3;

/* 3-71 */

SELECT title,
       price,
       published_at
  FROM book
 WHERE price >= 2500
   AND price <= 3000
 ORDER BY published_at DESC
 LIMIT 3;

/* 3-72 */

SELECT title,
       price,
       published_at
  FROM book
 WHERE price BETWEEN 2500 AND 3000
 ORDER BY published_at DESC
 LIMIT 3;

/* 3-74 */

SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE price BETWEEN 2500 AND 3000
   AND sub_genre_id = '0603'
 ORDER BY published_at DESC
 LIMIT 3;

/* 3-76 */

SELECT title,
       price,
       published_at
  FROM book
 WHERE price BETWEEN 2500 AND 3000
   AND published_at BETWEEN '2017-05-01' AND '2017-05-31'
 ORDER BY published_at ASC
 LIMIT 3;

/* 3-78 */

SELECT title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 4;

/* 3-80 */

SELECT title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 4
OFFSET 2;

/* 3-82 */

SELECT title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 4
OFFSET 1;

/* 3-84 */

SELECT *
  FROM b1
 ORDER BY id ASC
 LIMIT 2;

/* 3-86 */

SELECT *
  FROM b1
 WHERE id > 2
 ORDER BY id ASC
 LIMIT 2;

/* リスト4-1 データ登録前のb2テーブルを確認 */
SELECT *
 FROM b2
ORDER BY published_at DESC;

/* リスト4-3 基本的なINSERT文 */
INSERT INTO b2 (id, title, published_at)
VALUES ('1', 'Pythonエンジニア ファーストブック', '2017-09-09');

/* リスト4-5 INSERT文を実行し、結果を確認 */
INSERT INTO b2 (id, title, published_at)
VALUES ('1', 'Pythonエンジニア ファーストブック', '2017-09-09');
-- INSERT文 実行後の結果を確認
SELECT *
  FROM b2;

/* リスト4-7 列の指定を省略したINSERT文 */
INSERT INTO b2
VALUES ('2', 'Chainerで学ぶディープラーニング入門', '2017-09-14');
-- INSERT文 実行後の結果を確認
SELECT *
  FROM b2
 ORDER BY id DESC;

/* リスト4-9 列の指定順序を入れ替えたINSERT文 */
INSERT INTO b2 (published_at, id, title)
VALUES ('2017-09-14', '3', 'Angular アプリケーションプログラミング');
-- INSERT文 実行後の結果を確認
SELECT *
  FROM b2
 ORDER BY id DESC;

/* リスト4-11 値の指定を省略したINSERT文 */
INSERT INTO b2 (id)
VALUES ('4');
-- INSERT文 実行後の結果を確認
SELECT *
  FROM b2
 ORDER BY published_at DESC;

/* リスト4-13 VALUES句の値の数が足りないINSERT文 (Error)*/
INSERT INTO b2 (id, title, published_at)
VALUES ('5', '2017-09-09');

/* リスト4-15 省略できない列を省略したINSERT文 */
INSERT INTO b2 (published_at)
VALUES ('2017-09-09');

/* リスト4-17 すでに存在するIDを指定したINSERT文 */
INSERT INTO b2 (id)
VALUES ('1');

/* リスト4-19 複数の行を一度に挿入するINSERT文 */
INSERT INTO b2(id, title, published_at)
VALUES ('5', 'ビジュアル 高校数学大全' , '2017-09-26'),
       ('6', 'ねこ手帳 2018' , '2017-09-12');
-- INSERT文 実行後の結果を確認
SELECT *
  FROM b2
 ORDER BY id DESC
 LIMIT 5;

/* リスト4-21 データ更新前のb2テーブルを確認 */
SELECT *
  FROM b2
 ORDER BY published_at DESC;

/* リスト4-23 基本的なUPDATE文 */
UPDATE b2
   SET title = 'SQL 入門（仮）'
 WHERE title = 'タイトル未定';

/* リスト4-25 タイトルを更新するUPDATE文 */
UPDATE b2
   SET title = 'SQL 入門（仮）'
 WHERE title = 'タイトル未定';

-- UPDATE文 実行後の結果を確認
SELECT *
  FROM b2
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト4-27 複数の列値を更新するUPDATE文 */
UPDATE b2
   SET title = 'データベース入門（仮）', published_at = '2017-12-25'
 WHERE id = '4';

-- UPDATE文 実行後の結果を確認
SELECT *
  FROM b2
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト4-29 b2テーブルを確認 */
SELECT *
  FROM b2
 ORDER BY id ASC;

/* リスト4-31 基本的なDELETE文 */
DELETE
  FROM b2
 WHERE published_at = '2017-12-25';

/* リスト4-33 DELETE文を使った行削除 */
DELETE
  FROM b2
 WHERE published_at = '2017-12-25';

-- DELETE文 実行後の結果を確認
SELECT *
  FROM b2
 ORDER BY id ASC;

/* リスト4-35 SELECT文で削除対象の行を確認 */
SELECT *
  FROM b2
 WHERE published_at > '2017-09-10'
 ORDER BY published_at DESC;

/* リスト4-37 DELETE文を使って行削除 2 */
DELETE
  FROM b2
 WHERE published_at > '2017-09-10';

-- DELETE文 実行後の結果を確認
SELECT *
  FROM b2;

/* リスト5-1 データ型確認のための SELECT */
SELECT sub_genre_id, title, price, published_at
 FROM book
ORDER BY published_at ASC
LIMIT 2;

/* リスト5-3 テーブル定義を確認するコマンド */
\d book

/* リスト5-5 type_charテーブルの定義を確認 */
\d type_char

/* リスト5-7 country_code列に「jpn」を登録 */
INSERT INTO type_char (country_code)
VALUES ('jpn');

/* リスト5-8 country_codeに「japan」を登録 */
INSERT INTO type_char (country_code)
VALUES ('japan');

/* リスト5-10 country_code に「jp」を登録 */
INSERT INTO type_char (country_code)
VALUES ('jp');

-- INSERT文 実行後の結果を確認
SELECT id,
       country_code
  FROM type_char
 WHERE country_code IS NOT NULL
 ORDER BY id ASC;

/* リスト5-12 country_nameに「日本」を登録 */
INSERT INTO type_char (country_name)
VALUES ('日本');

-- INSERT文 実行後の結果を確認
SELECT id,
       country_name
  FROM type_char
 WHERE country_name IS NOT NULL
 ORDER BY id ASC;

/* リスト5-14 country_nameに数値の1を登録 */
INSERT INTO type_char (country_name)
VALUES (1);

-- INSERT文 実行後の結果を確認
SELECT id,
       country_name
  FROM type_char
 WHERE country_name IS NOT NULL
 ORDER BY id ASC;

/* リスト5-16 country_name = 1で検索 */
SELECT id,
       country_name
  FROM type_char
 WHERE country_name = 1;

/* リスト5-18 country_name = '1' で検索 */
SELECT id,
       country_name
  FROM type_char
 WHERE country_name = '1';

/* リスト5-20 type_numericテーブルの定義を確認 */
\d type_numeric

/* リスト5-22 priceに2000を登録 */
INSERT INTO type_numeric (price)
VALUES (2000);

-- INSERT文 実行後の結果を確認
SELECT id,
       price
  FROM type_numeric
 WHERE price IS NOT NULL
 ORDER BY id ASC;

/* リスト5-24 priceに40000を登録 (Error) */
INSERT INTO type_numeric (price)
VALUES (40000);

/* リスト5-26 priceに2.5を登録 */
INSERT INTO type_numeric (price)
VALUES (2.5);

-- INSERT文 実行後の結果を確認
SELECT id,
       price
  FROM type_numeric
 WHERE price IS NOT NULL
 ORDER BY id ASC;

/* リスト5-28 weightに6桁の数値を登録 */
INSERT INTO type_numeric (weight)
VALUES (50.1234);

-- INSERT文 実行後の結果を確認
SELECT id,
       weight
  FROM type_numeric
 WHERE weight IS NOT NULL
 ORDER BY id ASC;

/* リスト5-30 weightに7桁の数値を登録 */
INSERT INTO type_numeric (weight)
VALUES (50.12345);

-- INSERT文 実行後の結果を確認
SELECT id,
       weight
  FROM type_numeric
 WHERE weight IS NOT NULL
 ORDER BY id ASC;

/* リスト5-32 weightに整数を登録 */
INSERT INTO type_numeric (weight)
VALUES (123456), (1234567);

-- INSERT文 実行後の結果を確認
SELECT id,
       weight
  FROM type_numeric
 WHERE weight > 100000
 ORDER BY id ASC;

/* リスト5-34 ratingに数値を登録 */
INSERT INTO type_numeric (rating)
VALUES (4.5), (4.27);

-- INSERT文 実行後の結果を確認
SELECT id,
       rating
  FROM type_numeric
 WHERE rating IS NOT NULL
 ORDER BY id ASC;

/* リスト5-36 ratingに3桁の数値を登録 */
INSERT INTO type_numeric (rating)
VALUES (10.5);

/* リスト5-39 id列の確認 */
SELECT id
  FROM type_numeric
 ORDER BY id DESC
 LIMIT 3;

/* リスト5-41 連番型列へ値を指定して登録 */
-- id の値を指定した INSERT文
INSERT INTO type_numeric (id, price)
VALUES (12, 120);

-- id の値を指定しない INSERT文
INSERT INTO type_numeric (price)
VALUES (150);

-- INSERT文 実行後の結果を確認
SELECT id,
       price
  FROM type_numeric
 ORDER BY id DESC
 LIMIT 3;

/* リスト5-43 シーケンスtype_numeric_id_seqの状態を確認 */
SELECT last_value
  FROM type_numeric_id_seq;

/* リスト5-45 シーケンス値の調整 */
SELECT SETVAL('type_numeric_id_seq', 12);

-- シーケンスの調整結果を確認
SELECT last_value
  FROM type_numeric_id_seq;

/* リスト5-47 type_dateテーブルの定義を確認 */
\d type_date

/* リスト5-49 published_atに日付を登録 */
INSERT INTO type_date (published_at)
VALUES ('2020-07-07'),
       ('2020/12/24'),
       ('January 1, 2020');

-- INSERT文 実行後の結果を確認
SELECT id,
       published_at
  FROM type_date
 WHERE published_at IS NOT NULL
 ORDER BY id ASC;

/* リスト5-51 存在しない日付を登録 (Error) */
INSERT INTO type_date (published_at)
VALUES ('2020-01-35');

/* リスト5-52 started_atに時刻を登録 */
INSERT INTO type_date (started_at)
VALUES ('12:30'),
       ('13:01:05'),
       ('02:15 PM');

-- INSERT文 実行後の結果を確認
SELECT id,
       started_at
  FROM type_date
 WHERE started_at IS NOT NULL
 ORDER BY id ASC;

/* リスト5-54 updated_atにタイムスタンプを登録 */
INSERT INTO type_date (updated_at)
VALUES ('2020-07-07 13:45:32.15'),
       ('2020/12/24 07:00 PM');

-- INSERT文 実行後の結果を確認
SELECT id,
       updated_at
  FROM type_date
 WHERE updated_at IS NOT NULL
 ORDER BY id ASC;

/* リスト5-56 updated_at_tz にタイムスタンプを登録 */
INSERT INTO type_date (updated_at_tz)
VALUES ('2020-07-07 13:45:32.15'),
       ('2020/12/24 07:00 PM');

-- INSERT文 実行後の結果を確認
SELECT id,
       updated_at_tz
  FROM type_date
 WHERE updated_at_tz IS NOT NULL
 ORDER BY id ASC;

/* リスト5-58 SHOW TIMEZONE;でタイムゾーンを確認 */
SHOW TIMEZONE;

/* リスト5-60 type_othersテーブルの定義を確認 */
\d type_others

/* リスト5-62 is_availableへ真偽値を登録 */
INSERT INTO type_others (is_available)
VALUES (TRUE),
       (FALSE),
       ('1'),
       ('true');

-- INSERT文 実行後の結果を確認
SELECT id,
       is_available
  FROM type_others
 WHERE is_available IS NOT NULL
 ORDER BY id ASC;

/* リスト5-64 真偽値を使った絞り込み */
SELECT id,
       is_available
  FROM type_others
 WHERE is_available = FALSE;


/* リスト5-66 配列型の列へ登録 */
INSERT INTO type_others (tag)
VALUES ('{"Python", "初心者向け", "サンプルコードあり"}'),
       ('{"Java", "中級者向け"}');

-- INSERT文 実行後の結果を確認
SELECT id,
       tag
  FROM type_others
 WHERE tag IS NOT NULL
 ORDER BY id ASC;

/* リスト5-68 配列型の列を条件に指定 */
SELECT id,
       tag
  FROM type_others
 WHERE 'Python' = ANY (tag);

/* リスト5-71 JSON型列へ登録 */
INSERT INTO type_others (json_data)
VALUES ('{"id": 123, "name": "yamada"}'),
       ('{"id": 234, "pref": "tokyo"}');
-- INSERT文 実行後の結果を確認

SELECT id,
       json_data
  FROM type_others
 WHERE json_data IS NOT NULL
 ORDER BY id ASC;

/* リスト5-73 JSON型の列の値を利用して絞り込み */
SELECT id,
       json_data
  FROM type_others
 WHERE json_data ->> 'pref' = 'tokyo';

/* リスト5-75 JSON型列へ登録 2 */
SELECT id,
       json_data
  FROM type_others
 WHERE CAST(json_data ->> 'id' AS INT) = 123;

/* リスト5-77 不正な JSON を登録 (Error) */
INSERT INTO type_others (json_data)
VALUES ('{"id: 123}');

/* リスト5-79 IS NOT NULL */
SELECT isbn
  FROM book
 WHERE isbn IS NOT NULL -- NULL ではない行に絞り込み
 ORDER BY isbn
 LIMIT 5;

/* リスト5-81 結果にNULLを含むSELECT文 */
SELECT b.isbn,
       b.title,
       ROUND(AVG(score), 2) AS average
  FROM book AS b
  LEFT JOIN rating AS r
 USING (isbn)
 GROUP BY b.isbn
 ORDER BY b.isbn ASC
 LIMIT 5;

/* リスト5-85 schema_lessテーブルにデータを挿入するSQL */
INSERT INTO schema_less (data)
VALUES ('{"isbn": "9784774188195", "title": "Electronではじめるアプリ開発"}'),
       ('{"published_at": "2016-01-16", "price": 2980}');

/* リスト6-1 UPPER()関数 */
SELECT UPPER('sql');

/* リスト6-3 REPEAT()関数 */
SELECT REPEAT('X', 5);

/* リスト6-4 REPEAT()関数の引数の順番を入れ替え */
SELECT REPEAT(5, 'X');

/* リスト6-6 MAKE_DATE()関数 */
SELECT MAKE_DATE(2020, 12, 24), -- 位置表記
       MAKE_DATE(year => 2020, month => 12, day => 24), -- 名前付き表記
       MAKE_DATE(day => 24, month => 12, year => 2020); -- 名前付き表記

/* リスト6-7 REPEAT()関数の定義を調べる */
\df REPEAT

/* リスト6-9 MAKE_DATE()関数の定義を調べる */
\df MAKE_DATE

/* リスト6-12 算術関数の利用例 */
SELECT ABS(-5);

/* リスト6-14 LOG()、POWER()、MOD()関数 */
SELECT LOG(10, 100), -- 10を底とする100の対数
       POWER(2, 3), -- 2の3乗
       MOD(9.0, 4); -- 9/4 の余り

/* リスト6-16 数値の丸めや切り捨てに関する関数 */
SELECT ROUND(4.5), -- 4.5 を小数点第1位で四捨五入
       ROUND(4.45, 1), -- 4.5 を小数点第2位で四捨五入
       CEIL(4.1), -- 4以上の最小の整数
       CEIL(-3.9), -- -3以上の最小の整数
       FLOOR(4.1), -- 4以下の最大の整数
       FLOOR(-3.9), -- -3以下の最大の整数
       TRUNC(4.1), -- 小数点を切り捨て
       TRUNC(-3.87, 1); -- 小数点第2位を切り捨て

/* リスト6-18 ratingテーブルを確認 */
SELECT id,
       isbn,
       user_id,
       score
  FROM rating
 ORDER BY id ASC
 LIMIT 3;

/* リスト6-20 scoreを四捨五入 */
SELECT id,
       isbn,
       user_id,
       ROUND(score)
  FROM rating
 ORDER BY id ASC
 LIMIT 3;

/* リスト6-22 関数を使用した列にAS句を付与 */
SELECT id,
       isbn,
       user_id,
       ROUND(score) AS rounded_score -- AS句 を利用
  FROM rating
 ORDER BY id ASC
 LIMIT 3;

/* リスト6-24 スペースや日本語が含まれるエイリアスの利用 */
SELECT id,
       isbn,
       user_id AS "ユーザーID", -- 日本語を含むエイリアス
       ROUND(score) AS "rounded score" -- スペースを含むエイリアス
  FROM rating
 ORDER BY id ASC
 LIMIT 3;

/* リスト6-26 加算をするSELECT文 */
SELECT 1 + 2;

/* リスト6-28 priceに1.08を掛ける */
SELECT price, -- 比較のために元の列を指定
       price * 1.08 AS price_tax_in -- 乗算 (AS句 利用)
  FROM book
 ORDER BY price DESC
 LIMIT 3;

/* リスト6-30 文字型データに算術演算子を使用 (Error) */
SELECT 'abc' + 1;

/* リスト6-32 10 / 3 と 10 / 3.0 */
SELECT 10 / 3,
       10 / 3.0;


/* リスト6-34 関数の戻り値を関数の引数とする */
SELECT POWER(ROUND(2.5), 3),
       TRUNC(POWER(ROUND(2.5), 3));

/* リスト6-36 算術演算の戻り値を関数の引数とする */
SELECT FLOOR(2.0 - 3.2);

/* リスト6-38 CURRENT_DATE関数 */
SELECT CURRENT_DATE;

/* リスト6-40 MAKE_DATE()関数、DATE_PART()関数 */
SELECT MAKE_DATE(2017, 07, 10),
 DATE_PART('month', MAKE_DATE(2017, 07, 07)) AS month,
 DATE_PART('quarter', MAKE_DATE(2017, 07, 07)) AS q;

/* リスト6-0 リスト0-42MAKE_INTERVAL()でインターバルを取得 */
SELECT MAKE_INTERVAL(months => 18), -- 18カ月
       MAKE_INTERVAL(years => 2, months => 13), -- 2年と13カ月
       MAKE_INTERVAL(days => 1, hours => 48); -- 1日と48時間

/* リスト6-44 インターバルを利用した日付の計算 */
SELECT MAKE_DATE(2020, 7, 24) - MAKE_INTERVAL(years => 2, months => 13);

/* リスト6-46 DATE_PART()を列に対して適用 */
SELECT title,
       published_at, -- 確認のために元の列の値を取得
       DATE_PART('year', published_at) AS year, -- published_atから年フィールドを抽出
       DATE_PART('month', published_at) AS month -- 月フィールドを抽出
  FROM book
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト6-48 DATE_TRUNC()を列に適用 */
SELECT isbn,
       created_at, -- 確認のために元の列の値を取得
       DATE_TRUNC('day', created_at) AS day, -- 日付未満の 部分フィールドを 0 に
       DATE_TRUNC('hour', created_at) AS hour -- 時刻未満の 部分フィールドを 0 に
  FROM book
 ORDER BY published_at
 LIMIT 3; 

/* リスト6-50 日付に対する加算と減算 */
SELECT MAKE_DATE(2006, 01, 02) AS today,
       MAKE_DATE(2006, 01, 02) + 1 AS tomorrow,
       MAKE_DATE(2006, 01, 02) - 3 AS three_days_before;

/* リスト6-52 インターバルを用いた日付／時刻計算 */
SELECT MAKE_DATE(2006,01,02) + MAKE_INTERVAL(months => 3) AS add_3months, -- 3カ月を加算
       MAKE_INTERVAL(hours => 24) - MAKE_INTERVAL(mins => 65) AS subtract_65mins, -- 24時から65分を減算
       MAKE_INTERVAL(hours => 1) / 4 AS quarter; -- 1時間を4で除算


/* リスト6-54 日付データ同士の減算 */
SELECT published_at, -- 確認のために元の値を取得
       published_at - MAKE_DATE(2017, 9, 1) AS date_interval -- 日付同士の計算
  FROM book
 ORDER BY published_at DESC
 LIMIT 2;

/* リスト6-56 月末日を取得 */
SELECT published_at, -- 確認のため、元の列の値を取得
       DATE_TRUNC('month', published_at) + MAKE_INTERVAL(months => 1) -
       MAKE_INTERVAL(days => 1) AS last_day
  FROM book
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト6-58 文字列関数の利用例 */
SELECT LOWER('Hello World！');

/* リスト6-60 0TRIM()関数 */
SELECT TRIM(' tokyo '), -- 前後のスペースのトリム
       TRIM(leading from ' tokyo '), -- 前方のみトリム
       TRIM(trailing ' tokyo '), -- 後方のみトリム。from は省略可能
       TRIM(both from 'tokyo-osaka-kyoto', 'to'); -- 前後の 't' と 'o' をトリム

/* リスト6-62 CONCAT()関数とCONCAT_WS()関数 */
SELECT CONCAT('Python', 'Java', 'Ruby'), -- 区切りなしで結合
       CONCAT_WS(',', 'Python', 'Java', 'Ruby'), -- カンマ区切りで結合
       CONCAT_WS('-', 'Python', 'Java', 'Ruby'); -- ハイフン区切り

/* リスト6-64 CONCAT()で書籍タイトルに『』を付与 */
SELECT title, -- 確認のために元の値を取得
       CONCAT('『', title, '』') -- CONCAT() を使って文字列結合
  FROM book
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト6-66 FORMAT()で書籍タイトルに『』を付与 */
SELECT title, -- 確認のために元の値を取得
       FORMAT('『%s』', title) -- FORMAT() を使って文字列結合
  FROM book
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト6-67 FORMAT()の使用例 */
SELECT FORMAT('%s-%s', 'A', 'B'), -- %s を 2つ
       FORMAT('%s-%s-%s', 'A', 'B', 'C'), -- %s を 3つ
       FORMAT('%s-%3$s-%2$s', 'A', 'B', 'C'); 

/* リスト6-69 || を使い文字列を結合 */
SELECT title,
       price || '円' AS price -- 演算子を使って文字列結合
  FROM book
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト6-71 文字型の'2'をINT型にキャスト */
SELECT CAST('2' AS INT);

/* リスト6-72 文字型同士の加算 (Error) */
SELECT '2' + '5';

/* リスト6-73 文字型をキャストしてから加算 */
SELECT CAST('2' AS INT) + CAST('5' AS INT);

/* リスト6-74 COALESCE()関数 */
SELECT isbn,
       author, -- 確認のため元の列を指定
       COALESCE(author, '著者未登録')
  FROM book
 WHERE author IS NULL;

/* リスト6-76 COALESCE()で複数の式を判定 */
SELECT COALESCE(NULL, NULL, NULL, '4番目の値'),
       COALESCE(NULL, '2番目の値', NULL, '4番目の値');

/* リスト6-78 NULLIF()関数 */
SELECT isbn,
       price, -- 確認のため元の列を指定
       NULLIF(price, 10000)
  FROM book
 WHERE price > 7000
 ORDER BY isbn DESC;

/* リスト6-80 NULLIF でゼロ除算を防ぐ */
SELECT 5 / NULLIF(0, 0);

/* リスト6-81 GREATEST()関数、LEAST()関数 */
SELECT GREATEST(1, 5, 2),
       LEAST(2, 5, -3);

/* リスト6-83 GREATEST()関数を使った最低価格の指定 */
SELECT price, -- 確認のため元の値を取得
       GREATEST(2000, price * 0.9) -- 最低でも 2,000円
  FROM book
 WHERE price BETWEEN 1800 AND 2300
 GROUP BY price
 ORDER BY price DESC
 LIMIT 5;
