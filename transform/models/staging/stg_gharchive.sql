SELECT 
  CASE
    WHEN type = 'Event' THEN type
    WHEN type LIKE '%Event' THEN LEFT(type, LENGTH(type) - 5)
    ELSE type
  END AS event_type,
  actor.login as user, 
  repo.id as repo_id, 
  repo.name as repo_name, 
  created_at as event_date 
FROM {{ source("my_gharchive_source", "src_gharchive") }}
WHERE event_type not in ('Event', 'Gollum')