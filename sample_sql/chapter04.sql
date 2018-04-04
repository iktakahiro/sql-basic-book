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
