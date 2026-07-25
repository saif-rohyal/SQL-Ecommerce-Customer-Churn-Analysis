<div align="center">

# 🛒 SQL E-Commerce Customer Churn Analysis

### A Complete End-to-End SQL Data Analysis Project

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?style=for-the-badge&logo=mysql)
![Database](https://img.shields.io/badge/Database-MySQL-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

**Analyzing customer behavior, identifying churn patterns, and generating actionable business insights using SQL.**

</div>

---

# 📖 Table of Contents

- [Project Overview](#-project-overview)
- [Business Problem](#-business-problem)
- [Project Objectives](#-project-objectives)
- [Dataset Information](#-dataset-information)
- [Database Schema](#-database-schema)
- [Project Structure](#-project-structure)
- [SQL Skills Demonstrated](#-sql-skills-demonstrated)
- [Analysis Workflow](#-analysis-workflow)
- [Business Questions Answered](#-business-questions-answered)
- [Key Insights](#-key-insights)
- [How to Run the Project](#-how-to-run-the-project)
- [Future Improvements](#-future-improvements)
- [Author](#-author)

---

# 📌 Project Overview

Customer churn is one of the biggest challenges faced by subscription-based and e-commerce businesses. Losing existing customers directly impacts revenue and long-term growth.

This project analyzes customer churn using SQL by exploring customer demographics, purchasing behavior, payment methods, complaints, spending patterns, and customer tenure.

The goal is to identify the factors associated with churn and generate business insights that can help improve customer retention.

---

# 🎯 Business Problem

The company wants to answer questions such as:

- Why are customers leaving?
- Which customer groups are more likely to churn?
- Which regions experience the highest churn?
- Which payment methods are associated with higher churn?
- How much revenue is potentially lost because of churn?
- Which customers should be prioritized for retention campaigns?

---

# 🎯 Project Objectives

- Design a relational database
- Import and validate customer data
- Perform data cleaning
- Conduct exploratory data analysis (EDA)
- Solve business problems using SQL
- Generate actionable business insights
- Demonstrate advanced SQL techniques

---

# 📂 Dataset Information

**Dataset Name**

> E-Commerce Customer Churn Dataset

### Dataset Features

| Feature | Description |
|----------|-------------|
| Customer ID | Unique customer identifier |
| Signup Date | Customer registration date |
| Last Purchase Date | Most recent purchase |
| Age | Customer age |
| Gender | Customer gender |
| Region | Customer location |
| Device Type | Shopping device |
| Preferred Category | Favorite product category |
| Payment Method | Payment option used |
| Total Orders | Number of completed orders |
| Average Order Value | Average purchase amount |
| Total Spent | Lifetime customer spending |
| Complaints Count | Number of complaints |
| Discount Used (%) | Discount usage percentage |
| Tenure (Days) | Customer relationship length |
| Days Since Last Purchase | Customer inactivity |
| Churn Status | Whether the customer churned |

---

# 🗂 Project Structure

```text
SQL-Ecommerce-Customer-Churn-Analysis
│
├── data
│   └── ecommerce_customer_churn.csv
│
├── sql
│   ├── 01_database_setup.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_exploratory_data_analysis.sql
│   ├── 04_business_analysis.sql
│   ├── 05_advanced_analysis.sql
│   └── 06_views_and_reports.sql
│
├── docs
│   ├── Data_Dictionary.md
│   ├── Business_Insights.md
│   └── Project_Report.md
│
├── LICENSE
├── README.md
└── .gitignore
```

---

# 💻 SQL Skills Demonstrated

- Database Design
- Data Definition Language (DDL)
- Data Cleaning
- Data Validation
- Aggregate Functions
- CASE Statements
- GROUP BY
- ORDER BY
- HAVING
- Joins
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Views
- Business Analytics

---

# 🔄 Analysis Workflow

```text
Dataset
      │
      ▼
Database Creation
      │
      ▼
Data Import
      │
      ▼
Data Cleaning
      │
      ▼
Exploratory Data Analysis
      │
      ▼
Business Analysis
      │
      ▼
Advanced SQL
      │
      ▼
Business Insights
```

---

# 📊 Business Questions Answered

- What is the overall churn rate?
- Which region has the highest churn?
- Which product category experiences the highest churn?
- Which payment method has the highest churn?
- Which customers generate the highest revenue?
- Does customer tenure affect churn?
- Do complaints increase churn?
- Which devices are associated with churn?
- What is the revenue loss due to churn?
- Which inactive customers should be targeted first?

---

# 📈 Key Insights

The detailed findings are documented in:

- `docs/Business_Insights.md`

Examples include:

- High-value customers who churn represent significant revenue loss.
- Longer customer tenure is generally associated with lower churn.
- Certain payment methods exhibit higher churn rates.
- Complaint frequency is positively associated with customer churn.

---

# 🚀 How to Run the Project

1. Clone the repository.

```bash
git clone https://github.com/yourusername/SQL-Ecommerce-Customer-Churn-Analysis.git
```

2. Open MySQL Workbench.

3. Execute SQL files in the following order:

```
01_database_setup.sql
02_data_cleaning.sql
03_exploratory_data_analysis.sql
04_business_analysis.sql
05_advanced_analysis.sql
06_views_and_reports.sql
```

4. Review the query outputs.

---

# 🔮 Future Improvements

- Interactive Power BI Dashboard
- Customer Lifetime Value (CLV) Analysis
- Predictive Churn Modeling using Python
- Automated SQL Reports
- Interactive Business Dashboard

---

# 👨‍💻 Author

**Saif Rohyal**

Aspiring Data Analyst | SQL | Excel | Power BI | Python

---

<div align="center">

### ⭐ If you found this project useful, consider giving it a star.

</div>
