# 🛠️ IT Asset Maintenance Forecasting

### 📊 Data Analytics & Forecasting Project using Python, MS SQL & Tableau

![Python](https://img.shields.io/badge/Python-Data%20Analysis-blue)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Processing-orange)
![SQL Server](https://img.shields.io/badge/MS%20SQL-Database-green)
![Tableau](https://img.shields.io/badge/Tableau-Dashboarding-blueviolet)

---

## 📘 Project Overview

The **IT Asset Maintenance Forecasting** project focuses on analyzing and forecasting maintenance schedules for organizational IT assets such as laptops, desktops, printers, and network devices.  
The goal is to **reduce downtime**, **plan maintenance proactively**, and **optimize IT asset lifecycle costs**.

---

## 🧠 Objectives

- Track and analyze the **current condition of IT assets**
- Identify **assets due for maintenance** in the next 30 days
- Analyze **failure and repair patterns**
- Visualize insights via a **Tableau maintenance dashboard**
- Support **data-driven maintenance planning**

---

## 🧰 Technology Stack

| Component | Technology / Library | Purpose |
|----------|----------------------|---------|
| **Programming Language** | Python | Data cleaning & feature engineering |
| **Libraries** | Pandas, NumPy, Matplotlib, Seaborn | Data processing & visualization |
| **Database** | Microsoft SQL Server | Centralized data storage |
| **Visualization** | Tableau | Interactive dashboard creation |
| **Environment** | Jupyter Notebook / VS Code | Development workspace |
# IT Asset Maintenance Forecasting


## 🚀 Project Workflow

The project is executed in three main phases:

### Phase 1: Data Analysis & Forecasting (Python)

This phase focuses on data preparation, exploratory data analysis (EDA), and identifying key trends for maintenance.

* **Data Cleaning:**
    * Loaded the `IT_ASSESMENT.xlsx - ITAssets.csv` dataset.
    * Handled all missing or null values.
    * Converted `PurchaseDate`, `LastServiceDate`, and `NextServiceDue` to proper datetime objects.
* **Feature Engineering:**
    * Created new time-based features:
        * `AssetAge`: (Current Date - PurchaseDate)
        * `DaysSinceLastService`: (Current Date - LastServiceDate)
        * `DaysUntilDue`: (NextServiceDue - Current Date)
* **Exploratory Data Analysis (EDA):**
    * Analyzed and plotted the distribution of `AssetType` (Laptop, Printer, etc.).
    * Calculated the current failure rate by analyzing the `Status` column (`Working` vs. `Under Repair`).
    * Calculated descriptive statistics for `AssetAge` and `DaysSinceLastService` to understand the average asset lifespan and service cycle.
* **Maintenance Schedule Analysis:**
    * Filtered the data to create a list of 'At-Risk' assets (e.g., `DaysUntilDue` < 30 days).
    * Visualized the count of assets due for maintenance, grouped by `AssetType` and `Location`.

### Phase 2: Database Management (MS SQL)

This phase establishes a centralized SQL database for robust data storage and efficient, reusable querying.

* **Schema Creation:**
    * Wrote a `CREATE TABLE` script to define the `ITAssets` table with appropriate data types (e.g., `VARCHAR`, `DATE`, `INT`).
* **Data Ingestion:**
    * Exported the cleaned DataFrame from Phase 1 to a new CSV.
    * Used the SQL Server Import Wizard (or `INSERT` commands) to populate the `ITAssets` table.
* **Aggregate Querying:**
    * Wrote SQL queries using `COUNT` and `GROUP BY` to analyze asset distribution by `AssetType` and `Location` directly from the database.
* **'At-Risk' Asset Querying:**
    * Developed a reusable SQL query using a `WHERE` clause to select all assets due for maintenance within the next 30 days (`WHERE NextServiceDue BETWEEN GETDATE() AND GETDATE() + 30`).
    * Results are ordered by `NextServiceDue` (ascending) to prioritize the most urgent tasks.

### Phase 3: Visualization & Dashboarding (Tableau)

The final phase involves creating an intuitive and interactive dashboard to communicate maintenance forecasts and asset status to stakeholders.

* **Data Connection:**
    * Established a live data source connection from Tableau to the MS SQL Server `ITAssets` table.
* **Core Visualizations:**
    * **Bar Chart:** Asset Distribution by Type.
    * **KPI Card:** Total count of 'Assets Due for Maintenance (Next 30 Days)'.
    * **Packed Bubble Chart:** 'Assets Under Repair' (sized by count, colored by `AssetType`).
    * **Heatmap:** Asset Type vs. Location (showing count of assets).
    * **Map:** Geographic visualization of assets by `Location`.
* **Dashboard Assembly & Interactivity:**
    * Combined all worksheets into a single, cohesive dashboard.
    * Implemented "Filter" controls for `Location` and `AssetType`.
    * Configured filters to apply to all worksheets, allowing managers to drill down into specific data (e.g., see all 'Laptops' in 'Pune' due for service) and have all charts update in real-time.

---

## 🔧 How to Use

1.  **Python:** Run the data cleaning and feature engineering scripts (e.g., in a Jupyter Notebook) to produce the cleaned dataset.
2.  **MS SQL:**
    * Execute the `CREATE TABLE` script in your SQL Server instance.
    * Import the cleaned CSV file into the newly created `ITAssets` table.
    * Use the provided SQL queries to retrieve aggregated insights or 'At-Risk' asset lists.
3.  **Tableau:**
    * Open the `.twbx` Tableau workbook.
    * Edit the data source connection to point to your MS SQL Server instance and the `ITAssets` table.
    * Interact with the dashboard filters to explore the maintenance schedule.
