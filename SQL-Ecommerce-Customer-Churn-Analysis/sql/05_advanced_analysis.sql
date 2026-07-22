/*
===============================================================================
Project      : SQL E-Commerce Customer Churn Analysis
Author       : Saif Rohyal
Database     : MySQL
File         : 05_advanced_analysis.sql

Description:
This script demonstrates advanced SQL techniques used in business analytics.

Topics Covered:
1. Common Table Expressions (CTEs)
2. Window Functions
3. Ranking Functions
4. Customer Segmentation
5. Running Totals
6. Revenue Contribution
7. Percentile Analysis
8. Monthly Customer Trends
9. High-Value Customer Identification
10. Business Intelligence Queries

===============================================================================
*/

USE ecommerce_churn_db;

-- ============================================================================
-- 1. Top 10 Highest Spending Customers
-- ROW_NUMBER()
-- ============================================================================

WITH ranked_customers AS (

SELECT

    customer_id,
    region,
    total_spent,

    ROW_NUMBER() OVER(
        ORDER BY total_spent DESC
    ) AS customer_rank

FROM customer_churn

)

SELECT *

FROM ranked_customers

WHERE customer_rank <= 10;

-- ============================================================================
-- 2. Customer Spending Rank
-- RANK()
-- ============================================================================

SELECT

customer_id,
total_spent,

RANK() OVER(
ORDER BY total_spent DESC
) AS spending_rank

FROM customer_churn;

-- ============================================================================
-- 3. Dense Rank
-- ============================================================================

SELECT

customer_id,
total_spent,

DENSE_RANK() OVER(
ORDER BY total_spent DESC
) AS dense_rank

FROM customer_churn;

-- ============================================================================
-- 4. Revenue Contribution (%)
-- ============================================================================

SELECT

customer_id,

total_spent,

ROUND(
100 * total_spent /
SUM(total_spent) OVER(),
2
) AS revenue_percentage

FROM customer_churn

ORDER BY revenue_percentage DESC;

-- ============================================================================
-- 5. Running Revenue
-- ============================================================================

SELECT

customer_id,

total_spent,

SUM(total_spent) OVER(

ORDER BY total_spent DESC

) AS cumulative_revenue

FROM customer_churn;

-- ============================================================================
-- 6. Average Spending by Region
-- ============================================================================

WITH regional_average AS (

SELECT

region,

ROUND(AVG(total_spent),2) AS average_spending

FROM customer_churn

GROUP BY region

)

SELECT *

FROM regional_average

ORDER BY average_spending DESC;

-- ============================================================================
-- 7. Customers Spending Above Regional Average
-- ============================================================================

WITH regional_avg AS (

SELECT

region,

AVG(total_spent) avg_spending

FROM customer_churn

GROUP BY region

)

SELECT

c.customer_id,

c.region,

c.total_spent

FROM customer_churn c

JOIN regional_avg r

ON c.region = r.region

WHERE c.total_spent > r.avg_spending

ORDER BY c.total_spent DESC;

-- ============================================================================
-- 8. Customer Segmentation
-- ============================================================================

SELECT

customer_id,

total_spent,

CASE

WHEN total_spent >= 5000
THEN 'VIP'

WHEN total_spent >= 2500
THEN 'Premium'

WHEN total_spent >= 1000
THEN 'Regular'

ELSE 'Basic'

END AS customer_segment

FROM customer_churn;

-- ============================================================================
-- 9. Quartile Analysis
-- NTILE()
-- ============================================================================

SELECT

customer_id,

total_spent,

NTILE(4) OVER(
ORDER BY total_spent DESC
) AS spending_quartile

FROM customer_churn;

-- ============================================================================
-- 10. Highest Spending Customer in Each Region
-- ============================================================================

WITH ranked_region AS (

SELECT

customer_id,

region,

total_spent,

ROW_NUMBER() OVER(

PARTITION BY region

ORDER BY total_spent DESC

) AS rn

FROM customer_churn

)

SELECT *

FROM ranked_region

WHERE rn = 1;

-- ============================================================================
-- 11. Churn Percentage by Region
-- ============================================================================

SELECT

region,

COUNT(*) total_customers,

SUM(is_churned) churned_customers,

ROUND(

100 * SUM(is_churned) / COUNT(*),

2

) AS churn_rate

FROM customer_churn

GROUP BY region

ORDER BY churn_rate DESC;

-- ============================================================================
-- 12. Revenue Lost Due to Churn
-- ============================================================================

SELECT

region,

ROUND(

SUM(total_spent),

2

) AS revenue_lost

FROM customer_churn

WHERE is_churned = 1

GROUP BY region

ORDER BY revenue_lost DESC;

-- ============================================================================
-- 13. Most Loyal Customers
-- ============================================================================

SELECT

customer_id,

tenure_days,

total_orders,

total_spent

FROM customer_churn

ORDER BY

tenure_days DESC,

total_spent DESC

LIMIT 20;

-- ============================================================================
-- 14. Recent Active Customers
-- ============================================================================

SELECT

customer_id,

last_purchase_date,

days_since_last_purchase,

total_spent

FROM customer_churn

ORDER BY

days_since_last_purchase ASC

LIMIT 20;

-- ============================================================================
-- 15. Final Verification
-- ============================================================================

SELECT

COUNT(*) AS total_customers,

ROUND(AVG(total_spent),2) AS average_spending,

MAX(total_spent) AS highest_spending,

MIN(total_spent) AS lowest_spending

FROM customer_churn;