\i has_many_blogs.sql;

--1
SELECT *
FROM users;

--2
SELECT *
FROM posts
WHERE user_id = 100;

--3
SELECT
  users.first_name,
  users.last_name,
  posts.id,
  posts.title,
  posts.url,
  posts.content,
  posts.created_at,
  posts.updated_at
  FROM posts
  INNER JOIN users ON posts.user_id = users.id
  WHERE user_id = 200;

--4
SELECT
  users.username,
  posts.id,
  posts.title,
  posts.url,
  posts.content,
  posts.created_at,
  posts.updated_at
  FROM posts
  INNER JOIN users ON posts.user_id = users.id
  WHERE first_name = 'Norene' AND last_name = 'Schmitt';