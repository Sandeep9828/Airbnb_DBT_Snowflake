
{% set configs =[

    {
        'table' : 'AIRBNB.SILVER.SILVER_BOOKINGS',
        'columns' : 'SILVER_bookings.*',
        'alias' : 'SILVER_bookings'
    },

    {
        'table' : 'AIRBNB.SILVER.SILVER_LISTINGS',
        'columns' : 'SILVER_listings.host_id, SILVER_listings.property_type, SILVER_listings.room_type, SILVER_listings.city, SILVER_listings.country, SILVER_listings.accommodates, SILVER_listings.bathrooms, SILVER_listings.bedrooms, SILVER_listings.price_per_night, SILVER_listings.price_category,SILVER_listings.created_at as listing_created_at',
        'alias' : 'SILVER_listings',
        'join_condition' : 'SILVER_bookings.listing_id = SILVER_listings.listing_id'
    },

    {
        'table' : 'AIRBNB.SILVER.SILVER_HOSTS',
        'columns' : 'SILVER_hosts.host_name, SILVER_hosts.host_since, SILVER_hosts.is_superhost, SILVER_hosts.response_rate,SILVER_hosts.response_category,SILVER_hosts.created_at as host_created_at',
        'alias' : 'SILVER_hosts',
        'join_condition' : 'SILVER_listings.host_id = SILVER_hosts.host_id' 
    }

] %}



select 
    {% for config in configs %}
        {{ config.columns }}{% if not loop.last %}, {% endif %}
    {% endfor %}

from  
    {% for config in configs %} 
        {%  if loop.first  %}
            {{ config['table'] }} as {{ config['alias'] }}
        {%  else  %}
            Left join {{ config['table'] }} as {{ config['alias'] }}
            ON {{ config['join_condition'] }}
        {%  endif  %}
    {% endfor %}