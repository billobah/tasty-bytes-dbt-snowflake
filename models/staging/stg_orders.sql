SELECT
    order_id,
    truck_id,
    location_id,
    customer_id,
    order_channel,
    order_ts,
    order_currency,
    order_amount,
    order_tax_amount,
    order_discount_amount,
    order_total
FROM {{ source('tasty_bytes_pos', 'order_header') }}