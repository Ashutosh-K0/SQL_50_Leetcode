-- Write your MySQL query statement below
-- 1757. Recyclable and Low Fat Products
-- SQL1
-- https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Difficulty: Easy
-- Tags: Database, SQL
SELECT product_id 
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';