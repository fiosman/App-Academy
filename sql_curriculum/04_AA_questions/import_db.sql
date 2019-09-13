PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users ( 
  id INTEGER PRIMARY KEY, 
  fname TEXT NOT NULL, 
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions ( 
  id INTEGER PRIMARY KEY, 
  title TEXT NOT NULL, 
  body TEXT NOT NULL, 
  author_id INTEGER NOT NULL, 

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows ( 
  id INTEGER PRIMARY KEY, 
  user_id INTEGER NOT NULL, 
  question_id INTEGER NOT NULL, 

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies ( 
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL, 
  subject_question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL, 
  parent_reply_id INTEGER,

  FOREIGN KEY (subject_question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes; 

CREATE TABLE question_likes ( 
  id INTEGER PRIMARY KEY, 
  user_id INTEGER NOT NULL, 
  question_id INTEGER NOT NULL, 

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
); 

INSERT INTO 
  users (fname, lname)
VALUES 
  ('Fares', 'Osman'), 
  ('Chris', 'Andrews'), 
  ('Dante', 'White'), 
  ('James', 'Cunningham');

INSERT INTO 
  questions (title, body, author_id) 
VALUES 
  ('Question 1', 'What is 2 + 2?', 1),
  ('Question 2', 'What is the opposite of Love?', 2), 
  ('Question 3', 'What is the capital of Canada?', 2),
  ('Question 4', 'Who won the NBA title in 2019?', 3);

INSERT INTO 
  question_follows (user_id, question_id) 
VALUES 
  (1, 1),
  (2, 3), 
  (1, 2);

INSERT INTO
  replies (body, subject_question_id, user_id, parent_reply_id)
VALUES 
  ('4', 1, 1, NULL),
  ('Hate', 2, 2, NULL),
  ('Ottawa', 3, 3, NULL), 
  ('Raptors', 4, 4, NULL);

INSERT INTO 
  question_likes (user_id, question_id)
VALUES 
  (3, 1), 
  (4, 3), 
  (2, 1), 
  (1, 4); 

