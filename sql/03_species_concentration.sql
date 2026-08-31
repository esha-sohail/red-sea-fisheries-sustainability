- Question: Which species contribute the most to total catch, and is the fishery 
-- becoming more concentrated in fewer species over time?

-- Part A: Top species by total catch (all-time)
SELECT
    scientific_name,
    common_name,
    SUM(tonnes) AS total_catch
FROM fishries_data
GROUP BY scientific_name, common_name
ORDER BY total_catch DESC
LIMIT 10;

-- Part B: Top 5 species' share of total catch, by decade
WITH decade_totals AS (
    SELECT
        (year / 10) * 10 AS decade,
        scientific_name,
        SUM(tonnes) AS species_catch
    FROM fishries_data
    GROUP BY decade, scientific_name
),
ranked AS (
    SELECT
        decade,
        scientific_name,
        species_catch,
        RANK() OVER (PARTITION BY decade ORDER BY species_catch DESC) AS rnk
    FROM decade_totals
),
decade_grand_totals AS (
    SELECT (year / 10) * 10 AS decade, SUM(tonnes) AS decade_total
    FROM fishries_data
    GROUP BY decade
)
SELECT
    r.decade,
    SUM(r.species_catch) AS top5_catch,
    dgt.decade_total,
    ROUND((SUM(r.species_catch) / dgt.decade_total) * 100, 2) AS top5_pct_of_total
FROM ranked r
JOIN decade_grand_totals dgt ON r.decade = dgt.decade
WHERE r.rnk <= 5
GROUP BY r.decade, dgt.decade_total
ORDER BY r.decade;