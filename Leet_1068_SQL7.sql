SELECT product_name, year, price
FROM Product as P
RIGHT JOIN Sales as S
ON P.product_id = S.product_id;
-- The Product table holds information about the products sold by a company. It has the following columns:
-- product_id: the unique id of each product.
-- product_name: the name of the product.
-- year: the year the product was released.
-- price: the price of the product.
-- The Sales table holds information about the sales of each product. It has the following columns:
-- product_id: the id of the product sold.
-- year: the year the product was sold.
-- Write a query to report the product name, year, and price of each product. If a product was never sold, report null instead.
-- Return the result table ordered by product name in ascending order. If there is a tie,