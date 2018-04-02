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
