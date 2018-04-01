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
