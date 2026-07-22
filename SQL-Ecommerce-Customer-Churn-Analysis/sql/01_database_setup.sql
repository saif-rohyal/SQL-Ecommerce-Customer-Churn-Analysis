/*
===============================================================================
Project      : SQL E-Commerce Customer Churn Analysis
Author       : Saif Rohyal
Database     : MySQL
File         : 01_database_setup.sql

Description:
This script creates the project database and the customer_churn table.

Dataset:
- 5,010 Records
- 17 Columns

===============================================================================
*/

-- ============================================================================
-- Create Database
-- ============================================================================

DROP DATABASE IF EXISTS ecommerce_churn_db;

CREATE DATABASE ecommerce_churn_db;

USE ecommerce_churn_db;

-- ============================================================================
-- Create Main Table
-- ============================================================================

CREATE TABLE customer_churn (

    customer_id INT NOT NULL PRIMARY KEY,

    signup_date DATE NOT NULL,

    last_purchase_date DATE NOT NULL,

    gender VARCHAR(10) NOT NULL,

    age TINYINT UNSIGNED NOT NULL,

    region VARCHAR(50) NOT NULL,

    device_type VARCHAR(30) NOT NULL,

    preferred_category VARCHAR(50) NOT NULL,

    payment_method VARCHAR(30) NOT NULL,

    total_orders INT UNSIGNED NOT NULL,

    avg_order_value DECIMAL(10,2) NOT NULL,

    total_spent DECIMAL(12,2) NOT NULL,

    complaints_count INT UNSIGNED NOT NULL DEFAULT 0,

    discount_used_percent DECIMAL(5,2) NOT NULL,

    tenure_days INT UNSIGNED NOT NULL,

    days_since_last_purchase INT UNSIGNED NOT NULL,

    is_churned BOOLEAN NOT NULL,

    CONSTRAINT chk_age
        CHECK (age BETWEEN 18 AND 100),

    CONSTRAINT chk_total_orders
        CHECK (total_orders >= 0),

    CONSTRAINT chk_avg_order_value
        CHECK (avg_order_value >= 0),

    CONSTRAINT chk_total_spent
        CHECK (total_spent >= 0),

    CONSTRAINT chk_complaints
        CHECK (complaints_count >= 0),

    CONSTRAINT chk_discount
        CHECK (discount_used_percent BETWEEN 0 AND 100),

    CONSTRAINT chk_tenure
        CHECK (tenure_days >= 0),

    CONSTRAINT chk_last_purchase
        CHECK (days_since_last_purchase >= 0),

    CONSTRAINT chk_churn
        CHECK (is_churned IN (0,1))
);

-- ============================================================================
-- Create Indexes
-- ============================================================================

CREATE INDEX idx_region
ON customer_churn(region);

CREATE INDEX idx_gender
ON customer_churn(gender);

CREATE INDEX idx_device_type
ON customer_churn(device_type);

CREATE INDEX idx_category
ON customer_churn(preferred_category);

CREATE INDEX idx_payment_method
ON customer_churn(payment_method);

CREATE INDEX idx_total_spent
ON customer_churn(total_spent);

CREATE INDEX idx_total_orders
ON customer_churn(total_orders);

CREATE INDEX idx_churn
ON customer_churn(is_churned);

CREATE INDEX idx_signup_date
ON customer_churn(signup_date);

CREATE INDEX idx_last_purchase
ON customer_churn(last_purchase_date);

-- ============================================================================
-- Verify Table Structure
-- ============================================================================

DESCRIBE customer_churn;

SHOW INDEX FROM customer_churn;

SHOW TABLES;

SELECT DATABASE() AS current_database;