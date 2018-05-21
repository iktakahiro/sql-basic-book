# 技術評論社『これからはじめる SQL 入門』追加情報 & サンプルコード & データ公開 Repository

<img src="./docs/img/cover.jpg" width="640" />

この Repository は、書籍『これからはじめる SQL 入門』(2018年, 技術評論社) に関連する追加情報やサンプルコードを公開する目的で運営されています。

## サンプルデータ

本書で使用しているサンプルデータを公開しています。

* [Restore用 dump.sql](./data/dump.sql)
* [書籍マスタ(raw データ) book.csv](./data/book.csv)
* [評価データ rating.csv](./data/rating.csv)

書籍マスタは以下のスクリプトを用いて Webサイトをクローリングし、生成しました。

* https://github.com/iktakahiro/gihyo-book-scraper

## サンプルコード

本書で解説している SQL を章ごとにまとめて公開しています。

* [第3章](./sample_sql/chapter03.sql)
* [第4章](./sample_sql/chapter04.sql)
* [第5章](./sample_sql/chapter05.sql)
* [第6章](./sample_sql/chapter06.sql)
* [第7章](./sample_sql/chapter07.sql)
* [第8章](./sample_sql/chapter08.sql)
* [第9章](./sample_sql/chapter09.sql)
* [第10章](./sample_sql/chapter10.sql)
* [第11章](./sample_sql/chapter11.sql)

## 環境構築Tips

本書では VirtualBox を利用した PostgreSQL 環境の構築方法を解説しています。以下のドキュメントでは、Docker を利用した環境構築方法を紹介しています。

* [PostgreSQL 環境構築について](./docs/environment.md)
    * [Docker で PostgreSQL 環境を準備する](./docs/docker-postgres.md)
    * [Docker で PostgreSQL + pgweb 環境を準備する](./docs/docker-postgres-with-pgweb.md)

## Awesome PostgreSQL GUI Tools

TBD

* [DataGrip: Cross\-Platform IDE for Databases & SQL by JetBrains](https://www.jetbrains.com/datagrip/)
* [sosedoff/pgweb: Cross\-platform client for PostgreSQL databases](https://github.com/sosedoff/pgweb)
* [Sqlectron \- One single DB client for any relational DB](https://sqlectron.github.io/)

### 参考

* [dhamaniasad/awesome\-postgres: A curated list of awesome PostgreSQL software, libraries, tools and resources, inspired by awesome\-mysql - GitHub](https://github.com/dhamaniasad/awesome-postgres#gui)
* [Community Guide to PostgreSQL GUI Tools \- PostgreSQL wiki](https://wiki.postgresql.org/wiki/Community_Guide_to_PostgreSQL_GUI_Tools)

## お問い合わせについて

本書で解説している内容についてご質問がある場合、この Repository の Issue を利用してお問い合わせください。必ずしも回答できるとは限らないことをあらかじめご承知おきください。

PostgreSQL や SQL、その他コンピュータの操作全般に関する一般的なご質問の場合、以下のサービスをご利用になることをお勧めします。

* https://stackoverflow.com/
* https://ja.stackoverflow.com/
* https://teratail.com/

著者 Twitter: [@iktakahiro](https://twitter.com/iktakahiro)
