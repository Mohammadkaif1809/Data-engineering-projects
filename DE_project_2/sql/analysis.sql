## Basic Exploration

SELECT *
FROM products;

SELECT *
FROM users;

SELECT *
FROM carts;

SELECT *
FROM cart_products;


## Product Analysis

SELECT
    title,
    category,
    price
FROM products
WHERE price > 500
ORDER BY price DESC;


SELECT
    title,
    category,
    price,
    stock,
    availabilityStatus
FROM products
WHERE stock < 20
ORDER BY stock ASC;


SELECT
    category,
    COUNT(*) AS ProductsCount
FROM products
GROUP BY category
ORDER BY ProductsCount DESC;


SELECT
    category,
    ROUND(AVG(price), 2) AS avgPrice
FROM products
GROUP BY category
ORDER BY avgPrice DESC;


SELECT
    category,
    COUNT(*) AS ProductsCount
FROM products
GROUP BY category
ORDER BY ProductsCount DESC
LIMIT 1;


SELECT
    category,
    ROUND(AVG(price), 2) AS avgPrice
FROM products
GROUP BY category
ORDER BY avgPrice DESC
LIMIT 5;


SELECT
    id,
    title,
    category,
    rating
FROM products
ORDER BY rating DESC
LIMIT 2;


SELECT
    title,
    price,
    stock
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
AND stock < (
    SELECT AVG(stock)
    FROM products
)
ORDER BY price DESC, stock ASC;


## User Analysis

SELECT
    CONCAT(firstName, ' ', lastName) AS fullName,
    age
FROM users
WHERE age >= 30
ORDER BY age DESC;


SELECT
    gender,
    COUNT(*) AS userCount
FROM users
GROUP BY gender
ORDER BY userCount DESC;


SELECT
    gender,
    ROUND(AVG(age), 2) AS avgAge
FROM users
GROUP BY gender;


SELECT
    a.country,
    COUNT(*) AS userCount
FROM users u
JOIN user_address a
    ON u.id = a.user_id
GROUP BY a.country
ORDER BY userCount DESC;


## Cart Analysis

SELECT *
FROM carts
WHERE total > 1000
ORDER BY total DESC;


SELECT
    ROUND(AVG(total), 2) AS avgCartValue
FROM carts;


SELECT
    SUM(totalQuantity) AS totalQuantity
FROM carts;


SELECT
    c.id AS cart_id,
    COUNT(DISTINCT cp.product_id) AS productCount
FROM carts c
JOIN cart_products cp
    ON c.id = cp.cart_id
GROUP BY c.id
HAVING productCount > 5
ORDER BY productCount DESC;


SELECT
    cart_id,
    SUM(total) AS totalRevenue
FROM cart_products
GROUP BY cart_id
ORDER BY totalRevenue DESC;


SELECT
    c.userId,
    CONCAT(u.firstName, ' ', u.lastName) AS fullName,
    COUNT(DISTINCT cp.product_id) AS differentProducts
FROM carts c
JOIN users u
    ON c.userId = u.id
JOIN cart_products cp
    ON c.id = cp.cart_id
GROUP BY
    c.userId,
    u.firstName,
    u.lastName
ORDER BY differentProducts DESC;


## Customer Spending Analysis

SELECT
    u.id,
    CONCAT(u.firstName, ' ', u.lastName) AS fullName,
    SUM(c.total) AS totalSpending
FROM carts c
JOIN users u
    ON u.id = c.userId
GROUP BY
    u.id,
    u.firstName,
    u.lastName
ORDER BY totalSpending DESC;


SELECT
    u.id,
    CONCAT(u.firstName, ' ', u.lastName) AS fullName,
    ROUND(AVG(c.total), 2) AS avgCartValue
FROM carts c
JOIN users u
    ON c.userId = u.id
GROUP BY
    u.id,
    u.firstName,
    u.lastName
ORDER BY avgCartValue DESC;


SELECT
    u.id,
    CONCAT(u.firstName, ' ', u.lastName) AS fullName,
    SUM(c.total) AS totalSpending,
    RANK() OVER (
        ORDER BY SUM(c.total) DESC
    ) AS spendingRank
FROM carts c
JOIN users u
    ON c.userId = u.id
GROUP BY
    u.id,
    u.firstName,
    u.lastName
ORDER BY spendingRank;


## Product Sales Analysis

SELECT
    product_id,
    title,
    COUNT(*) AS cartOccurrences
FROM cart_products
GROUP BY
    product_id,
    title
ORDER BY cartOccurrences DESC;


SELECT
    p.id,
    p.title,
    SUM(cp.total) AS revenue
FROM products p
JOIN cart_products cp
    ON p.id = cp.product_id
GROUP BY
    p.id,
    p.title
ORDER BY revenue DESC;


SELECT
    p.category,
    SUM(cp.total) AS revenue
