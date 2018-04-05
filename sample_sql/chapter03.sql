/* リスト3-1 SELECT文の例 */
SELECT id,
       title,
       published_at
  FROM book
 WHERE published_at > '2017-01-01'
 ORDER BY published
 LIMIT 10;

/* リスト3-2 基本的なSELECT文の例 */
SELECT id
  FROM b1;


/* リスト3-4 title列を指定したSELECT句 */
SELECT title
  FROM b1;

/* リスト3-6 2つの列を指定したSELECT文 */
SELECT id,
       title
  FROM b1;

/* リスト3-8 不要なカンマが付いたSELECT (Error)*/
SELECT id,
       title, -- このカンマは不要
  FROM b1;

/* リスト3-10 列の指定順序を入れ替えたSELECT文 */
SELECT title,
       id
  FROM b1;

/* リスト3-12 ＊を指定したSELECT文 */
SELECT *
  FROM b1;

/* リスト3-14 LIMIT句を指定しないSELECT文 */
SELECT id
  FROM b1;

/* リスト3-16 LIMIT句を指定したSELECT文 */
SELECT id
  FROM b1
 LIMIT 3;

/* リスト3-18 LIMIT句に1を指定したSELECT文 */
SELECT id
  FROM b1
 LIMIT 1;

/* リスト3-20 LIMIT句に大きな値を指定したSELECT文 */
SELECT id
  FROM b1
 LIMIT 99;

/* リスト3-22 ORDER BY句を使ったSELECT文 */
SELECT isbn,
       title,
       published_at
  FROM book
 ORDER BY published_at
 LIMIT 3;

/* リスト3-24 ORDER BY句にDESCを追加 */
SELECT isbn,
       title,
       published_at
  FROM book
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト3-26 ORDER BY句にDESCを追加 */
SELECT isbn,
       title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト3-27 price列で昇順にソートするSELECT文 */
SELECT title,
       price,
       published_at
  FROM book
 ORDER BY price ASC
 LIMIT 5;

/* リスト3-29 ORDER BY句に複数の列を指定したSELECT文 */
SELECT title,
       price,
       published_at
  FROM book
 ORDER BY price ASC,
          published_at DESC
 LIMIT 5;

/* リスト3-33 ORDER BY句が不要なSELECT文の例 */
SELECT AVERAGE(price)
  FROM book
 GROUP BY sub_genre_id;

/* リスト3-34 WHERE句を使ったSELECT文 */
SELECT isbn,
       title
  FROM book
 WHERE isbn = '9784774183671';

/* リスト3-38 条件に「価格が1,000円より大きい」を指定したSELECT文 */
SELECT isbn,
       title,
       price
  FROM book
 WHERE price > 1000
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-41 WHERE句を取り除いたSELECT文 */
SELECT isbn,
       title,
       price
  FROM book
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-43 WHERE句に比較演算子 >=を指定 */
SELECT title,
       price
  FROM book
 WHERE price >= 398
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-45 WHERE句に比較演算子 <を指定 */
SELECT title,
       price
  FROM book
 WHERE price < 400
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-47 WHERE句に比較演算子 <=を指定 */
SELECT title,
       price
  FROM book
 WHERE price <= 400
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-49 WHERE句に比較演算子 !=を指定 */
SELECT title,
       price
  FROM book
 WHERE price != 400
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-51 AND句を使ったSELECT文 */
SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE price > 1000
   AND sub_genre_id = '0603'
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-53 AND句を使ったSELECT文-2 */
SELECT title,
       sub_genre_id,
       published_at
  FROM book
 WHERE published_at < '2017-01-01'
   AND sub_genre_id = '0603'
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト3-55 OR句を使ったSELECT文 */
SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id = '0603'
    OR sub_genre_id = '0601'
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-60 OR句を利用して条件を3つ指定 */
SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id = '0603'
    OR sub_genre_id = '0601'
    OR sub_genre_id = '0501'
 ORDER BY price ASC
 LIMIT 3;

/* リスト3-61 AND句とOR句の組み合わせ */
SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE sub_genre_id = '0603'
    OR sub_genre_id = '0601'
   AND price = 2000
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト3-66 括弧を利用して優先順位を指定したWHERE句 */
SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE (sub_genre_id = '0603' OR sub_genre_id = '0601')
   AND price = 2000
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト3-68 サブジャンルIDごとに価格を指定した WHERE句 */
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

/* リスト3-71 ある範囲をAND句で指定したSELECT文 */
SELECT title,
       price,
       published_at
  FROM book
 WHERE price >= 2500
   AND price <= 3000
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト3-72 ある範囲をBETWEEN句で指定したSELECT文 */
SELECT title,
       price,
       published_at
  FROM book
 WHERE price BETWEEN 2500 AND 3000
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト3-74 AND句とBETWEEN句の組み合わせ */
SELECT title,
       sub_genre_id,
       price
  FROM book
 WHERE price BETWEEN 2500 AND 3000
   AND sub_genre_id = '0603'
 ORDER BY published_at DESC
 LIMIT 3;

/* リスト3-76 複数のBETWEEN句 */
SELECT title,
       price,
       published_at
  FROM book
 WHERE price BETWEEN 2500 AND 3000
   AND published_at BETWEEN '2017-05-01' AND '2017-05-31'
 ORDER BY published_at ASC
 LIMIT 3;

/* リスト3-78 LIMIT句を指定したSELECT文（おさらい）*/
SELECT title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 4;

/* リスト3-80 OFFSET句を使ったSELECT文 */
SELECT title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 4
OFFSET 2;

/* リスト3-82 OFFSET 1 を指定したSELECT文 */
SELECT title,
       published_at
  FROM book
 ORDER BY published_at ASC
 LIMIT 4
OFFSET 1;

/* リスト3-84 1ページ目の取得 */
SELECT *
  FROM b1
 ORDER BY id ASC
 LIMIT 2;

/* リスト3-86 OFFSET句を使わない2ページ目の取得 */
SELECT *
  FROM b1
 WHERE id > 2
 ORDER BY id ASC
 LIMIT 2;

