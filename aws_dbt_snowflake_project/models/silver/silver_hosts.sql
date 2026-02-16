{{ config(
    materialized = 'incremental',
    unique_key = 'host_id'
) }}


select 
    host_id,
    replace(host_name, ' ', '_') as host_name,
    host_since,
    is_superhost,
    response_rate,
    case when response_rate >= 90 then 'high'
         when response_rate >= 70 and response_rate < 90 then 'medium'
         else 'low'
    end as response_category,
    created_at
from {{ ref('bronze_hosts') }}