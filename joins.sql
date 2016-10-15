\i has_many_blogs.sql;

-- --1
-- SELECT *
-- FROM users;

-- --2
-- SELECT *
-- FROM posts
-- WHERE user_id = 100;

-- --3
-- SELECT
--   users.first_name,
--   users.last_name,
--   posts.id,
--   posts.title,
--   posts.url,
--   posts.content,
--   posts.created_at,
--   posts.updated_at
--   FROM posts
--   INNER JOIN users ON posts.user_id = users.id
--   WHERE user_id = 200;

-- --4
-- SELECT
--   users.username,
--   posts.id,
--   posts.title,
--   posts.url,
--   posts.content,
--   posts.created_at,
--   posts.updated_at
--   FROM posts
--   INNER JOIN users ON posts.user_id = users.id
--   WHERE first_name = 'Norene' AND last_name = 'Schmitt';

-- --5
-- SELECT DISTINCT
--   username
--   FROM users
--   INNER JOIN posts ON posts.user_id = users.id
--   WHERE posts.created_at > '2015-01-01';

-- --6
-- SELECT
--   posts.title,
--   posts.content,
--   users.username
--   FROM posts
--   INNER JOIN users ON posts.user_id = users.id
--   WHERE users.created_at < '2015-01-01';

--7 --needs editing, unable to give a string as an alias
-- SELECT
--   posts.title AS Post_Title,
--   comments.id,
--   comments.body,
--   comments.created_at,
--   comments.updated_at,
--   comments.user_id,
--   comments.post_id
--   FROM comments
--   INNER JOIN posts ON posts.id = comments.post_id;


-- --8
-- SELECT
--   posts.title AS post_title,
--   posts.url AS post_url,
--   comments.id,
--   comments.body AS comment_body,
--   comments.created_at,
--   comments.updated_at,
--   comments.user_id,
--   comments.post_id
--   FROM comments
--   INNER JOIN posts ON posts.id = comments.post_id
--   WHERE posts.created_at < '2015-01-01';

-- --9
-- SELECT
--   posts.title AS post_title,
--   posts.url AS post_url,
--   comments.id,
--   comments.body AS comment_body,
--   comments.created_at,
--   comments.updated_at,
--   comments.user_id,
--   comments.post_id
--   FROM comments
--   INNER JOIN posts ON posts.id = comments.post_id
--   WHERE posts.created_at > '2015-01-01';

-- --10
-- SELECT
--   posts.title AS post_title,
--   posts.url AS post_url,
--   comments.id,
--   comments.body AS comment_body,
--   comments.created_at,
--   comments.updated_at,
--   comments.user_id,
--   comments.post_id
--   FROM comments
--   INNER JOIN posts ON posts.id = comments.post_id
--   WHERE comments.body LIKE '%USB%';

-- --11
-- SELECT
--   posts.title AS post_title,
--   users.first_name,
--   users.last_name,
--   comments.body AS comment_body
--   FROM users
--   INNER JOIN posts ON users.id = posts.user_id
--   INNER JOIN comments on posts.id = comments.post_id
--   WHERE comments.body LIKE '%matrix%';

--11 COUNT
-- SELECT COUNT(*)
--   FROM (
--   SELECT
--     posts.title AS post_title,
--     users.first_name,
--     users.last_name,
--     comments.body AS comment_body
--     FROM users
--     INNER JOIN posts ON users.id = posts.user_id
--     INNER JOIN comments on posts.id = comments.post_id
--     WHERE comments.body LIKE '%matrix%') AS temp;

-- --12
-- SELECT
--   users.first_name,
--   users.last_name,
--   comments.body AS comment_body
--   FROM users
--   INNER JOIN comments ON comments.user_id = users.id
--   INNER JOIN posts ON comments.post_id = posts.id
--   WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';


