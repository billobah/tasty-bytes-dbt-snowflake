{{ config(
    materialized='incremental',
    unique_key='order_detail_id',
    tags=['daily']
) }}

SELECT
    i.order_detail_id,
    i.order_id,
    i.menu_item_id,
    i.line_number,
    o.truck_id,
    o.location_id,
    o.customer_id,
    o.order_channel,
    o.order_ts,
    o.order_date,
    i.quantity,
    i.unit_price,
    i.price,
    i.unit_cost_of_goods,
    i.cost_of_goods,
    i.gross_profit
FROM {{ ref('int_order_items_priced') }} AS i
INNER JOIN {{ ref('fct_orders') }} AS o
    ON i.order_id = o.order_id
{% if is_incremental() %}
WHERE o.order_ts >= (SELECT DATEADD('day', -3, MAX(order_ts)) FROM {{ this }})
{% else %}
WHERE o.order_ts >= '{{ var("start_date", "2022-10-01") }}'
{% endif %}