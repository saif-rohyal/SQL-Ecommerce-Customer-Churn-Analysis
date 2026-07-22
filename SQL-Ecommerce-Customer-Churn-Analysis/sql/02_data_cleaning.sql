/*
===============================================================================
Project      : SQL E-Commerce Customer Churn Analysis
Author       : Saif Rohyal
Database     : MySQL
File         : 02_data_cleaning.sql

Description:
This script performs data quality checks and cleaning before analysis.

Tasks:
1. Check duplicate records
2. Check NULL values
3. Validate numeric fields
4. Validate date fields
5. Standardize text values
6. Remove leading/trailing spaces
7. Verify cleaned dataset

===============================================================================
*/

USE ecommerce_churn_db;

-- ============================================================================
-- Dataset Overview
-- ============================================================================

SELECT
    COUNT(*) AS total_records
FROM customer_churn;

-- ============================================================================
-- Check Duplicate Customer IDs
-- ============================================================================

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customer_churn
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- ============================================================================
-- Check Missing Values
-- ============================================================================

SELECT
    SUM(customer_id IS NULL) AS customer_id_nulls,
    SUM(signup_date IS NULL) AS signup_date_nulls,
    SUM(last_purchase_date IS NULL) AS last_purchase_date_nulls,
    SUM(gender IS NULL) AS gender_nulls,
    SUM(age IS NULL) AS age_nulls,
    SUM(region IS NULL) AS region_nulls,
    SUM(device_type IS NULL) AS device_type_nulls,
    SUM(preferred_category IS NULL) AS preferred_category_nulls,
    SUM(payment_method IS NULL) AS payment_method_nulls,
    SUM(total_orders IS NULL) AS total_orders_nulls,
    SUM(avg_order_value IS NULL) AS avg_order_value_nulls,
    SUM(total_spent IS NULL) AS total_spent_nulls,
    SUM(complaints_count IS NULL) AS complaints_nulls,
    SUM(discount_used_percent IS NULL) AS discount_nulls,
    SUM(tenure_days IS NULL) AS tenure_days_nulls,
    SUM(days_since_last_purchase IS NULL) AS inactive_days_nulls,
    SUM(is_churned IS NULL) AS churn_nulls
FROM customer_churn;

-- ============================================================================
-- Trim Text Columns
-- ============================================================================

UPDATE customer_churn
SET
    gender = TRIM(gender),
    region = TRIM(region),
    device_type = TRIM(device_type),
    preferred_category = TRIM(preferred_category),
    payment_method = TRIM(payment_method);

-- ============================================================================
-- Standardize Gender Values
-- ============================================================================

UPDATE customer_churn
SET gender = 'Male'
WHERE LOWER(gender) = 'male';

UPDATE customer_churn
SET gender = 'Female'
WHERE LOWER(gender) = 'female';

-- ============================================================================
-- Validate Age
-- ============================================================================

SELECT *
FROM customer_churn
WHERE age < 18
   OR age > 100;

-- ============================================================================
-- Validate Orders
-- ============================================================================

SELECT *
FROM customer_churn
WHERE total_orders < 0;

-- ============================================================================
-- Validate Spending
-- ============================================================================

SELECT *
FROM customer_churn
WHERE total_spent < 0
   OR avg_order_value < 0;

-- ============================================================================
-- Validate Complaints
-- ============================================================================

SELECT *
FROM customer_churn
WHERE complaints_count < 0;

-- ============================================================================
-- Validate Discount Percentage
-- ============================================================================

SELECT *
FROM customer_churn
WHERE discount_used_percent < 0
   OR discount_used_percent > 100;

-- ============================================================================
-- Validate Tenure
-- ============================================================================

SELECT *
FROM customer_churn
WHERE tenure_days < 0;

-- ============================================================================
-- Validate Inactive Days
-- ============================================================================

SELECT *
FROM customer_churn
WHERE days_since_last_purchase < 0;

-- ============================================================================
-- Validate Churn Values
-- ============================================================================

SELECT DISTINCT
    is_churned
FROM customer_churn;

-- ============================================================================
-- Check Date Logic
-- Last Purchase should not be before Signup Date
-- ============================================================================

SELECT *
FROM customer_churn
WHERE last_purchase_date < signup_date;

-- ============================================================================
-- Summary Statistics
-- ============================================================================

SELECT
    COUNT(*) AS total_customers,
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    ROUND(AVG(age),2) AS average_age,
    ROUND(AVG(total_spent),2) AS average_spending,
    ROUND(AVG(total_orders),2) AS average_orders
FROM customer_churn;

-- ============================================================================
-- Final Verification
-- ============================================================================

SELECT *
FROM customer_churn
LIMIT 10;