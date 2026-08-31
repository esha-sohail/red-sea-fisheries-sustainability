-- Question: Which year recorded the highest total catch, and by what % has catch 
-- declined from that peak to the most recent year?

-- Question: Which year recorded the highest total catch, and by what % has catch 
-- declined from that peak to the most recent year?
WITH yearly_catch AS (
    SELECT year, SUM(tonnes) AS total_catch
    FROM fishries_data
    GROUP BY year
),
peak AS (
    SELECT year AS peak_year, total_catch AS peak_catch
    FROM yearly_catch
    ORDER BY total_catch DESC
    LIMIT 1
),
latest AS (
    SELECT year AS latest_year, total_catch AS latest_catch
    FROM yearly_catch
    ORDER BY year DESC
    LIMIT 1
)
SELECT
    peak.peak_year,
    peak.peak_catch,
    latest.latest_year,
    latest.latest_catch,
    ROUND(((peak.peak_catch - latest.latest_catch) / peak.peak_catch) * 100, 2) AS pct_decline_from_peak
FROM peak, latest;