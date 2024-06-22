{{ dbt_utils.date_spine( 
  datepart='year', 
  start_date="cast('2011-01-01' as date)", 
  end_date="cast('2024-01-01' as date)" 
  ) 
}}