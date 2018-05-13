# Docker で PostgreSQL 環境を準備する

この手順では、`docker-compose` を利用して以下の処理を行います。

1. PostgreSQL の動作するコンテナを起動する
2. 初期データベースや初期データを作成する

あらかじめ Docker 環境が準備されている必要があります。また、PostgreSQL への接続のためのクライアントツールが別途必要になります。

## Docker コンテナの起動

`docker-compose` コマンドを利用してコンテナを起動します。

```bash
cd ./docker/postgres
docker-compose up
```

`docker-compose` コマンドは、`docker-compose.yml` のファイルが配置されたディレクトリと同階層で実行してください。

以下の内容で PostgreSQL 環境が構築されます。

項目 | 内容
:----: | :---:
Super User:Password | root:password
DB User:Password | user1:password
DB Host | localhost
DB Port | 5432
DB Name | learning_sql

### docker-compose の処理内容

docker-compose.yml で実行される処理は以下のとおりです。

- PostgreSQL 公式の Docker イメージ (https://hub.docker.com/_/postgres/) を利用します。
    - バージョンは 10-alpine を利用します。
- データベースの初期化処理を行います。
    - 01_create_user.sql: ユーザー `user1` を作成します。
    - 02_dump.sql: データベース learning_sql およびテーブル群を作成します。テーブル内のデータも作成します。

## PostgreSQL 環境への接続

例として、`psql` コマンドを利用した接続確認を行います。

コンテナが起動したら、ターミナルから以下のコマンドを実行します。

```bash
psql -U user1 -h localhost -p 5432 -d learning_sql
```

`Password for user user1:` と表示されたらパスワード `password` を入力します。

以下のように PostgreSQL のコンソールが表示されればログインは成功です。

```bash
learning_sql=#
```

SELECT文を実行しテーブルの状態を確認します。

```sql
learning_sql=# SELECT * FROM b1;
 id |               title                | published_at
----+------------------------------------+--------------
  1 | Electronではじめるアプリ開発       | 2017-03-28
  2 | かんたん Perl                      | 2016-01-16
  3 | 3ステップでしっかり学ぶPHP入門     | 2017-07-21
  4 | Pythonクローリング＆スクレイピング | 2016-12-16
  5 | 改訂2版 パーフェクトRuby           | 2017-05-17
```

5行のデータが取得できます。これで PostgreSQL を利用する準備が整いました。

## Docker コンテナの操作

```bash
# コンテナの停止
docker-compose stop

# コンテナの起動
docker-compose up

# コンテナの起動 (バックグラウンド)
docker-compose up -d
```

## Docker コンテナの再作成

データベースを初期状態に戻したい場合、コンテナの再作成を行います。PostgreSQL のデータは復旧できないためデータを破棄してもよい場合にのみ実行してください。

```bash
# コンテナとボリュームの削除
docker-compose down -v

# コンテナの作成と起動
docker-compose up
```
