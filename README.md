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

---

## ⚙️ Data Preparation

1. **Load Dataset:**  
   - Import the `ITAssets.csv` / Excel dataset into Pandas  

2. **Clean and Format:**  
   - Handle missing values  
   - Convert `PurchaseDate`, `LastServiceDate`, `NextServiceDue` to datetime  

3. **Feature Engineering:**  
   - `AssetAge` (Years since purchase)  
   - `DaysSinceLastService` (Maintenance interval tracking)  
   - `DaysUntilDue` (Service urgency indicator)

4. **At-Risk Identification:**  
   - Flag assets where `DaysUntilDue < 30`  

---

## 📈 Key Performance Indicators (KPIs)

| KPI | Description |
|-----|-------------|
| **Total IT Assets** | Total count of assets in inventory |
| **Assets Under Repair** | Assets currently in repair status |
| **Assets Due in Next 30 Days** | Maintenance-critical assets |
| **Average Asset Age** | Helps determine lifecycle planning |

---

## 📊 Insights & Visualizations

The Tableau dashboard includes:

- **Bar Chart:** Asset Distribution by Type  
- **KPI Card:** Assets Due for Service Soon  
- **Packed Bubble Chart:** Assets Under Repair  
- **Heatmap:** Asset Type vs Location  
- **Filters:** By Location & Asset Type  

---

## 🗄 SQL Operations Snapshot

**Query to Identify Assets Due for Maintenance (Next 30 Days):**
```sql
SELECT *
FROM ITAssets
WHERE NextServiceDue BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE())
ORDER BY NextServiceDue ASC;
