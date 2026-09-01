-- Question: What proportion of total catch is unreported each year, and has this 
-- proportion increased or decreased over time?
SELECT
    year,
    SUM(CASE WHEN reporting_status = 'Unreported' THEN tonnes ELSE 0 END) AS unreported_catch,
    SUM(tonnes) AS total_catch,
    ROUND(
        (SUM(CASE WHEN reporting_status = 'Unreported' THEN tonnes ELSE 0 END) / SUM(tonnes)) * 100,
    2) AS pct_unreported
FROM fishries_data
GROUP BY year
ORDER BY year;