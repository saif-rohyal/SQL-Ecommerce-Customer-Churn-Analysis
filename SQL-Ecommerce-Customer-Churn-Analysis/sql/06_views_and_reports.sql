/*
===============================================================================
Project      : SQL E-Commerce Customer Churn Analysis
Author       : Zaif
Database     : MySQL
File         : 06_views_and_reports.sql

Description:
This script creates reusable SQL Views for reporting and business intelligence.

Views Included:
1. Customer Summary
2. Churn Summary
3. Regional Performance
4. Category Performance
5. High Value Customers
6. Revenue Summary
7. Customer Activity

===============================================================================
*/

USE ecommerce_churn_db;

-- ============================================================================
-- Remove Existing Views
-- ============================================================================

DROP VIEW IF EXISTS vw_customer_summary;
DROP VIEW IF EXISTS vw_churn_summary;
DROP VIEW IF EXISTS vw_region_performance;
DROP VIEW IF EXISTS vw_category_performance;
DROP VIEW IF EXISTS vw_high_value_customers;
DROP VIEW IF EXISTS vw_revenue_summary;
DROP VIEW IF EXISTS vw_customer_activity;

-- ============================================================================
-- View 1 : Customer Summary
-- ============================================================================

CREATE VIEW vw_customer_summary AS

SELECT

    customer_id,
    age,
    gender,
    region,
    preferred_category,
    payment_method,
    total_orders,
    total_spent,
    tenure_days,
    is_churned

FROM customer_churn;

-- ============================================================================
-- View 2 : Churn Summary
-- ============================================================================

CREATE VIEW vw_churn_summary AS

SELECT

    is_churned,
    COUNT(*) AS total_customers,
    ROUND(AVG(total_spent),2) AS avg_customer_spending,
    ROUND(AVG(total_orders),2) AS avg_orders,
    ROUND(AVG(complaints_count),2) AS avg_complaints

FROM customer_churn

GROUP BY is_churned;

-- ============================================================================
-- View 3 : Regional Performance
-- ============================================================================

CREATE VIEW vw_region_performance AS

SELECT

    region,

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    ROUND(100 * SUM(is_churned) / COUNT(*),2) AS churn_rate,

    ROUND(SUM(total_spent),2) AS revenue

FROM customer_churn

GROUP BY region;

-- ============================================================================
-- View 4 : Category Performance
-- ============================================================================

CREATE VIEW vw_category_performance AS

SELECT

    preferred_category,

    COUNT(*) AS customers,

    SUM(total_orders) AS total_orders,

    ROUND(SUM(total_spent),2) AS revenue,

    ROUND(AVG(avg_order_value),2) AS average_order_value

FROM customer_churn

GROUP BY preferred_category;

-- ============================================================================
-- View 5 : High Value Customers
-- ============================================================================

CREATE VIEW vw_high_value_customers AS

SELECT

    customer_id,

    region,

    preferred_category,

    total_orders,

    total_spent,

    is_churned

FROM customer_churn

WHERE total_spent >
(
    SELECT AVG(total_spent)
    FROM customer_churn
);

-- ============================================================================
-- View 6 : Revenue Summary
-- ============================================================================

CREATE VIEW vw_revenue_summary AS

SELECT

    SUM(total_spent) AS total_revenue,

    ROUND(AVG(total_spent),2) AS average_customer_revenue,

    MAX(total_spent) AS highest_customer_spending,

    MIN(total_spent) AS lowest_customer_spending

FROM customer_churn;

-- ============================================================================
-- View 7 : Customer Activity
-- ============================================================================

CREATE VIEW vw_customer_activity AS

SELECT

    customer_id,

    last_purchase_date,

    days_since_last_purchase,

    tenure_days,

    total_orders,

    total_spent

FROM customer_churn;

-- ============================================================================
-- Verify All Views
-- ============================================================================

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';