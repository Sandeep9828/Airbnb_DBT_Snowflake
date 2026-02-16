{{ config(
    materialized = 'incremental',
    
)}}


select * from {{ source('staging', 'bookings') }}

{% if is_incremental() %} 
    where created_at > (select max(created_at) from {{ this}})
{% endif %}