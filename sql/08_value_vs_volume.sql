-- Question: How has landed value per tonne changed over time, and does it move 
-- with catch volume or diverge from it?
SELECT
    year,
    SUM(tonnes) AS total_catch,
    SUM(landed_value) AS total_landed_value,
    ROUND(SUM(landed_value) / NULLIF(SUM(tonnes), 0), 2) AS value_per_tonne
FROM fishries_data
GROUP BY year
ORDER BY year;