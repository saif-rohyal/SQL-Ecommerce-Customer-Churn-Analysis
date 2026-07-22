/*
===============================================================================
Project      : SQL E-Commerce Customer Churn Analysis
Author       : Saif Rohyal
Database     : MySQL
File         : 04_business_analysis.sql

Description:
This script answers real-world business questions related to customer churn,
revenue, customer behavior, complaints, payment methods, and retention.

===============================================================================
*/

USE ecommerce_churn_db;

-- ============================================================================
-- Business Question 1
-- Overall Customer Churn Rate
-- ============================================================================

SELECT
    COUNT(*) AS total_customers,
    SUM(is_churned) AS churned_customers,
    ROUND((SUM(is_churned) / COUNT(*)) * 100,2) AS churn_rate_percentage
FROM customer_churn;

-- ============================================================================
-- Business Question 2
-- Customer Distribution by Region
-- ============================================================================

SELECT
    region,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY region
ORDER BY total_customers DESC;

-- ============================================================================
-- Business Question 3
-- Churn Rate by Region
-- ============================================================================

SELECT
    region,
    COUNT(*) AS total_customers,
    SUM(is_churned) AS churned_customers,
    ROUND((SUM(is_churned)/COUNT(*))*100,2) AS churn_rate
FROM customer_churn
GROUP BY region
ORDER BY churn_rate DESC;

-- ============================================================================
-- Business Question 4
-- Churn Rate by Gender
-- ============================================================================

SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(is_churned) AS churned_customers,
    ROUND((SUM(is_churned)/COUNT(*))*100,2) AS churn_rate
FROM customer_churn
GROUP BY gender;

-- ============================================================================
-- Business Question 5
-- Churn by Device Type
-- ============================================================================

SELECT
    device_type,
    COUNT(*) AS customers,
    SUM(is_churned) AS churned_customers,
    ROUND((SUM(is_churned)/COUNT(*))*100,2) AS churn_rate
FROM customer_churn
GROUP BY device_type
ORDER BY churn_rate DESC;

-- ============================================================================
-- Business Question 6
-- Churn by Preferred Category
-- ============================================================================

SELECT
    preferred_category,
    COUNT(*) AS customers,
    SUM(is_churned) AS churned_customers,
    ROUND((SUM(is_churned)/COUNT(*))*100,2) AS churn_rate
FROM customer_churn
GROUP BY preferred_category
ORDER BY churn_rate DESC;

-- ============================================================================
-- Business Question 7
-- Churn by Payment Method
-- ============================================================================

SELECT
    payment_method,
    COUNT(*) AS customers,
    SUM(is_churned) AS churned_customers,
    ROUND((SUM(is_churned)/COUNT(*))*100,2) AS churn_rate
FROM customer_churn
GROUP BY payment_method
ORDER BY churn_rate DESC;

-- ============================================================================
-- Business Question 8
-- Average Spending of Churned vs Active Customers
-- ============================================================================

SELECT
    is_churned,
    ROUND(AVG(total_spent),2) AS avg_total_spent,
    ROUND(AVG(avg_order_value),2) AS avg_order_value,
    ROUND(AVG(total_orders),2) AS avg_orders
FROM customer_churn
GROUP BY is_churned;

-- ============================================================================
-- Business Question 9
-- Revenue Lost Due to Churn
-- ============================================================================

SELECT
    ROUND(SUM(total_spent),2) AS revenue_lost
FROM customer_churn
WHERE is_churned = 1;

-- ============================================================================
-- Business Question 10
-- Revenue Lost by Region
-- ============================================================================

SELECT
    region,
    ROUND(SUM(total_spent),2) AS revenue_lost
FROM customer_churn
WHERE is_churned = 1
GROUP BY region
ORDER BY revenue_lost DESC;

-- ============================================================================
-- Business Question 11
-- Top 10 Highest Spending Churned Customers
-- ============================================================================

SELECT
    customer_id,
    region,
    total_orders,
    total_spent
FROM customer_churn
WHERE is_churned = 1
ORDER BY total_spent DESC
LIMIT 10;

-- ============================================================================
-- Business Question 12
-- Complaint Analysis
-- ============================================================================

SELECT
    is_churned,
    ROUND(AVG(complaints_count),2) AS avg_complaints
FROM customer_churn
GROUP BY is_churned;

-- ============================================================================
-- Business Question 13
-- Discount Usage vs Churn
-- ============================================================================

SELECT
    is_churned,
    ROUND(AVG(discount_used_percent),2) AS avg_discount_used
FROM customer_churn
GROUP BY is_churned;

-- ============================================================================
-- Business Question 14
-- Average Customer Tenure
-- ============================================================================

SELECT
    is_churned,
    ROUND(AVG(tenure_days),2) AS average_tenure
FROM customer_churn
GROUP BY is_churned;

-- ============================================================================
-- Business Question 15
-- Inactive Customers (More Than 90 Days)
-- ============================================================================

SELECT
    customer_id,
    region,
    total_spent,
    days_since_last_purchase
FROM customer_churn
WHERE days_since_last_purchase > 90
ORDER BY days_since_last_purchase DESC;

-- ============================================================================
-- Business Question 16
-- Top 10 Highest Revenue Customers
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
-- Business Question 17
-- Customer Age Distribution
-- ============================================================================

SELECT
CASE
    WHEN age < 25 THEN '18-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
END AS age_group,

COUNT(*) AS total_customers,

SUM(is_churned) AS churned_customers,

ROUND((SUM(is_churned)/COUNT(*))*100,2) AS churn_rate

FROM customer_churn

GROUP BY age_group

ORDER BY age_group;

-- ============================================================================
-- Business Question 18
-- Customer Lifetime Value Approximation
-- ============================================================================

SELECT
    customer_id,
    total_orders,
    avg_order_value,
    total_spent
FROM customer_churn
ORDER BY total_spent DESC
LIMIT 20;

-- ============================================================================
-- Business Question 19
-- Most Active Customers
-- ============================================================================

SELECT
    customer_id,
    total_orders,
    total_spent
FROM customer_churn
ORDER BY total_orders DESC
LIMIT 20;

-- ============================================================================
-- Business Question 20
-- Business Summary KPI
-- ============================================================================

SELECT
    COUNT(*) AS total_customers,
    SUM(is_churned) AS churned_customers,
    ROUND(SUM(total_spent),2) AS total_revenue,
    ROUND(AVG(total_spent),2) AS average_customer_revenue,
    ROUND(AVG(total_orders),2) AS average_orders
FROM customer_churn;