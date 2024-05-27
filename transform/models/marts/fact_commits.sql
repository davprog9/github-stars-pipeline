SELECT 
    event_date, 
    repo_id, 
    COUNT(event_type) as "commits"
FROM {{ ref("stg_gharchive") }} 
WHERE event_type = 'Push'
GROUP BY event_date, repo_id