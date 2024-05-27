-- Listing count of stars by day and by repo
SELECT 
    event_date, 
    repo_id, 
    COUNT(user) AS "stars"
FROM {{ ref("stg_gharchive") }} 
WHERE event_type = 'Watch'
GROUP BY event_date, repo_id
ORDER BY "stars" ASC