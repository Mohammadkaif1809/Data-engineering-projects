-- 1. CREATE DENORMALIZED ANALYTICS VIEW

CREATE OR REPLACE VIEW ecommerce.gold.fact_transactions_denorm AS
SELECT
    i.*,
    c.year,
    c.month_name,
    c.day_name,
    c.is_weekend,
    c.quarter,
    c.week,
    p.sku,
    p.category_code,
    p.category_name,
    p.brand_code,
    p.brand_name,
    p.color,
    p.size,
    p.rating_count,
    EXTRACT(HOUR FROM transaction_ts) AS hour_of_day
FROM ecommerce.gold.gld_fact_order_items i
JOIN ecommerce.gold.gld_date c
    ON i.date_id = c.date_id
JOIN ecommerce.gold.gld_dim_products p
    ON i.product_id = p.product_id;


-- 2. TOTAL REVENUE

SELECT
    SUM(net_amount_inr) AS total_revenue
FROM ecommerce.gold.fact_transactions_denorm;


-- 3. REVENUE BY SALES CHANNEL

SELECT
    channel,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY channel
ORDER BY revenue DESC;


-- 4. TRANSACTION COUNT BY CHANNEL

SELECT
    channel,
    COUNT(*) AS transaction_count
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY channel
ORDER BY transaction_count DESC;


-- 5. AVERAGE TRANSACTION VALUE BY CHANNEL

SELECT
    channel,
    ROUND(AVG(net_amount_inr), 2) AS avg_transaction_value
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY channel
ORDER BY avg_transaction_value DESC;


-- 6. YEARLY REVENUE

SELECT
    year,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY year
ORDER BY year;


-- 7. QUARTERLY REVENUE

SELECT
    quarter,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY quarter
ORDER BY quarter;


-- 8. MONTHLY REVENUE

SELECT
    year,
    month_name,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY year, month_name;


-- 9. WEEKDAY VS WEEKEND REVENUE

SELECT
    CASE
        WHEN is_weekend = 1 THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY day_type;


-- 10. REVENUE BY DAY OF WEEK

SELECT
    day_name,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY day_name
ORDER BY revenue DESC;


-- 11. REVENUE BY HOUR

SELECT
    hour_of_day,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY hour_of_day
ORDER BY hour_of_day;


-- 12. REVENUE BY PRODUCT CATEGORY

SELECT
    category_name,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY category_name
ORDER BY revenue DESC;


-- 13. UNITS SOLD BY PRODUCT CATEGORY

SELECT
    category_name,
    SUM(quantity) AS units_sold
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY category_name
ORDER BY units_sold DESC;


-- 14. TOP 10 BRANDS BY REVENUE

SELECT
    brand_name,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY brand_name
ORDER BY revenue DESC
LIMIT 10;


-- 15. TOP 10 PRODUCTS BY UNITS SOLD

SELECT
    sku,
    SUM(quantity) AS units_sold
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY sku
ORDER BY units_sold DESC
LIMIT 10;


-- 16. TOP 10 PRODUCTS BY REVENUE

SELECT
    sku,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY sku
ORDER BY revenue DESC
LIMIT 10;


-- 17. REVENUE BY BRAND

SELECT
    brand_name,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY brand_name
ORDER BY revenue DESC;


-- 18. REVENUE BY COLOR

SELECT
    color,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY color
ORDER BY revenue DESC;


-- 19. REVENUE BY SIZE

SELECT
    size,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY size
ORDER BY revenue DESC;


-- 20. COUPON VS NON-COUPON REVENUE

SELECT
    CASE
        WHEN coupon_flag = 1 THEN 'Coupon'
        ELSE 'No Coupon'
    END AS coupon_type,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY coupon_type;


-- 21. COUPON VS NON-COUPON TRANSACTIONS

SELECT
    CASE
        WHEN coupon_flag = 1 THEN 'Coupon'
        ELSE 'No Coupon'
    END AS coupon_type,
    COUNT(*) AS transactions
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY coupon_type;


-- 22. REVENUE BY COUPON CODE

SELECT
    coupon_code,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
WHERE coupon_code IS NOT NULL
GROUP BY coupon_code
ORDER BY revenue DESC;


-- 23. COUPON USAGE COUNT

SELECT
    coupon_code,
    COUNT(*) AS usage_count
FROM ecommerce.gold.fact_transactions_denorm
WHERE coupon_code IS NOT NULL
GROUP BY coupon_code
ORDER BY usage_count DESC;


-- 24. AVERAGE DISCOUNT: COUPON VS NON-COUPON

