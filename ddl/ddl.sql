CREATE DATABASE learning_sql;
\c learning_sql

DROP TABLE IF EXISTS rating;
DROP TABLE IF EXISTS book_raw;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS sub_genre;
DROP TABLE IF EXISTS genre;

CREATE TABLE genre (
  id         CHAR(2) PRIMARY KEY,
  name       VARCHAR(191) UNIQUE NOT NULL,
  created_at TIMESTAMP           NOT NULL,
  updated_at TIMESTAMP           NOT NULL
);

CREATE TABLE sub_genre (
  id         CHAR(4) PRIMARY KEY,
  genre_id   CHAR(2)             NOT NULL,
  name       VARCHAR(191) UNIQUE NOT NULL,
  created_at TIMESTAMP           NOT NULL,
  updated_at TIMESTAMP           NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genre (id)
);

CREATE INDEX idx_sub_genre__genre_id
  ON sub_genre (genre_id);

-- TODO: programing_language は ENUM にしてもよいかも知れません
CREATE TABLE book (
  isbn                VARCHAR(13) PRIMARY KEY,
  sub_genre_id        CHAR(4)       NOT NULL,
  programing_language VARCHAR(64)            DEFAULT NULL,
  title               VARCHAR(191)  NOT NULL,
  author              VARCHAR(500)  DEFAULT NULL,
  published_at        DATE          NOT NULL,
  price               INT           NOT NULL,
  is_stock            BOOL          NOT NULL DEFAULT TRUE, -- TODO is_available
  url                 VARCHAR(2024) NOT NULL,
  created_at          TIMESTAMP     NOT NULL,
  updated_at          TIMESTAMP     NOT NULL,
  FOREIGN KEY (sub_genre_id) REFERENCES sub_genre (id)
);

CREATE INDEX idx_book__published_at
  ON book (published_at);
CREATE INDEX idx_book__price
  ON book (price);
CREATE INDEX idx_book__is_stock
  ON book (is_stock);
CREATE INDEX idx_book__sub_genre_id
  ON book (sub_genre_id);

CREATE TABLE book_raw (
  isbn                VARCHAR(13) PRIMARY KEY,
  genre_id            CHAR(2),
  genre               VARCHAR(191),
  sub_genre_id        CHAR(4)       NOT NULL,
  sub_genre           VARCHAR(191),
  programing_language VARCHAR(64)            DEFAULT NULL,
  title               VARCHAR(191)  NOT NULL,
  author              VARCHAR(500)  DEFAULT NULL,
  published_at        DATE          NOT NULL,
  price               INT           NOT NULL,
  is_stock            BOOL          NOT NULL DEFAULT TRUE,
  url                 VARCHAR(2024) NOT NULL,
  created_at          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rating (
  id SERIAL PRIMARY KEY,
  isbn VARCHAR(13) NOT NULL,
  user_id VARCHAR(8) NOT NULL,
  score DECIMAL(2, 1) NOT NULL,
  created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at          TIMESTAMP DEFAULT NULL
);


-- for plactice 1
CREATE TABLE b1 (
  id                SERIAL PRIMARY KEY,
  title             VARCHAR(191) DEFAULT 'タイトル未定',
  published_at      DATE          DEFAULT NULL
);

-- for plactice 2
CREATE TABLE b2 (
  id                INT PRIMARY KEY,
  title             VARCHAR(191) DEFAULT 'タイトル未定',
  published_at      DATE          DEFAULT NULL
);

CREATE TABLE b3 (
  isbn              VARCHAR(13) PRIMARY KEY,
  title             VARCHAR(191) DEFAULT 'タイトル未定',
  published_at      DATE          DEFAULT NULL
);


-- データ型確認のための テーブル群
DROP TABLE IF EXISTS type_char;
CREATE TABLE type_char (
  id SERIAL,
  country_code CHAR(3) DEFAULT NULL,
  country_name VARCHAR(45) DEFAULT NULL,
  description TEXT DEFAULT NULL
);

-- TODO
DROP TABLE IF EXISTS type_numeric;
CREATE TABLE type_numeric (
  id SERIAL,
  price SMALLINT DEFAULT NULL,
  weight FLOAT4 DEFAULT NULL,
  rating DECIMAL(2, 1) DEFAULT NULL
);

-- TODO
DROP TABLE IF EXISTS type_date;
CREATE TABLE type_date (
  id SERIAL,
  published_at DATE DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT NULL,
  updated_at_tz TIMESTAMP WITH TIME ZONE DEFAULT NULL,
  started_at TIME DEFAULT NULL
);


DROP TABLE IF EXISTS type_others;
CREATE TABLE type_others (
  id SERIAL,
  is_available BOOLEAN DEFAULT NULL,
  json_data JSON DEFAULT NULL,
  tag VARCHAR[] DEFAULT NULL
);

DROP TABLE IF EXISTS request_log;
DROP TYPE IF EXISTS HTTP_METHOD;
CREATE TYPE HTTP_METHOD AS ENUM ('GET', 'POST', 'PUT', 'DELETE', 'PATCH');
CREATE TABLE request_log (
  id SERIAL,
  end_point VARCHAR(2024) NOT NULL,
  method HTTP_METHOD NOT NULL,
  params JSON DEFAULT NULL
);

DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log (
    id SERIAL PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL,
    user_id VARCHAR(8) NOT NULL,
    amount INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS stock;
CREATE TABLE stock (
    isbn VARCHAR(13) PRIMARY KEY,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO stock (isbn, quantity)
VALUES (1, 10);

CREATE TABLE schema_less (
   data JSON
);

