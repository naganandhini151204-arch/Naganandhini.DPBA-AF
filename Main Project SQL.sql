CREATE DATABASE wildlife_project;
USE wildlife_project;
CREATE TABLE parks (
    Park_Code VARCHAR(50),
    Park_Name VARCHAR(255),
    State VARCHAR(100),
    Acres DECIMAL(15,2),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6)
);
CREATE TABLE species (
    Species_ID VARCHAR(50),
    Park_Code VARCHAR(50),
    Park_Name VARCHAR(255),
    Category VARCHAR(100),
    `Order` VARCHAR(150),
    Family VARCHAR(150),
    Scientific_Name VARCHAR(255),
    Common_Names TEXT,
    Record_Status VARCHAR(100),
    Occurrence VARCHAR(100),
    Nativeness VARCHAR(100),
    Abundance VARCHAR(100),
    Seasonality VARCHAR(150),
    Conservation_Status VARCHAR(100)
);
SHOW TABLES;

DESCRIBE parks;

DESCRIBE species;
SELECT * FROM parks;

SELECT * FROM species;
SELECT COUNT(*) AS Total_Parks
FROM parks;

SELECT COUNT(*) AS Total_Species
FROM species;
SELECT Category, COUNT(*) AS Total_Species
FROM species
GROUP BY Category
ORDER BY Total_Species DESC;

SELECT Nativeness, COUNT(*) AS Total_Count
FROM species
GROUP BY Nativeness;


SELECT State, COUNT(*) AS Total_Parks
FROM parks
GROUP BY State;

SELECT * FROM parks LIMIT 10;
SELECT * FROM species LIMIT 10;

SELECT
    Park_Name,
    COUNT(*) AS Total_Species
FROM species
GROUP BY Park_Name
ORDER BY Total_Species DESC;

SELECT
    Abundance,
    COUNT(*) AS Total_Count
FROM species
GROUP BY Abundance
ORDER BY Total_Count DESC;
SELECT
    Conservation_Status,
    COUNT(*) AS Total_Count
FROM species
GROUP BY Conservation_Status
ORDER BY Total_Count DESC;
SELECT
    Seasonality,
    COUNT(*) AS Total_Count
FROM species
GROUP BY Seasonality
ORDER BY Total_Count DESC;
SELECT
    State,
    COUNT(*) AS Total_Parks
FROM parks
GROUP BY State
ORDER BY Total_Parks DESC;
SELECT
    s.Species_ID,
    s.Scientific_Name,
    s.Category,
    s.Nativeness,
    s.Abundance,
    p.Park_Name,
    p.State,
    p.Acres
FROM species s
INNER JOIN parks p
ON s.Park_Code = p.Park_Code;  
SELECT
    Species_ID,
    COUNT(*) AS Duplicate_Count
FROM species
GROUP BY Species_ID
HAVING COUNT(*) > 1;
SELECT
    COUNT(*) AS Total_Rows,
    SUM(Nativeness IS NULL) AS Null_Nativeness,
    SUM(Abundance IS NULL) AS Null_Abundance,
    SUM(Seasonality IS NULL) AS Null_Seasonality,
    SUM(Conservation_Status IS NULL) AS Null_Conservation
FROM species;