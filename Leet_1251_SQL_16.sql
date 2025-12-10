WITH products AS (
  SELECT DISTINCT product_id
  FROM Prices
),
sales AS (
  SELECT
    u.product_id,
    SUM(p.price * u.units)   AS revenue,
    SUM(u.units)             AS total_units
  FROM UnitsSold u
  JOIN Prices p
    ON u.product_id = p.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
  GROUP BY u.product_id
)
SELECT
  pr.product_id,
  ROUND(COALESCE(s.revenue / NULLIF(s.total_units,0), 0), 2) AS average_price
FROM products pr
LEFT JOIN sales s ON pr.product_id = s.product_id
ORDER BY pr.product_id;
-- SQL Schema
-- Table: Prices
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | price        | int     |
-- | start_date   | date    |
-- | end_date     | date    |
-- +--------------+---------+
-- (product_id, start_date) is the primary key of this table.
-- Each row of this table indicates that the price of the product with id product_id
-- is price from the date start_date to the date end_date (inclusive).
-- Table: UnitsSold
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | product_id     | int     |
-- | purchase_date  | date    |
-- | units          | int     |
-- +----------------+---------+
-- There is no primary key for this table.
-- Each row of this table indicates that units units of the product with id product_id
-- were sold on the date purchase_date.
-- Write your SQL query to report the average price of each product.
-- The average price of a product is defined as the total revenue generated from the product
-- divided by the total number of units sold of that product.
-- Return the result table sorted by product_id in ascending order.
-- If a product has no sales, then the average price is considered to be 0.