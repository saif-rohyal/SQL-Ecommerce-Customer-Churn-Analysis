/*
===============================================================================
Project      : SQL E-Commerce Customer Churn Analysis
Author       : Saif Rohyal
Database     : MySQL
File         : 03_exploratory_data_analysis.sql

Description:
This script performs Exploratory Data Analysis (EDA) to understand customer
demographics, purchasing behavior, spending patterns, and churn distribution.

===============================================================================
*/

USE ecommerce_churn_db;

-- ============================================================================
-- Dataset Overview
-- ============================================================================

SELECT COUNT(*) AS total_customers
FROM customer_churn;

SELECT *
FROM customer_churn
LIMIT 10;

-- ============================================================================
-- Customer Demographics
-- ============================================================================

-- Gender Distribution
SELECT
    gender,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY gender
ORDER BY total_customers DESC;

-- Age Statistics
SELECT
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    ROUND(AVG(age),2) AS average_age
FROM customer_churn;

-- Age Group Distribution
SELECT
CASE
    WHEN age < 25 THEN '18-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
END AS age_group,

COUNT(*) AS customers

FROM customer_churn

GROUP BY age_group

ORDER BY age_group;

-- ============================================================================
-- Regional Analysis
-- ============================================================================

SELECT
    region,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY region
ORDER BY customers DESC;

-- ============================================================================
-- Device Analysis
-- ============================================================================

SELECT
    device_type,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY device_type
ORDER BY customers DESC;

-- ============================================================================
-- Preferred Product Category
-- ============================================================================

SELECT
    preferred_category,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY preferred_category
ORDER BY customers DESC;

-- ============================================================================
-- Payment Method Analysis
-- ============================================================================

SELECT
    payment_method,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY payment_method
ORDER BY customers DESC;

-- ============================================================================
-- Purchase Behavior
-- ============================================================================

SELECT
    MIN(total_orders) AS minimum_orders,
    MAX(total_orders) AS maximum_orders,
    ROUND(AVG(total_orders),2) AS average_orders
FROM customer_churn;

SELECT
    MIN(avg_order_value) AS minimum_order_value,
    MAX(avg_order_value) AS maximum_order_value,
    ROUND(AVG(avg_order_value),2) AS average_order_value
FROM customer_churn;

SELECT
    MIN(total_spent) AS minimum_spent,
    MAX(total_spent) AS maximum_spent,
    ROUND(AVG(total_spent),2) AS average_spent
FROM customer_churn;

-- ============================================================================
-- Customer Tenure
-- ============================================================================

SELECT
    MIN(tenure_days) AS minimum_tenure,
    MAX(tenure_days) AS maximum_tenure,
    ROUND(AVG(tenure_days),2) AS average_tenure
FROM customer_churn;

-- ============================================================================
-- Customer Activity
-- ============================================================================

SELECT
    MIN(days_since_last_purchase) AS minimum_days,
    MAX(days_since_last_purchase) AS maximum_days,
    ROUND(AVG(days_since_last_purchase),2) AS average_days
FROM customer_churn;

-- ============================================================================
-- Complaints Analysis
-- ============================================================================

SELECT
    MIN(complaints_count) AS minimum_complaints,
    MAX(complaints_count) AS maximum_complaints,
    ROUND(AVG(complaints_count),2) AS average_complaints
FROM customer_churn;

-- ============================================================================
-- Discount Usage
-- ============================================================================

SELECT
    MIN(discount_used_percent) AS minimum_discount,
    MAX(discount_used_percent) AS maximum_discount,
    ROUND(AVG(discount_used_percent),2) AS average_discount
FROM customer_churn;

-- ============================================================================
-- Churn Distribution
-- ============================================================================

SELECT
    is_churned,
    COUNT(*) AS customers,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM customer_churn),2) AS percentage
FROM customer_churn
GROUP BY is_churned;

-- ============================================================================
-- Top 10 Highest Spending Customers
-- ============================================================================

SELECT
    customer_id,
    region,
    total_orders,
    total_spent
FROM customer_churn
ORDER BY total_spent DESC
LIMIT 10;

-- ============================================================================
-- Top 10 Most Active Customers
-- ============================================================================

SELECT
    customer_id,
    total_orders,
    total_spent
FROM customer_churn
ORDER BY total_orders DESC
LIMIT 10;

-- ============================================================================
-- Summary Statistics
-- ============================================================================

SELECT

    COUNT(*) AS total_customers,

    ROUND(AVG(age),2) AS average_age,

    ROUND(AVG(total_orders),2) AS average_orders,

    ROUND(AVG(avg_order_value),2) AS average_order_value,

    ROUND(AVG(total_spent),2) AS average_customer_spending,

    ROUND(AVG(tenure_days),2) AS average_tenure,

    ROUND(AVG(days_since_last_purchase),2) AS average_inactive_days

FROM customer_churn;