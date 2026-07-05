CREATE DATABASE customer_segmentation;
USE customer_segmentation;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    annual_income INT,
    spending_score INT
);
SELECT * FROM customers LIMIT 10;

-- Average Spending by Gender
SELECT 
    gender,
    AVG(spending_score) AS average_spending
FROM customers
GROUP BY gender;

-- Highest Income Customers
SELECT *
FROM customers
ORDER BY annual_income DESC
LIMIT 10;

-- Average Income by Age
SELECT 
    age,
    AVG(annual_income) AS avg_income
FROM customers
GROUP BY age
ORDER BY avg_income DESC;

-- High Income High Spending Customers
SELECT *
FROM customers
WHERE annual_income > 70
AND spending_score > 70;

-- Customer Distribution by Gender
SELECT 
    gender,
    COUNT(*) AS total_customers
FROM customers
GROUP BY gender;

-- Combined Customer Segmentation
SELECT
    CASE
        WHEN annual_income > 70 AND spending_score > 70
            THEN 'Premium Customers'

        WHEN annual_income > 70 AND spending_score < 40
            THEN 'Careful Customers'

        WHEN annual_income < 40 AND spending_score > 70
            THEN 'Impulsive Customers'

        ELSE 'Standard Customers'
    END AS customer_segment,
    
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_segment;