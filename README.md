
🛍️ EquiShop & Staff Analytics DB 📊

Welcome to the EquiShop & Staff Analytics Database repository! This project is a production-ready, beautifully structured Relational Database Management System (RDBMS) blueprint named second_project 🚀.
It is engineered to bridge the gap between frontend transactional operations (Customers & Orders) and backend corporate resource management (Employee tracking). Packed with highly optimized queries, this repository serves as a masterclass in SQL—ranging from fundamental data manipulation to advanced analytical engineering.

🏗️ System Architecture & Schema Blueprint

The architecture is divided into two major domains: E-Commerce Operations and Enterprise Resource Planning (ERP). Together, they create a robust relational model designed to eliminate data redundancy and maximize analytical flexibility.
       [ customer_table ] ──(1:N)──> [ order_table ]
               
       [ employee_table ] (Standalone Corporate Directory)

👥 1. Customer Management (customer_table)

Houses the core identities of our client base. It tracks unique identifiers, communication touchpoints, and onboarding lifecycles.
• 🆔 Customer_ID (INT, Primary Key) ➔ Unique system anchor for each consumer.
• 👤 First_name / Second_name (VARCHAR(50)) ➔ Standardized user profile naming.
• 📧 Email (VARCHAR(100)) ➔ Unique communication and digital marketing endpoint.
• 📅 Registration_date (DATE) ➔ Cohort creation marker for tracking customer acquisition retention.

📦 2. Order Fulfilment (order_table)

Captures transactional metadata, driving financial reporting pipelines.
• 🪪 Order_ID (INT, Primary Key) ➔ Unique identifier for every shopping cart checkout.
• 🆔 Customer_ID (INT, Foreign Key) ➔ Establishes strict relational integrity linking back to the shopper.
• 📅 Order_date (DATE) ➔ Timestamp tracking exactly when checkout occurred.
• 💵 Total_Amount (DECIMAL(10,2)) ➔ High-precision financial value recording revenue per basket.

💼 3. Human Capital & Payroll (employee_table)

An isolated database wing engineered for internal corporate structure, resource allocation, and compensation scales.
• 🆔 Employee_ID (INT, Primary Key) ➔ Unique tracking key for internal staff.
• 👤 First_name / Second_name (VARCHAR(50)) ➔ Legal staff profile naming.
• 🏢 Department (VARCHAR(100)) ➔ Operational division alignment (e.g., Sales, HR).
• 📅 Hire_date (DATE) ➔ Seniority tracking marker for benefits, performance reviews, and vesting schedules.
• 💰 Salary (DECIMAL(10,2)) ➔ Financial compensation data for payroll auditing.

⚡ Key SQL Capabilities Demonstrated

This script showcases advanced database queries that turn raw data layers into actionable business intelligence insights.

🔄 Data Joining Strategies

• 🤝 INNER JOIN ➔ Merges matching data profiles to discover active spenders.
• ⬅️ LEFT JOIN / RIGHT JOIN ➔ Maps structural imbalances, catching shoppers without checkouts or detached logs.
• 🌐 Full Outer Replication via UNION ➔ Chains isolated query sets together for a holistic look at the database.

🧠 Deep Analytical Aggregations & Subqueries

• 📉 Dynamic Threshold Filtering ➔ Leverages internal subqueries to pull out elite spenders or high-earning staff members whose financials rise above the dynamically calculated organizational average (AVG).

⏳ Temporal & Chronological Wrangling

• 📆 Time Serialization ➔ Drops strings to pull clean YEAR() and MONTH() flags for micro-segmented sales metrics.
• ⏱️ Relative Longevity Calculations ➔ Uses DATEDIFF() paired with live system updates (CURRENT_DATE) to measure delivery age or buyer stagnation timelines.
• 🎨 Date Reshaping ➔ Polishes standard machine timestamps into human-readable regional formats (%d-%m-%Y).

🧼 String Polishers & Transformation Tools

• 🔗 CONCAT() ➔ Merges separate first and last name columns into unified user strings.
• 🔄 REPLACE() ➔ Scans text arrays to seamlessly modify target records out of raw text blocks.
• 🔠 UPPER() & LOWER() ➔ Corrects user-generated inputs to enforce layout symmetry.
• ✂️ TRIM() ➔ Discards data trailing spaces to secure database indexing integrity.

📈 OLAP Window Functions & Conditional Tiers

• 🏃‍♂️ Running Cumulative Totals ➔ Evaluates cascading transaction metrics over time via SUM() OVER (ORDER BY).
• 🥇 Dense Analytical Sorting ➔ Ranks revenue entries using competitive tracking scores (RANK() OVER).
• 🔀 CASE WHEN Business Decision Matrices ➔ Builds operational runtime code to instantly score client loyalty tiers or flag employee compensation distributions.

🚀 Setting Up the Database

Ready to test this in your environment? Follow these steps to build the infrastructure:

⚙️ Prerequisites

Ensure you have a relational workspace set up. This script is fully compatible with MySQL (v8.0+), MariaDB, or any standard enterprise SQL console engine.

🛠️ Installation & Execution

1. Clone this repository or download the source script.
2. Open your terminal or preferred database client workspace (DBeaver, MySQL Workbench, DataGrip, etc.).
3. Load the project schema by routing to your workspace source file:
sql
-- Connect to your database engine interface and run:
SOURCE /your/local/directory/path/second_project_queries.sql;
Use code with caution.
4. Alternatively, copy the raw code directly into your terminal editor console window and hit execute! 💥

📝 License

Distributed under the open-source MIT License 📄. You are completely free to fork, reshape, scale, and optimize this code for personal growth or professional enterprise builds!
