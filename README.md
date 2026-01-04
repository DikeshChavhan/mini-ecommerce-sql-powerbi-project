# 🛍️ Mini E-Commerce SQL & Power BI Analytics Project

## 📌 Project Overview
This project simulates a real-world Mini E-Commerce system and demonstrates end-to-end data handling — from **database design and SQL analytics** to **Power BI dashboarding**.  
It covers customer orders, products, and sales transactions, and generates business insights such as **revenue trends, top customers, category performance, and AOV**.

The project is designed to reflect **industry-level database design, analytics logic, and reporting workflow**.

---

## 🗃️ Tech Stack
- MySQL — Database & SQL Queries  
- SQL (DDL, DML, DQL)  
- Power BI — Dashboard & Visual Analytics  
- ER Modeling / Data Modeling

---

## 🧩 Database Schema & Tables
The database follows a **normalized transactional schema (3NF)**.

Tables included:
- `customers`
- `products`
- `orders`
- `order_items`

### 🧱 Schema Design Highlights
- Primary & Foreign Keys  
- Referential Integrity  
- ENUM status values  
- Default timestamps  
- Indexing for performance  
- Separate **orders vs order_items** table (real-world design)

---

## 🖼️ ER Diagram
The ERD represents key relationships:
customers (1) ───< orders (1) ───< order_items >─── (1) products

The ER diagram file is included in:
/documents/ER_Diagram_Mini_Ecommerce.png


---

## ⚙️ Key SQL Features Implemented
- Database & table creation (DDL)
- Data insertion & constraints
- Foreign key relationships
- Indexing for faster joins
- Aggregate & KPI queries
- Views for reporting layer
- Stored Procedure for customer-wise orders

Example stored procedure:
```sql
CALL GetCustomerOrders(1);
```
--

📊 Business KPIs & Analytics (SQL + Power BI)

KPIs calculated:

Total Revenue

Total Orders

Total Customers

Average Order Value (AOV)

Category-wise Sales

Revenue by Customer

Monthly Revenue Trend

Top Selling Products

The Power BI dashboard includes:

KPI cards

Revenue by Customer bar chart

Category Revenue donut chart

Monthly Revenue trend line chart

Top Products chart

Interactive slicers & filters

Dashboard file:

/dashboard/Mini_Ecommerce_PowerBI_Dashboard.pbix

📥 How to Run This Project
1️⃣ Import SQL Database

Open MySQL Workbench

Run mini_ecommerce.sql

Verify tables load successfully

2️⃣ Load CSV / Data (optional)

Export or insert sample records

Run analytics queries

3️⃣ Open Power BI Dashboard

Open .pbix file

Refresh data source if required

🧠 Business Insights (Sample Findings)

Electronics category contributes the highest share of revenue

Laptop is the top-revenue product

Rahul Sharma is the highest-value customer

AOV indicates high-value purchases

Delivered orders contribute majority of revenue

(Insights depend on dataset values)

🏢 Why This Project Is Industry-Level

Realistic retail-style schema

Proper normalization & FK constraints

KPI-driven analytics

Reporting layer via View & SP

Dashboard connected to SQL data model

End-to-end workflow (DB → Analytics → BI)

This project demonstrates skills used in:
Data Analyst, SQL Developer, BI Analyst, and MIS roles.

🚀 Future Improvements

Add payments & shipping tables

Add discounts & coupon logic

Add customer lifetime value (CLV)

Expand dataset & automate refresh

Deploy Power BI report online

👤 Author

Dikesh Chavhan
Mini E-Commerce Analytics & SQL Project