FROM products p
JOIN cart_products cp
    ON p.id = cp.product_id
GROUP BY p.category
ORDER BY revenue DESC;


SELECT
    p.id,
    p.title,
    COUNT(DISTINCT c.userId) AS customerCount
FROM cart_products cp
JOIN carts c
    ON cp.cart_id = c.id
JOIN products p
    ON cp.product_id = p.id
GROUP BY
    p.id,
    p.title
ORDER BY customerCount DESC;


SELECT
    CONCAT(u.firstName, ' ', u.lastName) AS fullName,
    cp.title,
    cp.price,
    cp.quantity
FROM cart_products cp
JOIN carts c
    ON cp.cart_id = c.id
JOIN users u
    ON c.userId = u.id
JOIN products p
    ON cp.product_id = p.id
WHERE p.price = (
    SELECT MAX(price)
    FROM products
);


SELECT
    p.id,
    p.title,
    p.category,
    p.price
FROM products p
LEFT JOIN cart_products cp
    ON p.id = cp.product_id
WHERE cp.product_id IS NULL;


## Product Review Analysis

SELECT
    product_id,
    COUNT(*) AS reviewCount
FROM product_reviews
GROUP BY product_id
ORDER BY reviewCount DESC;


SELECT
    product_id,
    ROUND(AVG(rating), 2) AS avgRating
FROM product_reviews
GROUP BY product_id
ORDER BY avgRating DESC;


SELECT
    product_id,
    ROUND(AVG(rating), 2) AS avgRating,
    COUNT(*) AS reviewCount
FROM product_reviews
GROUP BY product_id
HAVING AVG(rating) < (
    SELECT AVG(rating)
    FROM product_reviews
)
AND COUNT(*) >= (
    SELECT COUNT(*)
    FROM product_reviews
) / (
    SELECT COUNT(DISTINCT product_id)
    FROM product_reviews
)
ORDER BY avgRating ASC;


SELECT
    p.category,
    ROUND(AVG(pr.rating), 2) AS avgRating
FROM products p
JOIN product_reviews pr
    ON p.id = pr.product_id
GROUP BY p.category
ORDER BY avgRating DESC;


## Product Revenue and Review Performance

SELECT
    p.id,
    p.title,
    revenue_data.revenue,
    rating_data.avgRating
FROM products p
JOIN (
    SELECT
        product_id,
        SUM(total) AS revenue
    FROM cart_products
    GROUP BY product_id
) AS revenue_data
    ON revenue_data.product_id = p.id
JOIN (
    SELECT
        product_id,
        AVG(rating) AS avgRating
    FROM product_reviews
    GROUP BY product_id
) AS rating_data
    ON rating_data.product_id = p.id
WHERE revenue_data.revenue > (
    SELECT AVG(productRevenue)
    FROM (
        SELECT
            product_id,
            SUM(total) AS productRevenue
        FROM cart_products
        GROUP BY product_id
    ) AS revenue_avg
)
AND rating_data.avgRating < (
    SELECT AVG(productRating)
    FROM (
        SELECT
            product_id,
            AVG(rating) AS productRating
        FROM product_reviews
        GROUP BY product_id
    ) AS rating_avg
)
ORDER BY
    rating_data.avgRating ASC,
    revenue_data.revenue DESC;


## Rank Products by Revenue

SELECT
    p.id,
    p.title,
    SUM(cp.total) AS revenue,
    RANK() OVER (
        ORDER BY SUM(cp.total) DESC
    ) AS revenueRank
FROM products p
JOIN cart_products cp
    ON p.id = cp.product_id
GROUP BY
    p.id,
    p.title
ORDER BY revenueRank;


## Rank Products Within Each Category

SELECT
    p.id,
    p.title,
    p.category,
    SUM(cp.total) AS revenue,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(cp.total) DESC
    ) AS categoryRank
FROM products p
JOIN cart_products cp
    ON p.id = cp.product_id
GROUP BY
    p.id,
    p.title,
    p.category
ORDER BY
    p.category,
    categoryRank;


## Top 3 Products Per Category

SELECT *
FROM (
    SELECT
        p.id,
        p.title,
        p.category,
        SUM(cp.total) AS revenue,
        DENSE_RANK() OVER (
            PARTITION BY p.category
            ORDER BY SUM(cp.total) DESC
        ) AS categoryRank
    FROM products p
    JOIN cart_products cp
        ON p.id = cp.product_id
    GROUP BY
        p.id,
        p.title,
        p.category
) AS ranked_products
WHERE categoryRank <= 3
ORDER BY
    category,
    categoryRank;


## Product Contribution to Category Revenue

