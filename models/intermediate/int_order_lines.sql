SELECT
    o.order_id,
    o.truck_id,
    o.location_id,
    o.customer_id,
    o.order_channel,
    o.order_ts,
    o.order_currency,
    d.order_detail_id,
    d.menu_item_id,
    d.line_number,
    d.quantity,
    d.unit_price,
    d.price
FROM {{ ref('stg_order_detail') }} AS d
INNER JOIN {{ ref('stg_orders') }} AS o
    ON d.order_id = o.order_id