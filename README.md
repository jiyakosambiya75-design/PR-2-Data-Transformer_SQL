# 🛍️ EquiShop & Staff Analytics Advanced Database Infrastructure 📊

Welcome to the ultimate production-grade **EquiShop & Human Resource Resource Management (HRRM) Relational Infrastructure**! This ecosystem, natively registered as `second_project` 🚀, is a blueprint built to balance heavy business transaction pipelines (B2C Customers & Checkout Operations) with complex internal company data structures (Staff Records, Performance Metrics, and Payroll Tiers).

This architecture serves as an advanced masterclass in relational schema design, demonstrating optimized operational query execution, multi-layered data joining architectures, analytical window configurations, high-precision mathematical metrics, dynamic conditional filters, and time-series extraction methodologies.

---

## 🏗️ System Architecture & Deep Relational Blueprint

The enterprise schema is structured to optimize data isolation while protecting relational dependencies. It splits processing workflows into two functional engines: **The Front-Facing Retail Engine** (Customers & Orders) and **The Back-End Corporate Engine** (Staff Infrastructure).

```
 ┌───────────────────────────┐                 ┌───────────────────────────┐
 │      customer_table       │                 │      employee_table       │
 ├───────────────────────────┤                 ├───────────────────────────┤
 │  PK  │ Customer_ID        │                 │  PK  │ Employee_ID        │
 │      │ First_name         │                 │      │ First_name         │
 │      │ Second_name        │                 │      │ Second_name        │
 │      │ Email              │                 │      │ Department         │
 │      │ Registration_date  │                 │      │ Hire_date          │
 └────────────┬──────────────┘                 │      │ Salary             │
              │                                └───────────────────────────┘
              │ (1:N Relationship)
              ▼
 ┌───────────────────────────┐
 │        order_table        │
 ├───────────────────────────┤
 │  PK  │ Order_ID           │
 │  FK  │ Customer_ID        │
 │      │ Order_date         │
 │      │ Total_Amount       │
 └───────────────────────────┘
```

### 👥 1. Customer Core Profile Layer (`customer_table`)
This entity records metadata for our global user demographic. It acts as the identity foundation layer for downstream conversion metrics, lifetime value (LTV) models, and targeted cohort campaigns.
*   🆔 **`Customer_ID`** `(INT, Primary Key)` ➔ The unique immutable anchor key identifying each customer account globally. It is indexed heavily to speed up search lookups across millions of user rows.
*   👤 **`First_name`** `(VARCHAR(50))` ➔ Captured text recording the user's given name; optimized for personalization engines.
*   👤 **`Second_name`** `(VARCHAR(50))` ➔ Legal family name storage, providing data granularity for precise regional background audits.
*   📧 **`Email`** `(VARCHAR(100))` ➔ Unique digital communication endpoint. Enforces structural uniformity for marketing automation pipelines, customer notifications, and password reset validations.
*   📅 **`Registration_date`** `(DATE)` ➔ The exact day the account was created. Critical for time-to-first-purchase telemetry and onboarding cohort groupings.

### 📦 2. Order Processing Pipeline Layer (`order_table`)
The financial log of the ecosystem. It records transactional records, tracks historical purchases, and enforces cross-entity data integrity using relational constraint mechanics.
*   🪪 **`Order_ID`** `(INT, Primary Key)` ➔ Unique checkout confirmation token, acting as the system transaction ID for order tracking, invoice building, and returns processing.
*   🆔 **`Customer_ID`** `(INT, Foreign Key)` ➔ Maps records back to the `customer_table(Customer_ID)`. Implements cascading security constraints to prevent orphaned sales records and secure full compliance.
*   📅 **`Order_date`** `(DATE)` ➔ High-resolution transaction timestamp marking when the cart checkout was processed. Used to build seasonal analytics and map historical revenue waves.
*   💵 **`Total_Amount`** `(DECIMAL(10,2))` ➔ High-precision monetary datatype containing exact transaction values. Avoids floating-point rounding bugs to ensure accurate balance sheets during financial reviews.

### 💼 3. Human Capital & Corporate ERP Layer (`employee_table`)
An isolated administration wing focused on employee directories, structural distribution, payroll management, and corporate organizational design.
*   🆔 **`Employee_ID`** `(INT, Primary Key)` ➔ Unique corporate ledger number assigned to internal personnel upon onboarding.
*   👤 **`First_name`** / **`Second_name`** `(VARCHAR(50))` ➔ Standardized legal text arrays holding employee names for payroll auditing.
*   🏢 **`Department`** `(VARCHAR(100))` ➔ Cross-department tag separating corporate roles (e.g., Sales, HR, Engineering, Operations) to analyze resource distribution.
*   📅 **`Hire_date`** `(DATE)` ➔ Strategic data point recording corporate tenure. Used to calculate benefits scaling, annual performance reviews, and employee retention timelines.
*   💰 **`Salary`** `(DECIMAL(10,2))` ➔ High-fidelity payroll field tracking base financial packages for organizational budget mapping.

