-- Question: Which fishing sector contributes the most catch, and how has this 
-- sector mix changed over time?
SELECT
    year,
    fishing_sector,
    SUM(tonnes) AS total_catch
FROM fishries_data
GROUP BY year, fishing_sector
ORDER BY year, total_catch DESC;
