Select DISTINCT 
  user 
  from {{ ref("stg_gharchive") }} 