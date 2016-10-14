\c rchar

CREATE USER has_many_user;

DROP DATABASE IF EXISTS has_many_blogs;

CREATE DATABASE has_many_blogs OWNER has_many_user;

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id serial NOT NULL PRIMARY KEY, -- PK
  username varchar(90) NOT NULL,
  first_name varchar(90) DEFAULT NULL,
  last_name varchar(90) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts CASCADE;

CREATE TABLE posts (
  id serial NOT NULL PRIMARY KEY, -- PK
  title varchar(180) DEFAULT NULL,
  url varchar(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  user_id serial REFERENCES users(id) -- FK, posts are by one user
);


DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE comments (
  id serial NOT NULL PRIMARY KEY, -- PK
  body varchar(510) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  user_id serial REFERENCES users(id), -- FK, comments are by one user
  post_id serial REFERENCES posts(id) -- FK, comments are on one post
);


