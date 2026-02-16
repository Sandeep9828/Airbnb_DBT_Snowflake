{{ config(
    materialized = 'incremental',
    unique_key = 'booking_id'
) }}

select BOOKING_ID,
        LISTING_ID,
        BOOKING_DATE,


    {{ multiply('booking_amount','nights_booked',2) }} + cleaning_fee + service_fee as total_booking_amount,
    SERVICE_FEE, 
    CLEANING_FEE, 
    BOOKING_STATUS,
    CREATED_AT

from {{ ref('bronze_bookings') }}