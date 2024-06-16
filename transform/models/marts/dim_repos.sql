SELECT 
    repo_id, 
    repo_name, 
    MIN(event_date) AS start_date,
    LEAD(start_date) OVER (PARTITION BY repo_id ORDER BY start_date ASC) as end_date
FROM {{ ref("stg_gharchive") }}
GROUP BY 1, 2