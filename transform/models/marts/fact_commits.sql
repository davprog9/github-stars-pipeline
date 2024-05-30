SELECT event_date, repo_id, event_type
FROM {{ ref("stg_gharchive") }} 
WHERE event_type = 'Push'