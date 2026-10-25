SELECT
    truck_id,
    menu_type_id,
    primary_city,
    region,
    country,
    franchise_flag,
    ev_flag,
    truck_opening_date
FROM {{ source('tasty_bytes_pos', 'truck') }}