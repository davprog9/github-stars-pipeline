SELECT 
    d.date_month as date_day,
    s.repo_id,
    COUNT(*) AS count_commits,
    LAG(count_commits, 12) OVER (PARTITION BY repo_id ORDER BY date_day) AS last_year_count_commit,
    (count_commits / last_year_count_commit) - 1 AS yoy_growth
FROM {{ ref('dim_date') }} AS d
LEFT JOIN {{ ref('fact_commits') }} AS s
ON d.date_month = DATE_TRUNC('month', s.event_date)
GROUP BY date_day, repo_id