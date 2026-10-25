SELECT
    customer_id,
    city,
    country,
    gender,
    favourite_brand,
    sign_up_date
FROM {{ source('tasty_bytes_customer', 'customer_loyalty') }}