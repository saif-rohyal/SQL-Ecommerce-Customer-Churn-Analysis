# Data Dictionary
## SQL E-Commerce Customer Churn Analysis

---

# Overview

This document describes each field in the **E-Commerce Customer Churn** dataset used throughout this project.

| Dataset Information | Value |
|---------------------|-------|
| Total Records | 5,010 |
| Total Columns | 17 |
| Database | MySQL |
| Primary Key | `customer_id` |

---

# Column Definitions

| Column | Data Type | Description |
|---------|-----------|-------------|
| **customer_id** | INT | Unique identifier assigned to each customer. |
| **signup_date** | DATE | Date the customer registered on the platform. |
| **last_purchase_date** | DATE | Date of the customer's most recent purchase. |
| **gender** | VARCHAR(10) | Customer gender (Male/Female). |
| **age** | TINYINT | Customer age in years. |
| **region** | VARCHAR(50) | Geographic region where the customer resides. |
| **device_type** | VARCHAR(30) | Device primarily used for shopping (Mobile, Desktop, Tablet, etc.). |
| **preferred_category** | VARCHAR(50) | Product category most frequently purchased by the customer. |
| **payment_method** | VARCHAR(30) | Customer's preferred payment method. |
| **total_orders** | INT | Total number of completed orders. |
| **avg_order_value** | DECIMAL(10,2) | Average monetary value of each order. |
| **total_spent** | DECIMAL(12,2) | Total amount spent by the customer. |
| **complaints_count** | INT | Total number of customer complaints submitted. |
| **discount_used_percent** | DECIMAL(5,2) | Percentage of purchases made using discounts or promotional offers. |
| **tenure_days** | INT | Number of days since customer registration. |
| **days_since_last_purchase** | INT | Number of days since the customer's last purchase. |
| **is_churned** | BOOLEAN | Customer churn indicator (0 = Active, 1 = Churned). |

---

# Business Metrics

## Customer Lifetime Value (Approximation)

Estimated using:

```
total_spent
```

---

## Customer Activity

Measured using:

```
days_since_last_purchase
```

Lower values indicate more recently active customers.

---

## Customer Loyalty

Measured using:

```
tenure_days
```

Customers with higher tenure generally demonstrate stronger loyalty.

---

## Revenue

Revenue metrics are primarily derived from:

- total_spent
- avg_order_value
- total_orders

---

## Customer Retention

Retention analysis is based on:

```
is_churned
```

- **0** = Active Customer
- **1** = Churned Customer

---

# Data Quality Checks

The dataset was validated using SQL to ensure:

- Duplicate customer IDs were identified.
- Missing values were checked.
- Numeric fields contained valid values.
- Discount percentages remained between 0 and 100.
- Dates followed logical business rules.
- Text fields were standardized.
- Customer IDs remained unique.

---

# Relationships Between Fields

Some important relationships used throughout the project include:

| Business Question | Relevant Columns |
|-------------------|------------------|
| Customer Churn | `is_churned`, `days_since_last_purchase`, `complaints_count` |
| Revenue Analysis | `total_spent`, `avg_order_value`, `total_orders` |
| Customer Demographics | `age`, `gender`, `region` |
| Product Preferences | `preferred_category` |
| Payment Analysis | `payment_method` |
| Customer Loyalty | `tenure_days` |
| Regional Performance | `region`, `total_spent`, `is_churned` |

---

# Notes

- All monetary values are stored as **DECIMAL** for accuracy.
- Dates use the **DATE** data type.
- Customer IDs are unique and serve as the primary key.
- The dataset supports customer segmentation, churn prediction, revenue analysis, and business intelligence reporting.

---

# Author

**Saif Rohyal**

SQL • Data Analytics • Business Intelligence