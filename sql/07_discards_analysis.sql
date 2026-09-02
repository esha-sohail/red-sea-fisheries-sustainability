-- Question: What % of total catch is discards, and which gear types/species drive it?

-- Part A: Overall discard %
SELECT
    SUM(CASE WHEN catch_type = 'Discards' THEN tonnes ELSE 0 END) AS total_discards,
    SUM(tonnes) AS total_catch,
    ROUND(
        (SUM(CASE WHEN catch_type = 'Discards' THEN tonnes ELSE 0 END) / SUM(tonnes)) * 100,
    2) AS pct_discards
FROM fishries_data;

-- Part B: Discards by gear type
SELECT
    gear_type,
    SUM(tonnes) AS total_discards
FROM fishries_data
WHERE catch_type = 'Discards'
GROUP BY gear_type
ORDER BY total_discards DESC;

-- Part C: Discards by species
SELECT
    scientific_name,
    common_name,
    SUM(tonnes) AS total_discards
FROM fishries_data
WHERE catch_type = 'Discards'
GROUP BY scientific_name, common_name
ORDER BY total_discards DESC
LIMIT 10;