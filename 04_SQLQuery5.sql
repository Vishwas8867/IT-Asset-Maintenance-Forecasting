-- Create table to store IT asset and maintenance details
CREATE TABLE ITAssets (
    AssetID VARCHAR(50) PRIMARY KEY,      -- Unique asset identifier
    AssetType VARCHAR(100),               -- Category (Laptop, Desktop, Printer, etc.)
    PurchaseDate DATE,                    -- Date asset was purchased
    LastServiceDate DATE,                 -- Most recent service/maintenance date
    NextServiceDue DATE,                  -- Scheduled next service date
    Status VARCHAR(50),                   -- Current operational status
    Location VARCHAR(100),                -- Physical location / department
    AssetAge INT,                         -- Asset age (in years)
    DaysSinceLastService INT,             -- Days elapsed since last service
    DaysUntilDue INT                      -- Days remaining until next service
);

-- Insert data from staging sheet (imported Excel)
INSERT INTO ITAssets (
    AssetID, AssetType, PurchaseDate, LastServiceDate, NextServiceDue,
    Status, Location, AssetAge, DaysSinceLastService, DaysUntilDue
)
SELECT
    AssetID, AssetType, PurchaseDate, LastServiceDate, NextServiceDue,
    Status, Location, AssetAge, DaysSinceLastService, DaysUntilDue
FROM Sheet1$;

-- View all asset records
SELECT * 
FROM ITAssets;

-- Count total assets grouped by type and location
SELECT 
    AssetType,
    Location,
    COUNT(*) AS TotalAssets
FROM ITAssets
GROUP BY AssetType, Location
ORDER BY AssetType, Location;

-- Assets due for service in the next 30 days
SELECT *
FROM ITAssets
WHERE NextServiceDue BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE());

-- Upcoming service schedule sorted by nearest due date
SELECT NextServiceDue
FROM ITAssets
ORDER BY NextServiceDue ASC;