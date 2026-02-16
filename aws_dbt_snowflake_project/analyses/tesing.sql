{% set config = [
    {'table' :'airbnb.gold.obt',
     'columns' : "GOLD_obt.BOOKING_ID, GOLD_obt.LISTING_ID, GOLD_obt.HOST_ID,
                  GOLD_obt.total_booking_amount, GOLD_obt.SERVICE_FEE,
                  GOLD_obt.CLEANING_FEE, GOLD_obt.ACCOMMODATES,
                  GOLD_obt.BEDROOMS, GOLD_obt.BATHROOMS,
                   GOLD_obt.RESPONSE_RATE",
     "alias" : "GOLD_obt" },

    {
        'table' : 'airbnb.gold.dim_listings',
        'columns' : '',
        'alias' : 'dim_listings',
        'join_condition' :
            'GOLD_obt.LISTING_ID = dim_listings.listing_id'
    },

    {
        'table' : 'airbnb.gold.dim_hosts',
        'columns' :'',
        'alias' : 'dim_hosts',
        'join_condition' :
            'GOLD_obt.HOST_ID = dim_hosts.host_id'
    }
] %}


select
    {{ config[0]['columns'] }}

from

{% for tbl in config %}
    {% if loop.first %}
        {{ tbl['table'] }} as {{ tbl['alias'] }}
    {% else %}
        left join {{ tbl['table'] }} as {{ tbl['alias'] }}
        on {{ tbl['join_condition'] }}
    {% endif %}
{% endfor %}