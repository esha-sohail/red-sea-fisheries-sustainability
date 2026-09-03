-- Question: Where is uncertainty highest — by year, species, or fishing sector — 
-- and which findings should be treated with caution?

-- Part A: Average uncertainty by year
SELECT
    year,
    ROUND(AVG(uncertainty_score), 2) AS avg_uncertainty
FROM fishries_data
GROUP BY year
ORDER BY year;

-- Part B: Average uncertainty by fishing sector
SELECT
    fishing_sector,
    ROUND(AVG(uncertainty_score), 2) AS avg_uncertainty
FROM fishries_data
GROUP BY fishing_sector
ORDER BY avg_uncertainty DESC;

-- Part C: Species with highest average uncertainty (min 10 records to avoid noise)
SELECT
    scientific_name,
    common_name,
    ROUND(AVG(uncertainty_score), 2) AS avg_uncertainty,
    COUNT(*) AS record_count
FROM fishries_data
GROUP BY scientific_name, common_name
HAVING COUNT(*) >= 10
ORDER BY avg_uncertainty DESC nulls last
LIMIT 10