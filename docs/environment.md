# Docker を使用した PostgreSQL 環境の準備

## Docker のインストール

- https://www.docker.com/

TBD

## Docker コンテナの起動

`docker-compose` コマンドを利用してコンテナを起動します。

```bash
cd ./docker
docker-compose up
```

以下の内容で PostgreSQL 環境が構築されます。

項目 | 内容
:----: | :---:
Super User:Password | root:password
DB User:Password | user1:password
DB Host | localhost
DB Port | 54321 (5432 ではない点に注意)
DB Name | learning_sql

### docker-compose の処理内容

docker-compose.yml で実行される処理は以下のとおりです。

- PostgreSQL 公式の Docker イメージ (https://hub.docker.com/_/postgres/) を利用します。
    - バージョンは 10-alpine を利用します。
- データベースの初期化処理を行います。
    - 01_create_user.sql: ユーザー `user1` を作成します。
    - 02_dump.sql: データベース learning_sql およびテーブル群を作成します。テーブル内のデータも作成します。

## PostgreSQL 環境への接続

コンテナが起動したら、ターミナルから以下のコマンドを実行します。

```bash
psql -U user1 -h localhost -p 54321 -d learning_sql
```

`Password for user user1:` と表示されたらパスワード `password` を入力します。

以下のように PostgreSQL のコンソールにログインできれば成功です。

```bash
learning_sql=#
```

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

データベースを初期状態に戻したい場合、コンテナの再作成を行います。PostgreSQL のデータは復旧できないためデータを破棄しても:よい場合にのみ実行してください。

```bash
# コンテナとボリュームの削除
docker-compose down -v

# コンテナの作成と起動
docker-compose up
```

