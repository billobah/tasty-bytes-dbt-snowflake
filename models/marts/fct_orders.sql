{{ config(
    materialized='incremental',
    unique_key='order_id',
    tags=['daily']
) }}

SELECT
    order_id,
    truck_id,
    location_id,
    customer_id,
    order_channel,
    order_ts,
    CAST(order_ts AS DATE) AS order_date,
    order_currency,
    order_amount,
    order_tax_amount,
    order_discount_amount,
    order_total
FROM {{ ref('stg_orders') }}
{% if is_incremental() %}
WHERE order_ts >= (SELECT DATEADD('day', -3, MAX(order_ts)) FROM {{ this }})
{% else %}
WHERE order_ts >= '{{ var("start_date", "2022-10-01") }}'
{% endif %}