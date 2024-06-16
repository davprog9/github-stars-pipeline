SELECT 
    d.date_month as date_day,
    s.repo_id,
    COUNT(*) AS count_stars,
    LAG(count_stars, 12) OVER (PARTITION BY repo_id ORDER BY date_day) AS last_year_count_star,
    (count_stars / last_year_count_star) - 1 AS yoy_growth
FROM {{ ref('dim_date') }} AS d
LEFT JOIN {{ ref('fact_stars') }} AS s
ON d.date_month = DATE_TRUNC('month', s.event_date)
GROUP BY date_day, repo_id