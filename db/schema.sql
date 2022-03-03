DROP DATABASE IF EXISTS qna;

CREATE DATABASE qna;

\c qna;

CREATE TABLE IF NOT EXISTS questions (
  id integer GENERATED BY DEFAULT AS IDENTITY UNIQUE PRIMARY KEY,
  product_id varchar(15),
  body text,
  date_written text,
  asker_name varchar(50),
  asker_email varchar(255),
  reported boolean,
  helpful varchar(15)
);

COPY questions
FROM '/Users/mtanaka/HackReactor/SDC_data/questions.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS answers (
  id integer GENERATED BY DEFAULT AS IDENTITY UNIQUE PRIMARY KEY,
  question_id int,
  body text,
  date_written text,
  answerer_name varchar(50),
  answerer_email varchar(255),
  reported boolean,
  helpful varchar(15),
  FOREIGN KEY (question_id) REFERENCES questions (id)
);

COPY answers
FROM '/Users/mtanaka/HackReactor/SDC_data/answers.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS answers_photos (
  id integer GENERATED BY DEFAULT AS IDENTITY UNIQUE PRIMARY KEY,
  answer_id int,
  photo_url text,
  FOREIGN KEY (answer_id) REFERENCES answers (id)
);

COPY answers_photos
FROM '/Users/mtanaka/HackReactor/SDC_data/answers_photos.csv'
DELIMITER ','
CSV HEADER;