-- --12 COUNT
-- SELECT COUNT(*)
--   FROM (
--   SELECT
--     users.first_name,
--     users.last_name,
--     comments.body AS comment_body
--     FROM users
--     INNER JOIN comments ON comments.user_id = users.id
--     INNER JOIN posts ON comments.post_id = posts.id
--     WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%') AS temp2;

-- --13 broken down
-- --SELECT
-- --  users.username AS comment_author_username,
-- --  comments.body AS comment_body
-- --  FROM comments --post_and_comment
-- --  INNER JOIN users ON comments.user_id = users.id
-- --  WHERE comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%';

-- SELECT
-- -- users.last_name AS post_author_last_name,
-- --  users.first_name AS post_author_first_name,
-- --  posts.title AS post_title
-- --  FROM users
-- --  INNER JOIN posts ON posts.user_id = users.id
-- --  WHERE posts.content LIKE '%nemo%';

-- --join these two tables on posts.id = comments.post_id

-- --actual query that returns desired table
-- SELECT
--   post_author_first_name,
--   post_author_last_name,
--   post_title,
--   comment_author_username,
--   comment_body
--   FROM
--     (SELECT
--       users.username AS comment_author_username,
--       comments.body AS comment_body,
--       comments.post_id AS comment_post_id
--       FROM comments --post_and_comment
--       INNER JOIN users ON comments.user_id = users.id
--       WHERE comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AS t1
--   INNER JOIN (
--     SELECT
--       users.last_name AS post_author_last_name,
--       users.first_name AS post_author_first_name,
--       posts.title AS post_title,
--       posts.id AS post_id
--       FROM users
--       INNER JOIN posts ON posts.user_id = users.id
--       WHERE posts.content LIKE '%nemo%') AS t2 ON t2.post_id = t1.comment_post_id;

-- --13 COUNT
-- SELECT COUNT(*)
--   FROM
--   (SELECT
--     post_author_first_name,
--     post_author_last_name,
--     post_title,
--     comment_author_username,
--     comment_body
--     FROM
--       (SELECT
--         users.username AS comment_author_username,
--         comments.body AS comment_body,
--         comments.post_id AS comment_post_id
--         FROM comments --post_and_comment
--         INNER JOIN users ON comments.user_id = users.id
--         WHERE comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AS t1
--     INNER JOIN (
--       SELECT
--         users.last_name AS post_author_last_name,
--         users.first_name AS post_author_first_name,
--         posts.title AS post_title,
--         posts.id AS post_id
--         FROM users
--         INNER JOIN posts ON posts.user_id = users.id
--         WHERE posts.content LIKE '%nemo%') AS t2 ON t2.post_id = t1.comment_post_id) AS temp200;


-- Additional Queries

-- --1 BROKEN DOWN
-- SELECT
--   users.id AS comment_author_id,
--   comments.post_id AS comment_on_post_id
--   FROM users
--   INNER JOIN comments ON comments.user_id = users.id;

-- SELECT
--   posts.title AS post_title,
--   posts.id AS post_id,
--   users.id AS post_author_id
--   FROM users
--   INNER JOIN posts ON posts.user_id = users.id;

-- --JOIN THESE TWO TABLES WHERE post_author_id = comment_author_id

-- SELECT
--   post_id,
--   post_title,
--   post_author_id
--   FROM
--     (SELECT
--       users.id AS comment_author_id,
--       comments.post_id AS comment_on_post_id
--       FROM users
--       INNER JOIN comments ON comments.user_id = users.id) AS t1
--   INNER JOIN (
--     SELECT
--       posts.title AS post_title,
--       posts.id AS post_id,
--       users.id AS post_author_id
--       FROM users
--       INNER JOIN posts ON posts.user_id = users.id) AS t2 ON t1.comment_on_post_id = t2.post_id
--       WHERE comment_author_id = post_author_id;

--2
SELECT COUNT(*)
  FROM posts
  INNER JOIN comments ON posts.id = comments.post_id
  WHERE posts.created_at > '2015-7-14';

