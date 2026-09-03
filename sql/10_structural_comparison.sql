SELECT
    CASE
        WHEN year BETWEEN 1950 AND 1979 THEN 'Early (1950-1979)'
        WHEN year BETWEEN 1980 AND 2009 THEN 'Middle (1980-2009)'
        WHEN year >= 2010 THEN 'Recent (2010-present)'
    END AS period,
    fishing_sector,
    functional_group,
    SUM(tonnes) AS total_catch
FROM fishries_data
GROUP BY period, fishing_sector, functional_group
ORDER BY period, total_catch DESC;