WITH product_revenue AS (
    SELECT
        p.id,
        p.title,
        p.category,
        SUM(cp.total) AS productRevenue
    FROM products p
    JOIN cart_products cp
        ON p.id = cp.product_id
    GROUP BY
        p.id,
        p.title,
        p.category
),
category_revenue AS (
    SELECT
        p.category,
        SUM(cp.total) AS categoryRevenue
    FROM products p
    JOIN cart_products cp
        ON p.id = cp.product_id
    GROUP BY p.category
)
SELECT
    pr.title AS productTitle,
    pr.category AS category,
    pr.productRevenue,
    cr.categoryRevenue,
    CONCAT(
        ROUND(
            pr.productRevenue / cr.categoryRevenue * 100,
            2
        ),
        '%'
    ) AS productContribution
FROM product_revenue pr
JOIN category_revenue cr
    ON pr.category = cr.category
ORDER BY
    pr.category,
    pr.productRevenue DESC;


## Product Contribution Using Window Function

SELECT
    p.id,
    p.title,
    p.category,
    SUM(cp.total) AS revenue,
    SUM(SUM(cp.total)) OVER (
        PARTITION BY p.category
    ) AS categoryRevenue,
    CONCAT(
        ROUND(
            SUM(cp.total)
            /
            SUM(SUM(cp.total)) OVER (
                PARTITION BY p.category
            )
            * 100,
            2
        ),
        '%'
    ) AS productContribution
FROM products p
JOIN cart_products cp
    ON p.id = cp.product_id
GROUP BY
    p.id,
    p.title,
    p.category
ORDER BY
    p.category,
    revenue DESC;


## Second Highest Revenue Product in Each Category

SELECT *
FROM (
    SELECT
        p.title,
        p.category,
        SUM(cp.total) AS revenue,
        RANK() OVER (
            PARTITION BY p.category
            ORDER BY SUM(cp.total) DESC
        ) AS categoryRank
    FROM products p
    JOIN cart_products cp
        ON p.id = cp.product_id
    GROUP BY
        p.id,
        p.title,
        p.category
) AS ranked_products
WHERE categoryRank = 2
ORDER BY category;


## LEAD - Next Lower Ranked Product

SELECT
    ranked_products.*,
    LEAD(revenue) OVER (
        PARTITION BY category
        ORDER BY revenue DESC
    ) AS nextProductRevenue
FROM (
    SELECT
        p.title,
        p.category,
        SUM(cp.total) AS revenue,
        RANK() OVER (
            PARTITION BY p.category
            ORDER BY SUM(cp.total) DESC
        ) AS categoryRank
    FROM products p
    JOIN cart_products cp
        ON p.id = cp.product_id
    GROUP BY
        p.id,
        p.title,
        p.category
) AS ranked_products;


## LAG - Previous Higher Ranked Product

SELECT
    ranked_products.*,
    LAG(revenue) OVER (
        PARTITION BY category
        ORDER BY revenue DESC
    ) AS previousProductRevenue
FROM (
    SELECT
        p.title,
        p.category,
        SUM(cp.total) AS revenue,
        RANK() OVER (
            PARTITION BY p.category
            ORDER BY SUM(cp.total) DESC
        ) AS categoryRank
    FROM products p
    JOIN cart_products cp
        ON p.id = cp.product_id
    GROUP BY
        p.id,
        p.title,
        p.category
) AS ranked_products;


## Running Revenue Total Within Category

SELECT
    ranked_products.*,
    SUM(revenue) OVER (
        PARTITION BY category
        ORDER BY revenue DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS runningCategoryRevenue
FROM (
    SELECT
        p.title,
        p.category,
        SUM(cp.total) AS revenue
    FROM products p
    JOIN cart_products cp
        ON p.id = cp.product_id
    GROUP BY
        p.id,
        p.title,
        p.category
) AS ranked_products
ORDER BY
    category,
    revenue DESC;


## Customers Spending Above Average

SELECT *
FROM (
    SELECT
        u.id,
        CONCAT(u.firstName, ' ', u.lastName) AS fullName,
        SUM(c.total) AS totalSpending,
        AVG(SUM(c.total)) OVER () AS averageCustomerSpending
    FROM carts c
    JOIN users u
        ON c.userId = u.id
    GROUP BY
        u.id,
        u.firstName,
        u.lastName
) AS customer_spending
WHERE totalSpending > averageCustomerSpending
ORDER BY totalSpending DESC;


## Customer Spending Deciles

SELECT *
FROM (
    SELECT
        u.id,
        CONCAT(u.firstName, ' ', u.lastName) AS fullName,
        SUM(c.total) AS totalSpending,
        NTILE(10) OVER (
            ORDER BY SUM(c.total) DESC
        ) AS spendingDecile
    FROM carts c
    JOIN users u
        ON c.userId = u.id
    GROUP BY
        u.id,
        u.firstName,
        u.lastName
) AS customer_segments
WHERE spendingDecile = 1
ORDER BY totalSpending DESC;