SELECT
    CASE
        WHEN coupon_flag = 1 THEN 'Coupon'
        ELSE 'No Coupon'
    END AS coupon_type,
    ROUND(AVG(discount_percent), 2) AS avg_discount
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY coupon_type;


-- 25. CHANNEL AND COUPON REVENUE

SELECT
    channel,
    CASE
        WHEN coupon_flag = 1 THEN 'Coupon'
        ELSE 'No Coupon'
    END AS coupon_type,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY channel, coupon_type
ORDER BY channel, revenue DESC;


-- 26. UNIQUE CUSTOMERS

SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce.gold.fact_transactions_denorm;


-- 27. CUSTOMER TRANSACTION AND REVENUE ANALYSIS

SELECT
    customer_id,
    COUNT(*) AS transaction_count,
    SUM(net_amount_inr) AS customer_revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY customer_id
ORDER BY customer_revenue DESC;


-- 28. TOP 10 CUSTOMERS BY REVENUE

SELECT
    customer_id,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;


-- 29. AVERAGE ORDER VALUE

SELECT
    ROUND(AVG(net_amount_inr), 2) AS average_order_value
FROM ecommerce.gold.fact_transactions_denorm;


-- 30. AVERAGE QUANTITY PER TRANSACTION

SELECT
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM ecommerce.gold.fact_transactions_denorm;


-- 31. REVENUE BY DISCOUNT RANGE

SELECT
    CASE
        WHEN discount_percent = 0 THEN '0%'
        WHEN discount_percent <= 10 THEN '1-10%'
        WHEN discount_percent <= 20 THEN '11-20%'
        WHEN discount_percent <= 30 THEN '21-30%'
        ELSE '30%+'
    END AS discount_range,
    SUM(net_amount_inr) AS revenue
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY discount_range
ORDER BY revenue DESC;


-- 32. AVERAGE DISCOUNT BY CHANNEL

SELECT
    channel,
    ROUND(AVG(discount_percent), 2) AS avg_discount
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY channel
ORDER BY avg_discount DESC;


-- 33. GROSS REVENUE VS DISCOUNT VS NET REVENUE

SELECT
    SUM(gross_amount) AS gross_revenue,
    SUM(discount_amount) AS total_discount,
    SUM(net_amount_inr) AS net_revenue
FROM ecommerce.gold.fact_transactions_denorm;


-- 34. RUNNING REVENUE BY MONTH

WITH monthly_sales AS (
    SELECT
        year,
        month_name,
        MIN(transaction_date) AS month_date,
        SUM(net_amount_inr) AS monthly_revenue
    FROM ecommerce.gold.fact_transactions_denorm
    GROUP BY year, month_name
)
SELECT
    year,
    month_name,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        PARTITION BY year
        ORDER BY month_date
    ) AS running_revenue
FROM monthly_sales
ORDER BY year, month_date;


-- 35. BRAND REVENUE RANK

SELECT
    brand_name,
    SUM(net_amount_inr) AS revenue,
    RANK() OVER (
        ORDER BY SUM(net_amount_inr) DESC
    ) AS revenue_rank
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY brand_name;


-- 36. CATEGORY REVENUE RANK

SELECT
    category_name,
    SUM(net_amount_inr) AS revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(net_amount_inr) DESC
    ) AS category_rank
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY category_name;


-- 37. SALES CHANNEL REVENUE RANK

SELECT
    channel,
    SUM(net_amount_inr) AS revenue,
    RANK() OVER (
        ORDER BY SUM(net_amount_inr) DESC
    ) AS channel_rank
FROM ecommerce.gold.fact_transactions_denorm
GROUP BY channel;


-- 38. DAILY REVENUE WITH PREVIOUS DAY REVENUE

WITH daily_sales AS (
    SELECT
        transaction_date,
        SUM(net_amount_inr) AS revenue
    FROM ecommerce.gold.fact_transactions_denorm
    GROUP BY transaction_date
)
SELECT
    transaction_date,
    revenue,
    LAG(revenue) OVER (
        ORDER BY transaction_date
    ) AS previous_day_revenue
FROM daily_sales
ORDER BY transaction_date;


-- 39. TOTAL TRANSACTIONS

SELECT
    COUNT(*) AS total_transactions
FROM ecommerce.gold.fact_transactions_denorm;


-- 40. TOTAL UNITS SOLD

SELECT
    SUM(quantity) AS total_units_sold
FROM ecommerce.gold.fact_transactions_denorm;


-- 41. AVERAGE DISCOUNT

SELECT
    ROUND(AVG(discount_percent), 2) AS avg_discount
FROM ecommerce.gold.fact_transactions_denorm;