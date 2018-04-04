# PostgreSQL 環境構築について

PostgreSQL の環境構築に関する情報を掲載します。

## 構築手順

ここでは、Docker を利用した PostgreSQL の環境構築手順を解説します。解説する環境構築方法は以下の2つです。

1. Docker で PostgreSQL 環境を準備する
2. Docker で PostgreSQL と GUI 環境を準備する

いずれの手順の場合も、あらかじめ Docker 環境が利用できるようになっている必要があります。

### 1. Docker で PostgreSQL 環境を準備する

Docker で PostgreSQL サーバーの構築を行う方法です。

PostgreSQL への接続に、別途クライアントが別途必要です。クライアントのインストールがご自身で行える場合に選択してください。

詳細は以下のドキュメントを参照してください。

- [Docker で PostgreSQL 環境を準備する](./docker-postgres.md)

### 2. Docker で PostgreSQL と GUI 環境を準備する

Docker を用いて、PostgreSQL サーバーに加え、[pgweb](https://github.com/sosedoff/pgweb) という Webブラウザベースの PostgreSQL クライアントをあわせて構築する方法です。

別途クライアントツールのインストールは必要ありません。Webブラウザ上で SQL を実行できる GUI (Graphical User Interface) 環境が手に入るため、CUI (Character User Interface) が苦手なかたにお勧めします。

詳細は以下のドキュメントを参照してください。

- [Docker で PostgreSQL + pgweb 環境を準備する](./docker-postgres-with-pgweb.md)

## Docker のインストール

- https://www.docker.com/

TBD

## psql コマンドのインストール

ターミナルから `psql` コマンドを利用可能にするためのインストール手順を掲載します。macOS と Windows それぞれの手順を掲載します。なお、クライアントのバージョンは PostgreSQL サーバーのバージョンと統一されていることが望ましいです（多くの場合、マイナーバージョンの相違は問題になりません）。

### macOS High Sierra の場合

brew コマンドを利用します。

```bash
$ brew install postgresql
```

`psql` コマンドが利用可能なことを確認します。

```bash
# バージョンを確認
$ psql -V
psql (PostgreSQL) 10.3
```

`psql` コマンドを利用して PostgreSQL に接続するための例を以下に示します。

```bash
$ psql -U user1 -h localhost -p 5432 -d learning_sql
```

以上です。

### Windows 10 の場合

TBD