---

## ⚡ Comprehensive Analytical SQL Stack Showcase

This repository contains complex, multi-stage query workflows engineered to extract data insights from raw tables.

### 🔄 Multi-Dimensional Data Merging (Advanced Joins)
*   🤝 **`INNER JOIN` Alignment:** Pairs matching customer clusters with order receipts to reveal active revenue channels, providing deep visibility into conversion funnels.
*   ⬅️ **`LEFT JOIN` Extraction:** Scans the customer directory against transactional records to find shoppers who have registered but never converted, isolating target lists for re-engagement campaigns.
*   ➡️ **`RIGHT JOIN` System Auditing:** Cross-checks orders back against customer tables to find detached files or orphan profiles, verifying data consistency across storage arrays.
*   🌐 **Simulated `FULL OUTER JOIN` (via `UNION`):** Merges Left and Right query outputs into a single comprehensive matrix. This gives teams an all-inclusive map of customer interactions and transactional histories.

### 🧠 Nested Correlated Subqueries & Dynamic Aggregation
*   📉 **Dynamic Revenue Filtering:** Pulls out elite spenders by isolating accounts whose purchase values beat the dynamically calculated company average (`AVG`).
*   🥇 **Compensation Distribution Scans:** Profiles employee datasets to find high-performing team members whose compensation levels sit significantly above departmental or organizational benchmarks.

### ⏳ Time-Series & Temporal Engineering
*   📆 **Granular Extraction Models:** Breaks standard machine time tags down into clean `YEAR()` and `MONTH()` columns to build month-over-month (MoM) and year-over-year (YoY) revenue reports.
*   ⏱️ **Relative Longevity Telemetry:** Uses `DATEDIFF()` alongside the live system clock (`CURRENT_DATE`) to measure customer transaction latency or track precise staff seniority days.
*   🎨 **Human-Centric Formats:** Re-maps mechanical database date blocks into user-friendly regional display formats (`%d-%m-%Y`) for clean executive dashboards.

### 🧼 Advanced String Sanitization & Transformation Mechanics
*   🔗 **Dynamic Concatenation (`CONCAT()`):** Combines isolated first and last name records into single, clean full-name strings for smoother customer communication pipelines.
*   🔄 **Targeted Record Mutation (`REPLACE()`):** Scans columns on the fly to swap outdated database entries for modern corporate updates without changing the raw data layer.
*   🔠 **Case Standardization (`UPPER()` / `LOWER()`):** Normalizes chaotic user-submitted text inputs into clean, consistent uppercase and lowercase profiles for clean layouts.
*   ✂️ **Index Optimization (`TRIM()`):** Strips accidental trailing or leading whitespaces from input rows, preventing validation drops and keeping database lookups fast and reliable.

### 📈 OLAP Window Functions & Modern Business Decision Logic
*   🏃‍♂️ **Cumulative Running Totals (`SUM() OVER`):** Uses analytical window framing to track rolling financial metrics, revealing cumulative revenue patterns over time without needing slow cursor loops.
*   🥇 **Dense Positional Ranking (`RANK() OVER`):** Measures and ranks financial records by transaction size, making it easy to instantly isolate top-tier purchase events.
*   🔠 **`CASE WHEN` Evaluation Frameworks:** Embeds conditional business logic directly into the query run, assigning automated dynamic discounts (`10%`, `5%`, `No Discount`) or mapping employees into clear compensation categories (`HIGH`, `MEDIUM`, `LOW`).

---

## 🚀 Setting Up the Infrastructure Locally

Follow these steps to spin up this relational schema in your environment:

### ⚙️ System Prerequisites
Make sure your workstation has a relational database server installed. This setup is fully optimized for **MySQL (v8.0+)**, **MariaDB (v10.4+)**, or any cloud-hosted enterprise SQL console engine.

### 🛠️ Execution & Deployment Workflows
1. Clone this repository to your development machine or download the core `.sql` query bundle.
2. Fire up your preferred terminal interface or interactive database client suite (e.g., DBeaver, DataGrip, MySQL Workbench).
3. Execute the command script to instantly build the schema tables, inject the sample data records, and run the analytical queries:

```sql
-- Connect to your target database server engine and load the infrastructure file:
SOURCE /your/local/repository/path/second_project_queries.sql;
```

4. Alternatively, open the raw script inside your database terminal window, highlight the entire code block, and hit **Execute Query**! 💥

Explanation video:
https://drive.google.com/file/d/1RwbmpAF5oqLRl2v8Sfqek2sP2KsyAzAw/view?usp=drivesdk

---

## 📝 Open-Source Licensing

Distributed under the corporate **MIT License** 📄. You are completely free to fork, reshape, scale, and optimize this architecture for educational growth, academic research, or production enterprise builds!
