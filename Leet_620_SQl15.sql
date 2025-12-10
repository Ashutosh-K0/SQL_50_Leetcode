SELECT *
FROM cinema
WHERE id % 2 != 0 
AND description !='boring'
ORDER BY rating DESC;
-- 620. Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies
-- SQL Schema
-- Table: cinema
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | title       | varchar |
-- | description | varchar |
-- | rating      | int     |
-- +-------------+---------+
-- id is the primary key for this table.
-- Each row of this table contains information about the movie.
-- Write an SQL query to report all the movies with an odd id that are not boring.
-- A movie is considered boring if its description is equal to 'boring'.
-- Return the result table ordered by rating in descending order.