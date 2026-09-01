-- Question: Has catch composition shifted over time toward smaller/lower-trophic-level 
-- functional groups and away from large predatory fish?
SELECT
    (year / 10) * 10 AS decade,
    functional_group,
    SUM(tonnes) AS total_catch
FROM fishries_data
GROUP BY decade, functional_group
ORDER BY decade, total_catch DESC;
