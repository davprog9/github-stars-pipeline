SELECT 
    d.date_year as date_day,
    s.repo_id,
    COUNT(*) AS count_stars,
    LAG(count_stars, 1) OVER (PARTITION BY repo_id ORDER BY date_day) AS last_year_count_star,
    (count_stars / last_year_count_star) - 1 AS yoy_growth
FROM {{ ref('dim_date_year') }} AS d
LEFT JOIN {{ ref('fact_stars') }} AS s
ON d.date_year = DATE_TRUNC('year', s.event_date)
GROUP BY date_day, repo_id